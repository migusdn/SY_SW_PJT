package com.syu.app.Dao;

import java.util.ArrayList;
import java.util.Map;

import com.syu.app.Dto.LikeDto;
import com.syu.app.Dto.PostDto;
import com.syu.app.Dto.ReplyDto;

public interface PDao {
	public void postWrite(PostDto PostDto);
	public ArrayList<PostDto> postList(String user_id);
	public ArrayList<PostDto> postFetch(int start);
	public void reply(Map map);
	public PostDto post_detail(String post_id);
	public ArrayList<ReplyDto> reply_view(String post_id);
	public void like(Map map);
	public void unlike(Map map);
	public ArrayList<LikeDto> likepost(String user_id);
}
