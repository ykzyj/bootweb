package com.yk.system.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yk.system.mapper.User_InfoMapper;
import com.yk.system.po.User_Info;
import com.yk.system.service.User_InfoService;

@Service
public class User_InfoServiceImpl implements User_InfoService{

    @Autowired
    private User_InfoMapper user_InfoMapper;

    public void insertUser_Info(User_Info user) {
        user_InfoMapper.insertUser_Info(user);
    }

    public List<User_Info> selectUser_InfoAll() {
        return user_InfoMapper.selectUser_InfoAll();
    }

    public User_Info selectUser_InfoByUserName(String usrename) {
        // TODO Auto-generated method stub
        return user_InfoMapper.selectUser_InfoByUserName(usrename);
    }

	public List<User_Info> selectUser_InfoByCondition(Map paramMap) {
		// TODO Auto-generated method stub
		return user_InfoMapper.selectUser_InfoByCondition(paramMap);
	}

}
