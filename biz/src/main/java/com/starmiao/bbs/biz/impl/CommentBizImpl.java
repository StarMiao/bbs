package com.starmiao.bbs.biz.impl;

import com.starmiao.bbs.biz.CommentBiz;
import com.starmiao.bbs.dao.CommentDao;
import com.starmiao.bbs.entity.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("commentBiz")
public class CommentBizImpl implements CommentBiz {

    @Autowired
    CommentDao commentDao;

    @Override
    public void add(Comment comment) {
        commentDao.insert(comment);
    }

    @Override
    public void edit(Comment comment) {
        commentDao.update(comment);
    }

    @Override
    public void remove(int id) {
        commentDao.delete(id);
    }

    @Override
    public List<Comment> getByPid(int pid) {
        return commentDao.selectByPid(pid);
    }

    @Override
    public int getCommentNum(int pid) {
        return commentDao.selectCommentNum(pid);
    }
}
