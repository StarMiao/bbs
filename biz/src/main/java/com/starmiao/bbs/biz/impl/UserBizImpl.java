package com.starmiao.bbs.biz.impl;

import com.starmiao.bbs.biz.UserBiz;
import com.starmiao.bbs.dao.UserDao;
import com.starmiao.bbs.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("userBiz")
public class UserBizImpl implements UserBiz {

    @Autowired
    private UserDao userDao;

    @Override
    public void add(User user) {
        userDao.insert(user);
    }

    @Override
    public void edit(User user) {
        userDao.update(user);
    }

    @Override
    public void remove(int id) {
        userDao.delete(id);
    }

    @Override
    public User get(int id) {
        return userDao.select(id);
    }

    @Override
    public List<User> getAll() {
        return userDao.selectAll();
    }

    @Override
    public int getUserNum() {
        return userDao.selectUserNum();
    }
}
