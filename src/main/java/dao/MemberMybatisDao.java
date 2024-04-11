package dao;

import java.io.UnsupportedEncodingException;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;


import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Amem;
import mybatis.AMemberAnno;
import mybatis.MybatisConnection;

@Repository
public class MemberMybatisDao {
	
	@Autowired
	SqlSessionTemplate sqlSession; 
	private static final String NS = "amem.";

	public int insertMember(Amem amem) throws UnsupportedEncodingException, SQLException {

		System.out.println("mybatis insertMember");
		
		return sqlSession.getMapper(AMemberAnno.class).insertMember(amem);

	}
	public int updateMoney(Amem amem) throws SQLException {
	    
	    return sqlSession.getMapper(AMemberAnno.class).updateMoney(amem);
	}



	
	public Amem oneMember(String id) throws SQLException {	
		return sqlSession.getMapper(AMemberAnno.class).oneMember(id);
	}


public Amem findMemberByNameAndEmail(String name, String email) throws SQLException {
       Map<String, String> map = new HashMap<>();
       map.put("name", name);
       map.put("email", email);
       
       return sqlSession.getMapper(AMemberAnno.class).findMemberByNameAndEmail(map);
   }


   public Amem findMemberByIdAndNameAndEmail(String id, String name, String email) throws SQLException {
       Map<String, String> map = new HashMap<>();
       map.put("id", id);
       map.put("name", name);
       map.put("email", email);
       
       return sqlSession.getMapper(AMemberAnno.class).findMemberByIdAndNameAndEmail(map);
   }


	
	public int updateMember(Amem amem) throws UnsupportedEncodingException, SQLException {

		return sqlSession.getMapper(AMemberAnno.class).updateMember(amem);

	}

	public int deleteMember(String id) throws UnsupportedEncodingException, SQLException {

		return sqlSession.getMapper(AMemberAnno.class).deleteMember(id);

	}

	public int passMember(String id, String chgpass) throws UnsupportedEncodingException, SQLException {

		Map map = new HashMap();
		map.put("id", id);
		map.put("pass", chgpass);

		return sqlSession.getMapper(AMemberAnno.class).passMember(map);

	}
	public boolean isIdDuplicated(String id) throws SQLException {
	    return sqlSession.getMapper(AMemberAnno.class).oneMember(id) != null;
	}

}// class end


















