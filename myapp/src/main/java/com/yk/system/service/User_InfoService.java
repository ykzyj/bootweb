package com.yk.system.service;

import java.util.List;

import com.yk.system.po.User_Info;

public interface User_InfoService {
    public void insertUser_Info(User_Info user);
    public List<User_Info> selectUser_InfoAll();
    public User_Info selectUser_InfoByUserName(String usrename);
}
