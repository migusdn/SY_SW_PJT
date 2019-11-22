package com.syu.app.Dao;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.syu.app.Dto.PostDto;
import com.syu.app.Dto.UserDto;
public class PostDao implements PDao{

	JdbcTemplate template;
	
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	@Override
	public void postWrite(PostDto PostDto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<PostDto> postList(String user_id) {
		return null;
		
	}
	
	

}