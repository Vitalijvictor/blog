package com.vitalijvictor.blog.repositorium;

import com.vitalijvictor.blog.models.Posts;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PostRepository extends CrudRepository<Posts, Long> {
    List<Posts> findByTitle(String title);
}

