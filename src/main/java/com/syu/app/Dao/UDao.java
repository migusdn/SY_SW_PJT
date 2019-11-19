package com.syu.app.Dao;

import java.util.ArrayList;
import java.util.Map;
import com.syu.app.Dto.UserDto;

public interface UDao {
	public void Register(UserDto UDto);
	public UserDto Id_Check(String id);
	public UserDto Login(Map map);
	public UserDto N_Login(String access_token);
}
