package kr.board.web;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.runner.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.board.domain.Board;
import kr.board.domain.member;
import kr.board.mapper.BoardMapper;
import kr.board.view.boardservice;

@Controller
public class BoardController{
	
	
	@Autowired private boardservice service;
	 
	@RequestMapping("/basic")
	public String main() {
		return "basic";
	}
	@RequestMapping("/login")
	public String login(member vo, HttpSession session) {
		member mvo=service.login(vo);
		if (mvo!= null){
			session.setAttribute("mvo", mvo);
		}
		return "redirect:/basic";
	}
	@RequestMapping("logout.do")	
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/basic";
	}

}
