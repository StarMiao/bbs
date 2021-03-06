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
        /* ?????????????????????????????????????????????????????????*/
        for(FileItem item:list){
            if(item.isFormField()){
                if(item.getFieldName().equals("username"))
                    user.setUsername(item.getString("UTF-8"));
                if(item.getFieldName().equals("password"))
                    user.setPassword(item.getString("UTF-8"));
                if(item.getFieldName().equals("email"))
                    user.setEmail(item.getString("UTF-8"));
            }else{
                /* ???????????????????????????????????????????????????????????????????????????????????????*/
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
                        //?????????target?????????,???????????????path?????????????????????,?????????????????????
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
        request.setAttribute("msg","???????????????,??????????????????");
        return "login";
    }

    @RequestMapping("/login")
    public String login(HttpServletRequest request,@RequestParam String username, @RequestParam String password){
        User user = globalBiz.login(username,password);
        if (user == null) {
            request.setAttribute("msg","?????????????????????????????????");
            return "login";
        }
        request.getSession().setAttribute("user",user);
        return "redirect:home";
    }

    //???????????????
    @RequestMapping("/home")
    public String home(@RequestParam(required = false) String method,
                       @RequestParam(defaultValue = "1") int page,
                       @RequestParam(required = false) String username,Map<String, Object> map){
        int postNum = postBiz.getPostNum();
        int totalPage = 0;
        //???????????????????????????
        //???????????????????????????????????????,?????????????????????????????????
        if(method == null){
            map.put("posts",postBiz.getAllToHome((page-1)*PAGE_SIZE));
            totalPage = postNum/PAGE_SIZE;
        }else if(method.equals("cnum")){
            map.put("posts",postBiz.getAllToHomeOrderByCommentNum((page-1)*PAGE_SIZE));
            totalPage = postNum/PAGE_SIZE;
        }else if (method.equals("mypost")){
            //??????method?????????mypost,???????????????????????????
            totalPage =postBiz.getMyPostNum(username)/PAGE_SIZE;
            map.put("posts",postBiz.getAllToHomeMyPost(username,(page-1)*PAGE_SIZE));
        }
        //????????????????????????????????????????????????,???????????????+1
        if(postNum%PAGE_SIZE != 0){
            totalPage ++;
        }
        //?????????????????????
        map.put("method",method);
        //???????????????
        map.put("page",page);
        map.put("totalPage",totalPage);
        map.put("postNum",postNum);
        map.put("userNum",userBiz.getUserNum());
        return "home";
    }

    //???????????????????????????
    @RequestMapping(value = "/to_post")
    public String toPost(int id,Map<String,Object> map){
        map.put("post",postBiz.get(id));
        map.put("postNum",postBiz.getPostNum());
        map.put("userNum",userBiz.getUserNum());
        //??????????????????post???id
        map.put("commentNum",commentBiz.getCommentNum(id));
        map.put("comments",commentBiz.getByPid(id));
        return "post";
    }

    //???????????????????????????
    @RequestMapping("/to_newpost")
    public String toNewPost(){
        return "newpost";
    }

    //??????????????????
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

    //????????????
    @RequestMapping("/reply")
    public String reply(Comment comment){
        comment.setCreateTime(new Date());
        commentBiz.add(comment);
        return "redirect:to_post?id="+comment.getPostId();
    }

}
