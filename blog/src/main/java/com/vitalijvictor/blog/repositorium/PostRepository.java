package com.vitalijvictor.blog.repositorium;

import com.vitalijvictor.blog.models.Posts;
import org.springframework.data.repository.CrudRepository;

public interface PostRepository extends CrudRepository<Posts, Long> {
}

