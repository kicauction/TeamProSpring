package mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import model.Amem;
import model.Auction;
import model.Report;

public interface AReportAnno {

    @Insert("INSERT INTO AReport (reportid, reportpnum, content,regdate,reportedid) VALUES (#{reportid}, #{reportpnum},#{content},#{regdate},#{reportedid})")
    int insertReport(Report rep);
    
    
	/*
	 * // @Select("SELECT * FROM Auction WHERE pnum = #{pnum}") int
	 * oneBoardByOtherUser(int pnum);
	 */
    @Select("select * from auction where pnum =#{pnum}")
    Auction oneReport(int pnum);
    
      
    @Select("SELECT amem.id AS reportid, auc.userid AS reportedid, auc.pnum AS reportpnum, rep.content, rep.regdate "
            + "FROM AReport rep "
            + "JOIN Auction auc ON rep.reportpnum = auc.pnum "
            + "JOIN Amem amem ON rep.reportid = amem.id")
    List<Report> selectReportList(); 
    
    @Select("SELECT rep.content, rep.regdate, auc.userid AS reported_userid, amem.id AS reporter_id "
            + "FROM AReport rep "
            + "JOIN Auction auc ON rep.reportpnum = auc.pnum "
            + "JOIN Amem amem ON rep.reportid = amem.id "
            + "WHERE rep.reportpnum = #{reportpnum} and amem.id = #{amemid}")
    List<Report> contentReport(Map map);
    
    @Delete("DELETE FROM auction WHERE pnum = #{reportpnum}")
    int deleteReport(int reportpnum);

    @Select("SELECT nvl(COUNT(*),0) reportedid  FROM areport where  reportedid = #{value}")
    int selectReportCount(String reportedid);
}
    