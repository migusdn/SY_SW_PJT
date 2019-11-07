package com.syu.app.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AppController {
	
	private static final Logger logger = LoggerFactory.getLogger(AppController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("Welcome Index Page");
		return "index";
	}
	@RequestMapping("/mypage")
	public String mypage(Model model) {
		logger.info("mypage");
		return "mypage";
	}

	@RequestMapping("/register")
	public String register(Model model) {
		logger.info("Welcome Index Page");
		return "register";
	}

	@RequestMapping("/search")
	public String search(Model model) {
		logger.info("Welcome Index Page");
		return "search";
	}

	@RequestMapping("/add")
	public String add(Model model) {
		logger.info("Welcome Index Page");
		return "add";
	}
	@RequestMapping("/follow")
	public String follow(Model model) {
		logger.info("Welcome Index Page");
		return "follow";
	}
}
