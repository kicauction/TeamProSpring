package dao;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mybatis.MybatisConnection;
import model.AddbuyList;
import model.Amem;
import model.Apay;
import model.Auction;
import model.Cart;
import model.Comment;

@Repository
public class BoardMybatisDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	private static final String ns = "board.";

	public int insertBoard(Auction board) throws UnsupportedEncodingException, SQLException {

		return sqlSession.insert(ns + "insertBoard", board);
	}

	public int buyNow(Map<String, Object> params) throws UnsupportedEncodingException, SQLException {
		return sqlSession.update(ns + "buyNow", params);
	}

	public List<Auction> buyList(String id) throws SQLException {

		return sqlSession.selectList(ns + "buyList", id);

	}

	public List<Auction> searchBoards(String pname) throws UnsupportedEncodingException, SQLException {
		return sqlSession.selectList(ns + "searchBoards", pname);
	}

	public List<Auction> cntList(String pname) throws UnsupportedEncodingException, SQLException {
		if (pname.equals("priced")) {
			pname = "price desc";
		}
		if (pname.equals("readcnt")) {
			pname = "readcnt desc";
		}
		return sqlSession.selectList(ns + "cntList", pname);
	}

	public int upcnt(int pnum) {

		return sqlSession.update(ns + "upcnt", pnum);
	}

	public int getUpcnt(int ser) {

		return sqlSession.selectOne(ns + "getupcnt", ser);
	}

	public int updateBuy(Auction board) throws UnsupportedEncodingException, SQLException {
		return sqlSession.update(ns + "updateBuy", board);
	}

	public int updateEnd(Auction auction) throws UnsupportedEncodingException, SQLException {
		return sqlSession.update(ns + "end", auction);
	}

	public int cntBoard(int pnum) {
		return sqlSession.update(ns + "cntBoard", pnum);
	}

	public List<Auction> boardList(int pageInt, int limit, String boardid)
			throws UnsupportedEncodingException, SQLException {

		Map map = new HashMap();
		map.put("boardid", boardid);
		map.put("start", (pageInt - 1) * limit + 1);
		map.put("end", pageInt * limit);
		return sqlSession.selectList(ns + "boardList", map);
	}

	

	public int boardCount(String boardid) throws UnsupportedEncodingException, SQLException {
		return sqlSession.selectOne(ns + "boardCount", boardid);
	}
	
	
	
	

	public Auction oneBoard(int num) throws UnsupportedEncodingException, SQLException {

		return sqlSession.selectOne(ns + "oneBoard", num);
	}

	
	
	
	
	public int updateBoard(Auction board) throws UnsupportedEncodingException, SQLException {

		return sqlSession.update(ns + "updateBoard", board);

	}

	public int testpro(Auction testpro) throws UnsupportedEncodingException, SQLException {

		return sqlSession.update(ns + "testpro", testpro);

	}

	public int boardDelete(int num) throws UnsupportedEncodingException, SQLException {

		return sqlSession.update(ns + "boardDelete", num);

	}

	public int insertComment(String comment, int num, String userid) throws UnsupportedEncodingException, SQLException {

		Map map = new HashMap();

		map.put("comment", comment);
		map.put("num", num);
		map.put("userid", userid);

		return sqlSession.insert(ns + "insertComment", map);

	}

	public List<Comment> commentList(int num) throws UnsupportedEncodingException, SQLException {

		return sqlSession.selectList(ns + "commentList", num);
	}

	public List<Auction> mainList() throws UnsupportedEncodingException, SQLException {

		return sqlSession.selectList(ns + "mainList");
	}

	public List<Auction> endListByLoginId(String loginId) throws UnsupportedEncodingException, SQLException {
		Map<String, Object> params = new HashMap<>();
		params.put("loginId", loginId);
		return sqlSession.selectList(ns + "endListByLoginId", params);
	}

	public int commentDelete(int ser) throws UnsupportedEncodingException, SQLException {
		return sqlSession.update(ns + "commentDelete", ser);
	}

	public Comment oneComment(int ser) throws UnsupportedEncodingException, SQLException {
		return sqlSession.selectOne(ns + "oneComment", ser);
	}

	public int apay(Apay apay) throws SQLException {

		return sqlSession.insert(ns + "apay", apay);
	}

	public int addTobuyList(AddbuyList addbuyList) throws SQLException {

		return sqlSession.insert(ns + "addTobuyList", addbuyList);
	}

	public List<AddbuyList> List(int pnum) throws UnsupportedEncodingException, SQLException {

		return sqlSession.selectList(ns + "List", pnum);
	}

	public int maxbuycnt(int pnum) {
		return sqlSession.selectOne(ns + "maxbuycnt", pnum);
	}

}
