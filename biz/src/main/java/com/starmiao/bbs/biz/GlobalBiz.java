package com.starmiao.bbs.biz;

import com.starmiao.bbs.entity.User;

public interface GlobalBiz {
    void register(String username,String password,String email);
    User login(String username, String password);

}
