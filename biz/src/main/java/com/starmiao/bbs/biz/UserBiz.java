package com.starmiao.bbs.biz;

import com.starmiao.bbs.entity.User;

import java.util.List;

public interface UserBiz {
    void add(User user);
    void edit(User user);
    void remove(int id);
    User get(int id);
    List<User> getAll();

    int getUserNum();
}
