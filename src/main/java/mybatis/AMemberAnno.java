package mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Amem;

public interface AMemberAnno {
   @Insert("insert into amem (id, nickname,pass,name,tel,email,address,bank,account,numberid) values (#{id}, #{nickname},#{pass},#{name},#{tel},#{email},#{address},#{bank},#{account},#{numberid})")
   int insertMember(Amem amem);

   @Update("UPDATE amem SET money = NVL(money, 0) + #{money} WHERE id = #{id}")
   int updateMoney(Amem amem);
   
   @Update("update amem set name=#{name},tel=#{tel},bank=#{bank},account=#{account},email=#{email},address=#{address} where id =#{id}")
   int updateMember(Amem amem);

   @Select("select*from amem where id =#{id}")
   Amem oneMember(String id);
   

   @Update("update amem set pass =#{pass} where id = #{id}")
   int passMember(Map map);
   
   
   @Delete("delete amem where id =#{id}")
   int deleteMember(String id);

  
   

   @Select("select * from amem")
   List<Amem> selectMemberList();
 

   @Delete("<script> delete from amem where id in " +
	         "<foreach item='item'  collection='list' open='(' separator=',' close=')'>"
	           + "             #{item} </foreach></script>")
	   void deleteMembers(List<String> list);

   @Select("select * from amem where name = #{name} and email = #{email}")
   Amem findMemberByNameAndEmail(Map<String, String> map);
   
   @Select("select * from amem where id = #{id} and name = #{name} and email = #{email}")
   Amem findMemberByIdAndNameAndEmail(Map<String, String> map);
   
   
   @Update("UPDATE amem SET status = 'BANNED', banreason = #{banreason} WHERE id = #{id}")
   int banmember(@Param("id") String id, @Param("banreason") String banreason);
   
   @Update("UPDATE amem SET status = 'ACTIVE', banreason = NULL WHERE id = #{id}")
   int UnbanMember(String id);

}