package com.syu.app.Controller;

import javax.servlet.http.HttpSession;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.util.ArrayList;

import com.google.gson.JsonObject;
import com.syu.app.Dao.PDao;
import com.syu.app.Dto.PostDto;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.apache.ibatis.session.SqlSession;

import java.io.File;

/**
 * Handles requests for the application home page.
 */
@Controller
public class PostController {
	@Autowired
	private SqlSession sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(PostController.class);
	private static final JSONParser parser = new JSONParser();

	/**
	 * Simply selects the home view to render by returning its name.
	 * 
	 */
	@ResponseBody
	@RequestMapping("/BackgroundUpload")
	public String fileUpload(HttpServletResponse response, MultipartHttpServletRequest request) throws Exception {
		logger.info("upload");

		JSONObject data = new JSONObject();
		MultipartFile mf = request.getFile("upload");
		Map map = new HashMap();
		if (mf != null) {
			String name = mf.getName(); // 필드 이름 얻기
			logger.info(name);
			String fileName = mf.getOriginalFilename(); // 파일명 얻기
			String contentType = mf.getContentType(); // 컨텐츠 타입 얻기

			// 업로드 파일명을 변경후 저장
			String uploadedFileName = System.currentTimeMillis() + UUID.randomUUID().toString()
					+ fileName.substring(fileName.lastIndexOf("."));
			String rootPath = request.getSession().getServletContext().getRealPath("/");

			String uploadPath = rootPath + "resources/background";
			logger.info(uploadPath);
			// 지정한주소에 파일 저장
			if (mf.getSize() != 0) {
				mf.transferTo(new File(uploadPath + "/" + uploadedFileName));
			}
			data.put("uploaded", 1);
			data.put("fileName", uploadedFileName);
			data.put("url", "/app/background/" + uploadedFileName);
		}
		return data.toString();
	}
	@ResponseBody
	@RequestMapping("/postWrite")
	public String postWrite(MultipartHttpServletRequest request) throws Exception {
		PostDto dto = new PostDto();
		dto.setUser_id(request.getParameter("user_id"));
		dto.setPost_title(request.getParameter("post_title"));
		dto.setPost_content(request.getParameter("post_content"));
		// background image upload
		MultipartFile mf = request.getFile("post_background");
		if (mf != null) {
			String name = mf.getName(); // 필드 이름 얻기
			logger.info(name);
			String fileName = mf.getOriginalFilename(); // 파일명 얻기
			String contentType = mf.getContentType(); // 컨텐츠 타입 얻기

			// 업로드 파일명을 변경후 저장
			String uploadedFileName = System.currentTimeMillis() + UUID.randomUUID().toString();
			String rootPath = request.getSession().getServletContext().getRealPath("/");

			String uploadPath = rootPath + "resources/background";
			logger.info(uploadPath);
			// 지정한주소에 파일 저장
			if (mf.getSize() != 0) {
				mf.transferTo(new File(uploadPath + "/" + uploadedFileName));
			}
			dto.setPost_background("/app/background/" + uploadedFileName);

		}
		PDao dao = sqlSession.getMapper(PDao.class);
		dao.postWrite(dto);
		return "1";
	}
	/*
	 * public int home(Model model, HttpServletRequest request, @RequestBody String
	 * paramData) throws ParseException {
	 * 
	 * logger.info("회원가입 컨트롤러 접속"); logger.info("-----------------------");
	 * logger.info(paramData); // Map Regis_Data = request.getParameterMap();
	 * JSONObject Regis_Data = (JSONObject) parser.parse(paramData.toString());
	 * UserDto UserDto = new UserDto();
	 * UserDto.setUser_name(Regis_Data.get("user_name").toString().trim());
	 * UserDto.setUser_id(Regis_Data.get("user_id").toString().trim());
	 * UserDto.setUser_password(Regis_Data.get("user_password").toString().trim());
	 * UserDto.setUser_email(Regis_Data.get("user_email").toString().trim());
	 * UserDto.setUser_mobile(Regis_Data.get("user_mobile").toString().trim());
	 * UserDto.setUser_type(Regis_Data.get("user_type").toString().trim());
	 * UserDto.setUser_birth(Regis_Data.get("user_birth").toString().trim()); try {
	 * UserDto.setAccess_token(Regis_Data.get("access_token").toString().trim()); }
	 * catch (Exception e) { } UDao dao = sqlSession.getMapper(UDao.class);
	 * dao.Register(UserDto); logger.info("user_id: " +
	 * Regis_Data.get("user_id").toString().trim()); logger.info("user_password: " +
	 * Regis_Data.get("user_password").toString().trim());
	 * 
	 * return 1; }
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "Login_Act", produces =
	 * "application/json; charset=utf8") public String LoginAct(HttpServletRequest
	 * request, @RequestBody String paramData, HttpSession session) throws
	 * ParseException { logger.info("로그인 컨트롤러 접속"); JSONObject Login_Data =
	 * (JSONObject) parser.parse(paramData.toString()); Map map = new HashMap();
	 * map.put("user_id", Login_Data.get("user_id").toString().trim());
	 * map.put("user_password", Login_Data.get("user_password").toString().trim());
	 * logger.info("Login info"); logger.info("User_id: " + map.get("user_id"));
	 * logger.info("User_password: " + map.get("user_password")); UDao dao =
	 * sqlSession.getMapper(UDao.class); UserDto dto = dao.Login(map); if (dto !=
	 * null) { session.setAttribute("user_id", dto.getUser_id()); return "1"; } else
	 * return "0"; }
	 * 
	 * @RequestMapping("/N_callback") public String N_callback(Model model) { return
	 * "N_callback"; }
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping("/N_Login") public String N_Login(@RequestBody String
	 * paramData, HttpSession session) { String access_token = paramData.trim();
	 * System.out.println("access_token"+access_token); UDao dao =
	 * sqlSession.getMapper(UDao.class); UserDto dto = dao.N_Login(access_token); if
	 * (dto != null) { session.setAttribute("user_id", dto.getUser_id()); return
	 * "0"; } else { return "1"; } }
	 * 
	 * @RequestMapping("/Logout") public String Logout(HttpSession session) {
	 * session.invalidate(); return "redirect:/"; }
	 */

}
