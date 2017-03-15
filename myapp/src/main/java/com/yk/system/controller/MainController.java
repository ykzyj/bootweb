package com.yk.system.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yk.system.service.impl.User_InfoServiceImpl;


@Controller
@RequestMapping("/main")
public class MainController {

    @Autowired
    private User_InfoServiceImpl user_InfoServiceImpl;

    @RequestMapping("/index")
    public String index(){
        return "system/main";
    }

}
