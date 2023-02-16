package com.sample.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JdbcController {

    @RequestMapping("/jdbctest")
    public String go() {
        return "DBConfig";
    }
    @RequestMapping("/test")
    public String test(){
        return "test";
    }
}