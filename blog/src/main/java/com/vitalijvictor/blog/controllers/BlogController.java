package com.vitalijvictor.blog.controllers;

import com.vitalijvictor.blog.model.Posts;
import com.vitalijvictor.blog.repositorium.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Optional;

@Controller
public class BlogController {

    @Autowired
    private PostRepository postRepository;

    @GetMapping("/blog")
    public String blog(Model model) {
        Iterable<Posts> posts = postRepository.findAll();
        model.addAttribute("posts", posts);
        return "blog";
    }

    @GetMapping("/blog/add")
    public String blogAdd(Model model) {
        return "blog-add";
    }

    @PostMapping("/blog/add")
    public String blogPostAdd(@RequestParam String title,
                              @RequestParam String anons,
                              @RequestParam String full_text,
                              Model model) {
        Posts post = new Posts(title, anons, full_text);
        postRepository.save(post);
        return "redirect:/blog";
    }

    @GetMapping("/blog/{id}")
    public String blogDetails(@PathVariable(value = "id") long id, Model model) {
        if (!postRepository.existsById(id)) {
            return "redirect:/blog";
        }
        Optional<Posts> post = postRepository.findById(id);
        ArrayList<Posts> res = new ArrayList<>();
        post.ifPresent(res::add);
        model.addAttribute("post", res);
        return "blog-details";
    }

    @GetMapping("/blog/{id}/edit")
    public String blogEdit(@PathVariable(value = "id") long id, Model model) {
        if (!postRepository.existsById(id)) {
            return "redirect:/blog";
        }
        Optional<Posts> post = postRepository.findById(id);
        ArrayList<Posts> res = new ArrayList<>();
        post.ifPresent(res::add);
        model.addAttribute("post", res);
        return "blog-edit";
    }

    @PostMapping("/blog/{id}/edit")
    public String blogPostUpdate(@PathVariable(value = "id") long id,
                                 @RequestParam String anons,
                                 @RequestParam String title,
                                 @RequestParam String full_text,
                                 Model model) {
        Posts post = postRepository.findById(id).orElseThrow();
        post.setTitle(title);
        post.setAnons(anons);
        post.setFull_text(full_text);
        postRepository.save(post);
        return "redirect:/blog";
    }

    @PostMapping("/blog/{id}/remove")
    public String blogPostDelete(@PathVariable(value = "id") long id,
                                 Model model) {
        Posts post =
                postRepository.findById(id).<RuntimeException>orElseThrow(() -> {
                    throw new AssertionError();
                });
        postRepository.delete(post);
        return "redirect:/blog";
    }

    @GetMapping("/filter")
    public String filter(@RequestParam String filter, Model model) {
        Iterable<Posts> posts;
        if (filter != null && !filter.isEmpty()) {
            posts = postRepository.findByTitle(filter);
        } else {
            posts = postRepository.findAll();
        }
        model.addAttribute("posts", posts);
        return "/blog";
    }

    @RequestMapping("/variable-example1")
    public String variableExample1(Model model, HttpServletRequest request) {
        // variable1
        model.addAttribute("variable1", "Value of variable1!");
        // variable2
        request.setAttribute("variable2", "Value of variable2!");
        return "variable-example1";
    }

    @RequestMapping("/variable-in-loop")
    public String objectServletContext(Model model, HttpServletRequest request) {
        String[] flowers = new String[] {"Rose","Lily", "Tulip", "Carnation", "Hyacinth" };
        model.addAttribute("flowers", flowers);
        return "variable-in-loop";
    }
}
