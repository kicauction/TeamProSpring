package dao;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import model.Amem;
import model.Auction;
import model.Report;
import mybatis.AMemberAnno;
import mybatis.AReportAnno;

@Repository
public class AdminMybatisDao {

	
	@Autowired
	SqlSessionTemplate sqlSession;
	private static final String NS="notice.";
	

	public int insertReport(Report rep) throws UnsupportedEncodingException, SQLException {
	   
		

		return sqlSession.getMapper(AReportAnno.class).insertReport(rep);
	}

	public int updateAnswer(int num, String answer) {
	       Map<String, Object> map = new HashMap<>();
	       
	       map.put("num", num);
	       map.put("answer", answer);
	       
	      return sqlSession.update(NS + "updateAnswer", map);
	   }

	/*
	 * public int oneBoardByOtherUser(int pnum) {
	 * 
	 * return sqlSession.getMapper(AReportAnno.class).oneBoardByOtherUser(pnum); }
	 */

	public Auction oneReport(int pnum) throws SQLException {
        System.out.println(pnum);
		
		return sqlSession.getMapper(AReportAnno.class).oneReport(pnum);

	}
	
	public List<Report> selectReportList() {
        
		
		return sqlSession.getMapper(AReportAnno.class).selectReportList();

	}
	
	public List<Report> contentReport(int reportpnum, String amemid) {
		
		Map map = new HashMap();
		map.put("reportpnum", reportpnum);
		map.put("amemid", amemid);
	    return sqlSession.getMapper(AReportAnno.class).contentReport(map);
	
	
	
}
	
	public void deleteMembers(String[] ids) {
	      
	      List<String>  list = Arrays.asList(ids);
	       sqlSession.getMapper(AMemberAnno.class).deleteMembers(list);
	   }

	public void deleteReport(int reportpnum) {
	    System.out.println(reportpnum);
	    sqlSession.getMapper(AReportAnno.class).deleteReport(reportpnum);
	}
	
	public List<Amem> selectMemberList() {
	    return sqlSession.getMapper(AMemberAnno.class).selectMemberList();
	}
	public void deleteMembers(@RequestParam("selectedMembers") List<String> selectedMembers) {
	    System.out.println(selectedMembers);
	    sqlSession.getMapper(AMemberAnno.class).deleteMembers(selectedMembers);
	}
	public int selectReportCount(String reportedid) {
		return sqlSession.getMapper(AReportAnno.class).selectReportCount(reportedid);
	}
	
	  public int banMember(String id, String banreason) { 
          return sqlSession.getMapper(AMemberAnno.class).banmember(id, banreason); 
      }
     

     public int UnbanMember(String id) { 
     return sqlSession.getMapper(AMemberAnno.class).UnbanMember(id); }


	
	
	
	}
