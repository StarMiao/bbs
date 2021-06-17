package com.starmiao.bbs.biz.impl;

import com.starmiao.bbs.biz.GlobalBiz;
import com.starmiao.bbs.dao.UserDao;
import com.starmiao.bbs.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("globalBiz")
public class GlobalBizImpl implements GlobalBiz {

    @Autowired
    private UserDao userDao;

    @Override
    public void register(String username, String password,String email) {
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(email);
        userDao.insert(user);
    }

    @Override
    public User login(String username, String password) {
        User user = userDao.selectByName(username);
        if(user!=null&&user.getPassword().equals(password)){
            return user;
        }
        return null;
    }
}
