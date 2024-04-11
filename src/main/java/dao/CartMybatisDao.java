package dao;


import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Cart;
import mybatis.MybatisConnection;


@Repository
public class CartMybatisDao {

	@Autowired
	SqlSessionTemplate sqlSession; 
	private static final String ns = "cart.";
	
	
	public int addToAproducts(Cart cart) throws SQLException {
	  	
		
		return sqlSession.insert(ns+"addToAproducts", cart);
	}

	public List<Cart> jumunList(String id) throws SQLException {
		
	return sqlSession.selectList(ns+"jumunList", id);

	}
	public List<Cart> myList(String id) throws SQLException {
		
	return sqlSession.selectList(ns+"myList", id);

	}
	
	public int jumunDelete(int num) throws UnsupportedEncodingException, SQLException {


	      return sqlSession.update(ns + "jumunDelete", num);

	   } 
	public String tier(String id) throws UnsupportedEncodingException, SQLException {

        return sqlSession.selectOne(ns + "Tier", id);

     } 
	public String sum(String id) throws UnsupportedEncodingException, SQLException {
	      Long result = sqlSession.selectOne(ns + "sum", id);
	      return result != null ? result.toString() : "0";
	   }

	   public String sum2(String id) throws UnsupportedEncodingException, SQLException {
	      Long result = sqlSession.selectOne(ns + "sum2", id);
	      return result != null ? result.toString() : "0";
	   }
	}

