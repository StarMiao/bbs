package com.starmiao.bbs.controller;

import com.starmiao.bbs.biz.CommentBiz;
import com.starmiao.bbs.biz.GlobalBiz;
import com.starmiao.bbs.biz.PostBiz;
import com.starmiao.bbs.biz.UserBiz;
import com.starmiao.bbs.entity.Comment;
import com.starmiao.bbs.entity.Post;
import com.starmiao.bbs.entity.User;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import static com.starmiao.bbs.global.Content.PAGE_SIZE;

@Controller("globalController")
public class GlobalController {

    @Autowired
    GlobalBiz globalBiz;
    @Autowired
    PostBiz postBiz;
    @Autowired
    UserBiz userBiz;
    @Autowired
    CommentBiz commentBiz;

    @RequestMapping("to_register")
    public String toRegister(){
        return "register";
    }

    @RequestMapping("/register")
    public String register(HttpServletRequest request) throws FileUploadException, UnsupportedEncodingException {
        //globalBiz.register(username,password,email);
        User user = new User();
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        List<FileItem> list = upload.parseRequest(request);
        /* 如果是普通表单项，则设置到对应的属性中*/
        for(FileItem item:list){
            if(item.isFormField()){
                if(item.getFieldName().equals("username"))
                    user.setUsername(item.getString("UTF-8"));
                if(item.getFieldName().equals("password"))
                    user.setPassword(item.getString("UTF-8"));
                if(item.getFieldName().equals("email"))
                    user.setEmail(item.getString("UTF-8"));
            }else{
                /* 如果是文件项，则获取文件后缀名，创建新的文件名，并写入文件*/
                if(item.getFieldName().equals("file")){
                    if(item.getSize()<=100) continue;
                    String rootPath = request.getServletContext().getRealPath("/");
                    String path = item.getName();
                    String type = ".jpg";
                    if(path.indexOf(".")!=-1){
                        type = path.substring(path.lastIndexOf("."));
                    }
                    path = "/upload/"+System.currentTimeMillis()+type;
                    try {
                        item.write(new File(rootPath+path));
                        //发布到target路径下,将相对路径path保存在数据库中,用来在前台显示
                        user.setPath(path);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        userBiz.add(user);
        return "redirect:to_login";
    }

    @RequestMapping("to_login")
    public String toLogin(){
        return "login";
    }

    @RequestMapping("to_login_noPermission")
    public String toLoginMsg(HttpServletRequest request){
        request.setAttribute("msg","请先登录后,再发送帖子哦");
        return "login";
    }

    @RequestMapping("/login")
    public String login(HttpServletRequest request,@RequestParam String username, @RequestParam String password){
        User user = globalBiz.login(username,password);
        if (user == null) {
            request.setAttribute("msg","用户不存在或密码不正确");
            return "login";
        }
        request.getSession().setAttribute("user",user);
        return "redirect:home";
    }

    //跳转回首页
    @RequestMapping("/home")
    public String home(@RequestParam(required = false) String method,
                       @RequestParam(defaultValue = "1") int page,
                       @RequestParam(required = false) String username,Map<String, Object> map){
        int postNum = postBiz.getPostNum();
        int totalPage = 0;
        //判断帖子排序的方法
        //判断方法是否为空要放第一个,否则可能产生空指针异常
        if(method == null){
            map.put("posts",postBiz.getAllToHome((page-1)*PAGE_SIZE));
            totalPage = postNum/PAGE_SIZE;
        }else if(method.equals("cnum")){
            map.put("posts",postBiz.getAllToHomeOrderByCommentNum((page-1)*PAGE_SIZE));
            totalPage = postNum/PAGE_SIZE;
        }else if (method.equals("mypost")){
            //判断method是否为mypost,如果是要修改总页数
            totalPage =postBiz.getMyPostNum(username)/PAGE_SIZE;
            map.put("posts",postBiz.getAllToHomeMyPost(username,(page-1)*PAGE_SIZE));
        }
        //如果贴子数除以一页的帖子数有余数,总页面数要+1
        if(postNum%PAGE_SIZE != 0){
            totalPage ++;
        }
        //传入当前方法名
        map.put("method",method);
        //传入当前页
        map.put("page",page);
        map.put("totalPage",totalPage);
        map.put("postNum",postNum);
        map.put("userNum",userBiz.getUserNum());
        return "home";
    }

    //跳转到具体帖子页面
    @RequestMapping(value = "/to_post")
    public String toPost(int id,Map<String,Object> map){
        map.put("post",postBiz.get(id));
        map.put("postNum",postBiz.getPostNum());
        map.put("userNum",userBiz.getUserNum());
        //这里传入的是post的id
        map.put("commentNum",commentBiz.getCommentNum(id));
        map.put("comments",commentBiz.getByPid(id));
        return "post";
    }

    //跳转到发送帖子页面
    @RequestMapping("/to_newpost")
    public String toNewPost(){
        return "newpost";
    }

    //发送帖子页面
    @RequestMapping("/newpost")
    public String newPost(Post post){
        post.setCreateTime(new Date());
        postBiz.add(post);
        return "redirect:home";
    }

    @RequestMapping("/quit")
    public String quit(HttpSession session){
        session.setAttribute("user",null);
        return "redirect:home";
    }

    //回复帖子
    @RequestMapping("/reply")
    public String reply(Comment comment){
        comment.setCreateTime(new Date());
        commentBiz.add(comment);
        return "redirect:to_post?id="+comment.getPostId();
    }

}
