package com.starmiao.bbs.dao;

import com.starmiao.bbs.entity.Post;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("postDao")
public interface PostDao {
    void insert(Post post);
    void update(Post post);
    void delete(int id);
    Post select(int id);
    List<Post> selectAll();

    int selectPostNum();
    int selectMyPostNum(String username);

    List<Post> selectAllToHome(int page);
    List<Post> selectAllToHomeOrderByCommentNum(int page);
    List<Post> selectAllToHomeMyPost(@Param("username") String usernamem,@Param("page") int page);
}
