package com.example.rancherrepo.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @RequestMapping("/say")
    public String say(String name){
        System.out.println(name);
        return "hello: "+name;
    }
}
