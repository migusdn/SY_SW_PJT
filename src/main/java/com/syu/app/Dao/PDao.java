package com.syu.app.Dao;

import java.util.ArrayList;
import java.util.Map;
import com.syu.app.Dto.PostDto;

public interface PDao {
	public void postWrite(PostDto PostDto);
	public ArrayList<PostDto> postList(String user_id);
}
