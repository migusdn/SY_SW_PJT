package com.syu.app.Dao;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.syu.app.Dto.LikeDto;
import com.syu.app.Dto.PostDto;
import com.syu.app.Dto.ReplyDto;
import com.syu.app.Dto.UserDto;
public class PostDao implements PDao{

	JdbcTemplate template;
	
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	@Override
	public void postWrite(PostDto PostDto) {
	}

	@Override
	public ArrayList<PostDto> postList(String user_id) {
		return null;
	}

	@Override
	public ArrayList<PostDto> postFetch(int start) {
		return null;
	}

	@Override
	public void reply(Map map) { }

	@Override
	public PostDto post_detail(String post_id) {
		return null;
	}

	@Override
	public ArrayList<ReplyDto> reply_view(String post_id) {
		return null;
	}

	@Override
	public void like(Map map) {	}

	@Override
	public void unlike(Map map) { }

	@Override
	public ArrayList<LikeDto> likepost(String user_id) {
		// TODO Auto-generated method stub
		return null;
	}

}