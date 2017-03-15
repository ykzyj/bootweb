package com.yk.system.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yk.common.util.StringUtil;
import com.yk.system.po.User_Info;
import com.yk.system.service.impl.User_InfoServiceImpl;


@Controller
@RequestMapping("/")
public class LoginController {

    @Autowired
    private User_InfoServiceImpl user_InfoServiceImpl;

    @RequestMapping("/login")
    public String index(){
        return "system/login";
    }

    @RequestMapping(value="/login/userCheck",method = RequestMethod.POST)
    @ResponseBody
    public void loginCheck(User_Info user_info,HttpServletResponse response) throws Exception{
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            User_Info us = user_InfoServiceImpl.selectUser_InfoByUserName(user_info.getU_userName());
            if (us == null
                    ||StringUtil.isEmpty(us.getU_userName())
                    ||!us.getU_passWord().equals(StringUtil.getMd5(user_info.getU_passWord()))) {
                map.put("flag", "false");
                map.put("msg", "用户或密码不正确！");
            }
            else
            {
                map.put("flag", "true");
                map.put("msg", "登录成功！");
            }
            JSONObject json=new JSONObject(map);
            String json_str =json.toString();
            response.setContentType("application/json");
            response.getWriter().write(json_str);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
