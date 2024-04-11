package dao;

import java.io.UnsupportedEncodingException;



import java.sql.SQLException;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.Notice;



@Component
public class NoticeMybatisDao {
	
	 @Autowired
	 SqlSessionTemplate sqlSession ;
	 private static final String NS="notice.";
	 
	 public int insertNotice(Notice notice) throws UnsupportedEncodingException, SQLException {
	      	
	   	        
	      
	     
	         return sqlSession.insert(NS+"insertNotice",notice);
	                  
	   }

public Notice contentanswer(int num) throws UnsupportedEncodingException, SQLException {
    
      
    return sqlSession.selectOne(NS+"contentanswer",num);
}
     

	 public List<Notice> noticeList(int pageInt, int limit, String boardid) throws UnsupportedEncodingException, SQLException {
		 
		 	Map map = new HashMap();
		 	map.put("boardid", boardid);
		 	map.put("start",(pageInt-1)*limit +1);
		 	map.put("end",pageInt * limit);
			
		 	return sqlSession.selectList(NS + "noticeList",map);
         
      
		}
		
	 public List<Notice> selectQuestionList() throws UnsupportedEncodingException, SQLException {
	     
		    return sqlSession.selectList(NS+"allNotice");
	 }


public int noticeCount(String boardid) throws UnsupportedEncodingException, SQLException {
		 
	return sqlSession.selectOne(NS + "noticeCount",boardid);
}




	 public Notice oneNotice(int num) throws UnsupportedEncodingException, SQLException {
		 
		 return sqlSession.selectOne(NS+"oneNotice",num);
	 }

	 
	  public int updateNotice(Notice notice) throws UnsupportedEncodingException, SQLException {
	      	
	         return sqlSession.update(NS+"updateNotice",notice);
	                  
	   }
	  
	  public int noticeDelete(int num) throws UnsupportedEncodingException, SQLException {
		  
		  return sqlSession.update(NS+ "noticeDelete",num);
		  
	
         
       }
	  
public List<Notice> mynotice(int pageInt, int limit, String boardid, String id) throws UnsupportedEncodingException, SQLException {
          
          Map map = new HashMap();
          map.put("boardid", boardid);
          map.put("start",(pageInt-1)*limit +1);
          map.put("end",pageInt * limit);
         map.put("loggedInUserId", id);
         System.out.println(map);
          return sqlSession.selectList(NS + "mynotice",map);
     
  
      }
	  
	 
}