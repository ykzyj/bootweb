package com.yk.common.page.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yk.common.page.mapper.PageMapper;
import com.yk.common.page.service.PageService;

@Service
public class PageServiceImpl implements PageService{

    @Autowired
    private PageMapper pageMapper;

	public int getSelectCount(Map paramMap) {
		// TODO Auto-generated method stub
		return pageMapper.getSelectCount(paramMap);
	}

}
