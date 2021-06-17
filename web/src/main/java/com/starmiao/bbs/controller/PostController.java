package com.starmiao.bbs.controller;

import com.starmiao.bbs.biz.PostBiz;
import com.starmiao.bbs.entity.Post;
import com.starmiao.bbs.global.Content;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.Map;

@Controller("postController")
@RequestMapping("/post")
public class PostController {

    @Autowired
    private PostBiz postBiz;

    @RequestMapping("/list")
    public String list(Map<String, Object> map) {
        map.put("list", postBiz.getAll());
        return "posts";
    }

    @RequestMapping(value = "/remove", params = "id")
    public String remove(int id) {
        postBiz.remove(id);
        return "redirect:list";
    }

}
