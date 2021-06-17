package com.starmiao.bbs.biz.impl;

import com.starmiao.bbs.biz.AdminBiz;
import com.starmiao.bbs.dao.AdminDao;
import com.starmiao.bbs.entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("adminBiz")
public class AdminBizImpl implements AdminBiz {

    @Autowired
    private AdminDao adminDao;

    @Override
    public void add(Admin admin) {
        adminDao.insert(admin);
    }

    @Override
    public void edit(Admin admin) {
        adminDao.update(admin);
    }

    @Override
    public void remove(int id) {
        adminDao.delete(id);
    }

    @Override
    public Admin get(int id) {
        return adminDao.select(id);
    }

    @Override
    public List<Admin> getAll() {
        return adminDao.selectAll();
    }

    @Override
    public Admin login(String adminname, String password) {
        Admin admin = adminDao.selectByName(adminname);
        if(admin!=null&&admin.getPassword().equals(password)){
            return admin;
        }
        return null;
    }
}
