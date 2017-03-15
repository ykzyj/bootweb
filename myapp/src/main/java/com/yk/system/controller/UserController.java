package com.yk.system.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yk.system.po.User_Info;
import com.yk.system.service.impl.User_InfoServiceImpl;


@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private User_InfoServiceImpl user_InfoServiceImpl;

    @RequestMapping(value = "/toUserInfo", method = RequestMethod.GET)
    public String toUserInfo(Model model) {
        List<User_Info> lsu=user_InfoServiceImpl.selectUser_InfoAll();
        model.addAttribute("userInfoList", lsu);
        return "user/userinfo";
    }
    
    @RequestMapping(value = "/toAdvancesUserInfo", method = RequestMethod.GET)
    public String toAdvancesUserInfo(Model model) {
        List<User_Info> lsu=user_InfoServiceImpl.selectUser_InfoAll();
        model.addAttribute("userInfoList", lsu);
        return "user/advanceduserinfo";
    }

}
