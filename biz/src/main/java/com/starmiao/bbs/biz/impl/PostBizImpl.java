package com.starmiao.bbs.biz.impl;

import com.starmiao.bbs.biz.PostBiz;
import com.starmiao.bbs.dao.PostDao;
import com.starmiao.bbs.entity.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("postBiz")
public class PostBizImpl implements PostBiz {

    @Autowired
    private PostDao postDao;

    @Override
    public void add(Post post) {
        postDao.insert(post);
    }

    @Override
    public void edit(Post post) {
        postDao.update(post);
    }

    @Override
    public void remove(int id) {
        postDao.delete(id);
    }

    @Override
    public Post get(int id) {
        return postDao.select(id);
    }

    @Override
    public List<Post> getAll() {
        return postDao.selectAll();
    }

    @Override
    public int getPostNum() {
        return postDao.selectPostNum();
    }

    @Override
    public int getMyPostNum(String username) {
        return postDao.selectMyPostNum(username);
    }


    @Override
    public List<Post> getAllToHome(int page) {
        return postDao.selectAllToHome(page);
    }

    @Override
    public List<Post> getAllToHomeOrderByCommentNum(int page) {
        return postDao.selectAllToHomeOrderByCommentNum(page);
    }

    @Override
    public List<Post> getAllToHomeMyPost(String username,int page) {
        return postDao.selectAllToHomeMyPost(username,page);
    }

}
