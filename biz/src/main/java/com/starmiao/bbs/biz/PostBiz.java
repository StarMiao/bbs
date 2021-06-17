package com.starmiao.bbs.biz;

import com.starmiao.bbs.entity.Post;

import java.util.List;

public interface PostBiz {
    void add(Post post);
    void edit(Post post);
    void remove(int id);
    Post get(int id);
    List<Post> getAll();

    int getPostNum();
    int getMyPostNum(String username);

    List<Post> getAllToHome(int page);
    List<Post> getAllToHomeOrderByCommentNum(int page);
    List<Post> getAllToHomeMyPost(String username,int page);
}
