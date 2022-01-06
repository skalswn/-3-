package kr.board.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.board.domain.Board;
import kr.board.domain.member;
import kr.board.mapper.BoardMapper;
import kr.board.view.boardservice;

@RestController
public class Boardrestcontroller {
	
	@Autowired
	private boardservice service; 
	
	@RequestMapping("/boardList.Ajax")
	public List<Board> boardListAjax() {
		List<Board> list=service.boardListAjax();
		return list;
	}
	@RequestMapping("/boardinsert.Ajax")
	public void boardinsertAjax(Board vo) {
		service.boardinsertAjax(vo);
	}
	@RequestMapping("/boardview.Ajax")
	public Board boardviewAjax(int idx) {
		Board vo=service.boardviewAjax(idx);
		return vo;
	}
	@RequestMapping("/boarddelete.Ajax")
	public void boarddeleteAjax(int idx) {
		service.boarddeleteAjax(idx);
	}
	@RequestMapping("/boardreplace.Ajax")
	public void boardreplaceAjax(Board vo) {
		service.boardreplaceAjax(vo);
	}
	@RequestMapping("/boardupdate.Ajax")
	public void boardupdateAjax(Board vo) {
		service.boardupdateAjax(vo);
	}
	@RequestMapping("/boardcount.Ajax")
	public Board boardcount(int idx) {
		Board vo=service.boardcount(idx);
		return vo;
	}
	@RequestMapping("/boardback.Ajax")
	public Board boardback(int idx) {
		System.out.print("여긴들어감?");
		Board vo=service.boardviewAjax(idx);
		return vo;
	}


}
