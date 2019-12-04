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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.util.ArrayList;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.syu.app.Dao.PDao;
import com.syu.app.Dto.PostDto;
import com.syu.app.Dto.ReplyDto;

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
	public String postWrite(HttpServletRequest request) throws Exception {
		PostDto dto = new PostDto();
		dto.setUser_id(request.getParameter("user_id"));
		dto.setPost_title(request.getParameter("post_title"));
		dto.setPost_content(request.getParameter("post_content"));
		dto.setPost_background(request.getParameter("post_background"));
		PDao dao = sqlSession.getMapper(PDao.class);
		dao.postWrite(dto);
		return "1";
	}
	@RequestMapping("/post/{post_id}")
	public String bbs_detail(@PathVariable String post_id, Model model) {
		PDao dao = sqlSession.getMapper(PDao.class);
		PostDto PDto = dao.post_detail(post_id);
		ArrayList<ReplyDto> RList = dao.reply_view(post_id);
		String json = new Gson().toJson(RList);
		System.out.println(json);
		model.addAttribute("reply",json);
		model.addAttribute("post",PDto);
		return "post_detail";
	}
	@ResponseBody
	@RequestMapping(value = "/postfetch", produces = "application/json; charset=utf8")
	public String mainfetch(@RequestBody String paramData) {
		logger.info("postfetch");
		int page = Integer.parseInt(paramData.trim());
		PDao dao = sqlSession.getMapper(PDao.class);
		ArrayList<PostDto> dto = dao.postFetch(page * 5);
		System.out.println(dto.size());
		JSONObject obj = new JSONObject();
		try {
			JSONArray jArray = new JSONArray();
			for (int i = 0; i < dto.size(); i++) {
				JSONObject sObject = new JSONObject();
				sObject.put("post_id", dto.get(i).getPost_id());
				sObject.put("user_id", dto.get(i).getUser_id());
				sObject.put("post_title", dto.get(i).getPost_title());
				sObject.put("post_content", dto.get(i).getPost_content());
				sObject.put("post_date", dto.get(i).getPost_date());
				sObject.put("post_background", dto.get(i).getPost_background());
				sObject.put("post_like", dto.get(i).getPost_like());
				jArray.add(sObject);
			}
			obj.put("post", jArray);
		} catch (Exception e) {

		}
		System.out.println(obj.toString());
		return obj.toString();
	}
	@ResponseBody
	@RequestMapping("/reply")
	public String reply(HttpSession session, @RequestBody String paramData) throws ParseException {
		String user_id = (String) session.getAttribute("user_id");
		if (user_id == null)
			return "-1";
		else {
			JSONParser parser = new JSONParser();
			JSONObject reply_data = (JSONObject) parser.parse(paramData);
			Map map = new HashMap();
			map.put("user_id", reply_data.get("user_id"));
			map.put("post_id", reply_data.get("post_id"));
			map.put("reply_content", reply_data.get("reply_content"));
			PDao dao = sqlSession.getMapper(PDao.class);
			dao.reply(map);
			return "0";
		}
	}
	@ResponseBody
	@RequestMapping("/post_like")
	public String post_like(HttpSession session, @RequestBody String paramData) throws ParseException {
		String user_id = (String) session.getAttribute("user_id");
		if (user_id == null)
			return "-1";
		else {
			int like_type;
			JSONParser parser = new JSONParser();
			JSONObject like_data = (JSONObject) parser.parse(paramData);
			like_type = Integer.parseInt((String) like_data.get("like_type"));
			Map map = new HashMap();
			map.put("user_id", user_id);
			map.put("post_id", like_data.get("post_id"));
			map.put("author_id", like_data.get("author_id"));
			PDao dao = sqlSession.getMapper(PDao.class);
			if(like_type==0)
				dao.like(map);
			else
				dao.unlike(map);
			return "0";
		}
	}
	
}
