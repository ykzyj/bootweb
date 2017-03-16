package com.yk.system.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yk.common.page.po.Page;
import com.yk.common.page.service.impl.PageServiceImpl;
import com.yk.common.util.StringUtil;
import com.yk.common.util.TimeUtil;
import com.yk.system.po.User_Info;
import com.yk.system.service.impl.User_InfoServiceImpl;


@Controller
@RequestMapping("/usertest")
public class UserTestController {

    @Autowired
    private User_InfoServiceImpl user_InfoServiceImpl;
    
    @Autowired
    private PageServiceImpl pageServiceImpl;

    @RequestMapping(value = "/toUserInfo", method = RequestMethod.GET)
    public String toUserInfo(Model model,HttpServletRequest request) {
    	
    	Page page=new Page();
    	String currentPage=request.getParameter("pno");
    	Pattern pattern = Pattern.compile("[0-9]{1,9}");
    	if(currentPage==null||!pattern.matcher(currentPage).matches())
    	{
    		page.setCurrentPage(1);
    	}
    	else
    	{
    		page.setCurrentPage(Integer.valueOf(currentPage));
    	}
    	
    	Map<String,Object> page_parameter = new HashMap<String, Object>();
    	page_parameter.put("tablename", User_Info.class.getSimpleName().toLowerCase());
    	int totalNumber=pageServiceImpl.getSelectCount(page_parameter);
    	page.setTotalNumber(totalNumber);
    	page.initCount();
    	
    	Map<String,Object> user_parameter = new HashMap<String, Object>();
    	user_parameter.put("page", page);
        List<User_Info> lsu=user_InfoServiceImpl.selectUser_InfoByCondition(user_parameter);
        model.addAttribute("userInfoList", lsu);
        model.addAttribute("page", page);
        return "user/usertest";
    }

    @RequestMapping(value="/addUser",method = RequestMethod.POST)
    @ResponseBody
    public void addUser(User_Info user_info,HttpServletResponse response) throws Exception{
    	user_info.setU_id(UUID.randomUUID().toString());
    	user_info.setU_passWord(StringUtil.getMd5(user_info.getU_passWord()));
    	user_info.setU_createTime(TimeUtil.getTimeOfyyyyMMddHHmmss());
    	user_info.setU_lastChangeTime(TimeUtil.getTimeOfyyyyMMddHHmmss());
    	user_info.setRemark("");
        Map<String, Object> map = new HashMap<String, Object>();
        try {
        	user_InfoServiceImpl.insertUser_Info(user_info);
            map.put("flag", "true");
            map.put("msg", "添加成功！");
        } catch (Exception e) {
            //e.printStackTrace();
        	map.put("flag", "false");
            map.put("msg", "添加失败！");
        }
        JSONObject json=new JSONObject(map);
        String json_str =json.toString();
        response.setContentType("application/json");
        response.getWriter().write(json_str);
    }
}
