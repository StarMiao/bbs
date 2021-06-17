package com.starmiao.bbs.dao;

import com.starmiao.bbs.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("userDao")
public interface UserDao {
    void insert(User user);
    void update(User user);
    void delete(int id);
    User select(int id);
    List<User> selectAll();

    User selectByName(String username);
    int selectUserNum();
}
