package com.starmiao.bbs.dao;

import com.starmiao.bbs.entity.Comment;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("commentDao")
public interface CommentDao {
    void insert(Comment comment);
    void update(Comment comment);
    void delete(int id);
    List<Comment> selectByPid(int postId);
    int selectCommentNum(int postId);
}
