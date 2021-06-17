package com.starmiao.bbs.dao;

import com.starmiao.bbs.entity.Admin;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("adminDao")
public interface AdminDao {
    void insert(Admin admin);
    void update(Admin admin);
    void delete(int id);
    Admin select(int id);
    Admin selectByName(String adminname);
    List<Admin> selectAll();
}
