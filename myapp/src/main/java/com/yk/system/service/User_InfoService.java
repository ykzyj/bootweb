package com.yk.system.service;

import java.util.List;
import java.util.Map;

import com.yk.system.po.User_Info;

public interface User_InfoService {
    public void insertUser_Info(User_Info user);
    public List<User_Info> selectUser_InfoAll();
    public List<User_Info> selectUser_InfoByCondition(Map paramMap);
    public User_Info selectUser_InfoByUserName(String usrename);
}
