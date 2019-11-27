package com.syu.app.Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.syu.app.Dao.PDao;
import com.syu.app.Dto.PostDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AppController {
	@Autowired
	private SqlSession sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(AppController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		logger.info("Welcome Index Page");
		logger.info("user_id"+session.getAttribute("user_id"));
		PDao dao = sqlSession.getMapper(PDao.class);
		ArrayList<PostDto> dto = dao.postFetch(0);
		model.addAttribute("post", dto);
		return "index";
	}
	@RequestMapping("/mypage")
	public String mypage(Model model, HttpSession session) {
		if(session.getAttribute("user_id") == null) {
			logger.info("Login page");
			return "login";
		}
		else {
			PDao dao = sqlSession.getMapper(PDao.class);
			ArrayList<PostDto> PostList = dao.postList((String)session.getAttribute("user_id"));
			String json = new Gson().toJson(PostList);
			model.addAttribute("PList", json);
			logger.info("mypage");
			return "mypage";
		}
	}

	@RequestMapping("/register/{regis_type}")
	public String register(Model model, HttpServletRequest request, @PathVariable String regis_type) {
		if(regis_type.equals("nomal"))
			model.addAttribute("regis_type", regis_type);
		return "register";
		
	}

	@RequestMapping("/search")
	public String search(Model model) {
		logger.info("Welcome Index Page");
		return "search";
	}

	@RequestMapping("/add")
	public String add(Model model, HttpSession session) {
		
		if(session.getAttribute("user_id") == null) {
			logger.info("Login page");
			return "redirect:/mypage";
		}
		else {
			logger.info("mypage");
			logger.info("add Page");
			return "add";
		}
	}
	@RequestMapping("/follow")
	public String follow(Model model) {
		logger.info("Welcome Index Page");
		return "follow";
	}
	@RequestMapping("/register_type")
	public String register_type(Model model) {
		logger.info("Welcome Index Page");
		return "register_type";
	}
}
