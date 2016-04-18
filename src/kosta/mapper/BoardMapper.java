package kosta.mapper;

import java.util.List;

import kosta.model.Board;

public interface BoardMapper {
	public int insertBoard(Board board);
	
	public Integer selectB_id();
	
	public List<Board> listBoard();
	
	public Board selectBoard(int b_id);
	
	public int updateHit(int b_id);
	
	public int updateBoard(Board board);
	
	public int deleteBoard(int b_id);
	
	public String checkPass(int b_id);
	
	
}
