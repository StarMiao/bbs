package com.starmiao.bbs.biz;

import com.starmiao.bbs.entity.Admin;

import java.util.List;

public interface AdminBiz {
    void add(Admin admin);
    void edit(Admin admin);
    void remove(int id);
    Admin get(int id);
    List<Admin> getAll();

    Admin login(String adminname, String password);
}
