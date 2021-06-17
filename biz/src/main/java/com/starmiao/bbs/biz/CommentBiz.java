package com.starmiao.bbs.biz;

import com.starmiao.bbs.entity.Comment;
import org.springframework.stereotype.Service;

import java.util.List;

public interface CommentBiz {
    void add(Comment comment);
    void edit(Comment comment);
    void remove(int id);
    List<Comment> getByPid(int pid);
    int getCommentNum(int pid);
}
