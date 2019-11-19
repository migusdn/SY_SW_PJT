package com.syu.app.Dao;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.syu.app.Dto.UserDto;
public class UserDao implements UDao{

	JdbcTemplate template;
	
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	@Override
	public UserDto Id_Check(String id) { 
		return null;
	}

	@Override
	public UserDto Login(Map map) {
		return null;
	}

	@Override
	public void Register(UserDto UDto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public UserDto N_Login(String access_token) {
		// TODO Auto-generated method stub
		return null;
	}
	

}