package com.starmiao.bbs.controller;

import com.starmiao.bbs.biz.UserBiz;
import com.starmiao.bbs.entity.User;
import com.starmiao.bbs.global.Content;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller("userController")
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserBiz userBiz;

    @RequestMapping("/list")
    public String list(Map<String, Object> map) {
        map.put("list", userBiz.getAll());
        return "users";
    }

    @RequestMapping(value = "/remove", params = "id")
    public String remove(int id) {
        userBiz.remove(id);
        return "redirect:list";
    }

    @RequestMapping(value = "/lock", params = "id")
    public String lock(int id) {
        User user = userBiz.get(id);
        if (user.getUserStatus() == Content.USERSTATUE_NORMAL){
            user.setUserStatus(Content.USERSTATUE_LOCKED);
        }else {
            user.setUserStatus(Content.USERSTATUE_NORMAL);
        }
            userBiz.edit(user);
            return "redirect:list";
    }
}
