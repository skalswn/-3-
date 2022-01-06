package kr.board.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import kr.board.domain.Board;
import kr.board.domain.member;

//JDBC->CRUD
//유지보수가 어려움
//MtBatis Framework : http://mybatis.org
//@Repository
//@Service
public interface BoardMapper {
//1. 접속(스프링은 다른데서 함)
//2. 게시판 리스트 가져오기
	public List<Board> boardList();
	public void boardinsert(Board vo);
	public Board boardview(int idx);
	@Delete("delete from board where idx=#{idx}")
	public void boarddelete(int idx);
	public void boardreplace(Board vo);
	public void boardupdate(Board vo);
	public void boardupdate_tw(Board vo);
	@Select("select * from member where memId=#{memid} and memPass=#{mempass}")
	public member login(member vo);
	@Update("update board set count=count+1 where idx=#{idx}")
	public void boardcount(int idx);
}
