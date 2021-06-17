package com.starmiao.bbs.controller;

import com.starmiao.bbs.biz.AdminBiz;
import com.starmiao.bbs.entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller("adminController")
public class AdminController {

    @Autowired
    private AdminBiz adminBiz;

    @RequestMapping("/manage")
    public String toLogin(){
        return "manage";
    }

    @RequestMapping("/manage_noPermission")
    public String noPermission(HttpServletRequest request){
        request.setAttribute("msg","请先登录获取权限后,再访问管理页面");
        return "manage";
    }


    @RequestMapping("/admin_login")
    public String login(HttpServletRequest request, @RequestParam String adminname, @RequestParam String password){
        Admin admin = adminBiz.login(adminname,password);
        if (admin == null) {
            request.setAttribute("msg","用户名不存在或密码输入错误,请重新输入");
            return "manage";
        }
        request.getSession().setAttribute("admin",admin);
        return "redirect:user/list";
    }

    @RequestMapping("/admin_quit")
    public String quit(HttpSession session){
        session.setAttribute("admin",null);
        return "redirect:manage";
    }
}
