package kosta.model;

import java.util.List;

public class BoardService {
	public static BoardDao dao;
	public static BoardService service = new BoardService();
	
	public static BoardService getInstance() {
		dao = BoardDao.getInstance();
		return service;
	}
	
	public int insertBoardService(Board board) {
		board.setB_id(dao.selectB_id() + 1);
		board.setB_ref(dao.selectB_id() + 1);
		return dao.insertBoard(board);
	}
	
	public List<Board> listBoardService() {
		return dao.listBoard();
	}
	
	public Board selectBoardService(int b_id) {
		return dao.selectBoard(b_id);
	}
	
	public int updateHitService(int b_id) {
		return dao.updateHit(b_id);
	}
	
	public int updateBoardService(Board board) {
		return dao.updateBoard(board);
	}
	
	public int deleteBoardService(int b_id) {
		return dao.deleteBoard(b_id);
	}
	
	public int checkPassService(Board board) {
		if(dao.checkPass(board.getB_id()).equals(board.getB_pwd())) {
			return 1;
		} else {
			return 0;
		}
	}
	
}
