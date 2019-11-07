package com.syu.app.Controller;

import javax.servlet.http.HttpSession;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import com.syu.app.Dto.UserDto;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 * Handles requests for the application home page.
 */
@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	private static final JSONParser parser = new JSONParser();
	/**
	 * Simply selects the home view to render by returning its name.
	 *  
	 */
	
	@ResponseBody
	@RequestMapping(value="Regis_Act", produces="application/json; charset=utf8")
	public String home(Model model, HttpServletRequest request, @RequestBody String paramData) throws ParseException {
		
		logger.info("회원가입 컨트롤러 접속");
		logger.info("-----------------------");
		logger.info(paramData);
		//Map Regis_Data = request.getParameterMap();
		JSONObject Regis_Data = (JSONObject)parser.parse(paramData.toString());
		UserDto UserDto = new UserDto();
		UserDto.setUser_id(Regis_Data.get("user_id").toString().trim());
		UserDto.setUser_password(Regis_Data.get("user_password").toString().trim());
		UserDto.setUser_email(Regis_Data.get("user_email").toString().trim());
		UserDto.setUser_mobile(Regis_Data.get("user_mobile").toString().trim());
		UserDto.setUser_type(Regis_Data.get("user_type").toString().trim());
		//UserDto.setUser_birth(Regis_Data.get("user_birth").toString().trim());
		try {
			UserDto.setAccess_token(Regis_Data.get("access_token").toString().trim());
		}catch(Exception e) {
			
		}
		logger.info("user_id: "+Regis_Data.get("user_id").toString().trim());
		logger.info("user_password: "+Regis_Data.get("user_password").toString().trim());
		
		return "index";
	}
}
