package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.InternalResourceView;



import dao.BoardMybatisDao;
import dao.CartMybatisDao;
import dao.MemberMybatisDao;

import model.Amem;
import model.Auction;
import model.EmailSender;



@Controller
@RequestMapping("/member/")
public class MemberController {
	
	
	@Autowired
	MemberMybatisDao md;
	HttpSession session;
	HttpServletRequest request;
	@Autowired
	CartMybatisDao cd;  

	@Autowired
	BoardMybatisDao bd;
	 
	@RequestMapping("index") //~~/board/index
    public String index(HttpServletRequest req) throws Exception {
          // TODO Auto-generated method stub
    
    String login = (String) session.getAttribute("id");
    Amem mem = md.oneMember(login);
    req.setAttribute("amem", mem);
    
    String Tier = cd.tier(login); 
    req.setAttribute("Tier", Tier);
    String sum = cd.sum(login);
     req.setAttribute("sum", sum);
     String sum2 = cd.sum2(login);
    req.setAttribute("sum2", sum2);
     
 
 
    
 List<Auction> li = bd.mainList();   
    
    
    request.setAttribute("li", li);
    
     return "member/index";
    }
	 
	@RequestMapping("tier") //~~/board/index
   public String tier(HttpServletRequest req) throws Exception {
         // TODO Auto-generated method stub
   
   String login = (String) session.getAttribute("id");
   Amem mem = md.oneMember(login);
   req.setAttribute("amem", mem);
   
   String Tier = cd.tier(login); 
   req.setAttribute("Tier", Tier);
   String sum = cd.sum(login);
    req.setAttribute("sum", sum);
    String sum2 = cd.sum2(login);
   req.setAttribute("sum2", sum2);
    


   

    return "member/tier";
   }
	
	@RequestMapping("agree") //~~/board/index
    public String agree(HttpServletRequest req) throws Exception {
          // TODO Auto-generated method stub
    
    String login = (String) session.getAttribute("id");
    Amem mem = md.oneMember(login);
    req.setAttribute("amem", mem);
    
    String Tier = cd.tier(login); 
    req.setAttribute("Tier", Tier);
    String sum = cd.sum(login);
     req.setAttribute("sum", sum);
     String sum2 = cd.sum2(login);
    req.setAttribute("sum2", sum2);
     
 
 

    
     return "member/agree";
    }
	
	@ModelAttribute
	protected void service(HttpServletRequest request) throws ServletException, IOException {
		this.request=request;
		this.session = request.getSession();
	
		request.setCharacterEncoding("utf-8");
	}
	
	@RequestMapping("memberinput")
	public String memberinput() throws Exception {
		  
	    String login = (String) session.getAttribute("id");
	    Amem mem = md.oneMember(login);
	    request.setAttribute("amem", mem);
	    
	    String Tier = cd.tier(login); 
	    request.setAttribute("Tier", Tier);
	    String sum = cd.sum(login);
	     request.setAttribute("sum", sum);
	     String sum2 = cd.sum2(login);
	    request.setAttribute("sum2", sum2);
		return "member/memberinput";
	}
	
	@RequestMapping("findIdForm")
	   public String findIdForm() throws Exception {
		   String login = (String) session.getAttribute("id");
		    Amem mem = md.oneMember(login);
		    request.setAttribute("amem", mem);
		    
		    String Tier = cd.tier(login); 
		    request.setAttribute("Tier", Tier);
		    String sum = cd.sum(login);
		     request.setAttribute("sum", sum);
		     String sum2 = cd.sum2(login);
		    request.setAttribute("sum2", sum2);
		return "member/findIdForm";
	       
	       
	   }
	   
	   @RequestMapping("findIdPro")
	   public String findIdPro(String name, String email) throws Exception {
	       System.out.println("findIdPro 메소드 호출 확인");
	       Amem foundMember = md.findMemberByNameAndEmail(name, email);

	       String msg;
	       String url;

	       if (foundMember != null) {
	           msg = "회원님의 아이디는 " + foundMember.getId() + " 입니다.";
	           url = "/member/loginForm";
	       } else {
	           msg = "일치하는 정보가 없습니다. 다시 확인해 주세요.";
	           url = "/member/findIdForm";
	       }

	       request.setAttribute("msg", msg);
	       request.setAttribute("url", url);

	       return "alert";
	   }
	   @RequestMapping("findPasswordForm")
	   public String findPasswordForm() throws Exception {
		   String login = (String) session.getAttribute("id");
		    Amem mem = md.oneMember(login);
		    request.setAttribute("amem", mem);
		    
		    String Tier = cd.tier(login); 
		    request.setAttribute("Tier", Tier);
		    String sum = cd.sum(login);
		     request.setAttribute("sum", sum);
		     String sum2 = cd.sum2(login);
		    request.setAttribute("sum2", sum2);
	       return "member/findPasswordForm";
	   }

	   @RequestMapping("findPasswordPro")
	    public String findPasswordPro(String id, String name, String email) throws Exception {
	        Amem foundMember = md.findMemberByIdAndNameAndEmail(id, name, email);

	        String msg;
	        String url;

	        if (foundMember != null) {
	            // 랜덤한 6자리 임시 비밀번호 생성
	            String temporaryPassword = generateRandomPassword(6);

	            // 비밀번호 변경 로직 추가
	            md.passMember(id, temporaryPassword);

	            // 이메일로 임시 비밀번호 전송
	            EmailSender.sendTemporaryPassword(email, temporaryPassword);

	            msg = "임시 비밀번호가 발급되었습니다. 로그인 후 비밀번호를 변경해주세요.";
	            url = "/member/loginForm";
	        } else {
	            msg = "일치하는 정보가 없습니다. 다시 확인해 주세요.";
	            url = "/member/findIdForm";
	        }

	        request.setAttribute("msg", msg);
	        request.setAttribute("url", url);

	        return "alert";
	    }

	    private String generateRandomPassword(int length) {
	        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	        Random random = new Random();
	        StringBuilder password = new StringBuilder();

	        for (int i = 0; i < length; i++) {
	            password.append(characters.charAt(random.nextInt(characters.length())));
	        }

	        return password.toString();
	    }
	   

	
	@RequestMapping("loginForm")
	public String loginForm() throws Exception {
		// TODO Auto-generated method stub
		   String login = (String) session.getAttribute("id");
		    Amem mem = md.oneMember(login);
		    request.setAttribute("amem", mem);
		    
		    String Tier = cd.tier(login); 
		    request.setAttribute("Tier", Tier);
		    String sum = cd.sum(login);
		     request.setAttribute("sum", sum);
		     String sum2 = cd.sum2(login);
		    request.setAttribute("sum2", sum2);
		return "member/loginForm";
	}
	


	@RequestMapping("logout")
	public String logout() throws Exception {
		
		session.invalidate();
		request.setAttribute("msg", "logout 했습니다.");
		request.setAttribute("url", "/member/loginForm");
		
		return "alert";
	}
	
	
	@RequestMapping("memberinfo")
	public String memberinfo() throws Exception {	
	
		
		   String login = (String) session.getAttribute("id");
		    Amem mem = md.oneMember(login);
		    request.setAttribute("amem", mem);
		    
		    String Tier = cd.tier(login); 
		    request.setAttribute("Tier", Tier);
		    String sum = cd.sum(login);
		     request.setAttribute("sum", sum);
		     String sum2 = cd.sum2(login);
		    request.setAttribute("sum2", sum2);
		return "member/memberinfo";
	}
	@RequestMapping("moneyInput")
	public String moneyInput() throws Exception {
		   String login = (String) session.getAttribute("id");
		    Amem mem = md.oneMember(login);
		    request.setAttribute("amem", mem);
		    
		    String Tier = cd.tier(login); 
		    request.setAttribute("Tier", Tier);
		    String sum = cd.sum(login);
		     request.setAttribute("sum", sum);
		     String sum2 = cd.sum2(login);
		    request.setAttribute("sum2", sum2);
		
		return "member/moneyInput";
	}
	
	  @RequestMapping("moneyInputPro")
	    public String moneyInputPro(String money, HttpServletRequest request, HttpSession session) throws Exception {
	        String login = (String) session.getAttribute("id");
	        Amem mem = md.oneMember(login);
	        request.setAttribute("amem", mem);

	        Amem amem = new Amem();
	        amem.setId(login);
	        amem.setMoney(money);

	        // 예시: updateMoney 메소드가 boolean 값을 반환하도록 구현되었다고 가정
	        int updateSuccess = md.updateMoney(amem);
	        request.setAttribute("updateSuccess", updateSuccess);
	        String msg = "충전에 실패하였습니다.";
	        String url = "/member/moneyInput";
	        
	        if(amem!=null) {
	            msg = "충전 되었습니다.";
	            url = "/member/memberinfo";
	        }

	        request.setAttribute("msg", msg);
	        request.setAttribute("url", url);
	        
	        // "alert.jsp" 페이지로 포워드. 이 페이지에서는 msg와 url을 사용하여 알림을 표시하고, 지정된 URL로 리다이렉션
	        return "alert";
	    }
	
	
	
	@RequestMapping("loginPro")
	   public String loginPro(String id, String pass) throws Exception {
	    
	      Amem mem = md.oneMember(id);
	      session.setAttribute("mem", mem);
	     
	      String msg = "아이디를 확인하세요";
	      String url = "/member/loginForm";
	      if(mem != null ) { //id 존재할때
	         if (pass.equals(mem.getPass())) { //login ok
	            session.setAttribute("id", id);
	            if (mem.getAdminchk().equals("1")) { //Amem 테이블의 Adminchk 컬럼으로 관리자인지 확인
	               session.setAttribute("admin", id);
	            msg = "관리자로 로그인하셧습니다.";
	            url = "/admin/Reportlist";
	            }else if(mem.getAdminchk().equals("0")){
	         msg = mem.getName() + "님이 로그인 하셨습니다.";
	          url = "/member/index";
	            }} else {
	            msg = "비밀번호를 확인하세요";
	         }
	      }	      
	      request.setAttribute("msg", msg);
	      request.setAttribute("url", url);
	      
	      return "alert";
	   }

	@RequestMapping("memberPro")
	public String memberPro(Amem amem, HttpServletRequest request) throws Exception {
	    if (md.isIdDuplicated(amem.getId())) {
	        // 중복된 경우
	        request.setAttribute("msg", "이미 사용중인 아이디입니다.");
	        request.setAttribute("url", "/member/memberinput");
	        return "alert";
	    }
	    
	    // 중복되지 않은 경우
	    System.out.println(amem);
	    int num = md.insertMember(amem);
	    request.setAttribute("msg", "가입되셨습니다.");
	    request.setAttribute("url", "/member/loginForm");
	    
	    return "alert";
	}

	//@Login(key = "id")
	@RequestMapping("memberUpdateForm")
	public String memberUpdateForm() throws Exception {
		   String login = (String) session.getAttribute("id");
		    Amem mem = md.oneMember(login);
		    request.setAttribute("amem", mem);
		    
		    String Tier = cd.tier(login); 
		    request.setAttribute("Tier", Tier);
		    String sum = cd.sum(login);
		     request.setAttribute("sum", sum);
		     String sum2 = cd.sum2(login);
		    request.setAttribute("sum2", sum2);
		
		return "member/memberUpdateForm";
	}
	
	
	@RequestMapping("memberUpdatePro")
	public String memberUpdatePro(Amem mem) throws Exception {
		
		String login =  (String) session.getAttribute("id");
		
		request.setCharacterEncoding("utf-8");
		mem.setId(login); //session 저장 logout이면 에러남
		mem.setPass(request.getParameter("pass"));
		mem.setName(request.getParameter("name"));
		mem.setTel(request.getParameter("tel"));
		mem.setBank(request.getParameter("bank"));
		mem.setEmail(request.getParameter("email"));
		mem.setAddress(request.getParameter("address"));
		mem.setAccount(request.getParameter("account"));
		

	
		Amem memdb = md.oneMember(login);  //db에서 넘어온자료

		String msg = " ";
		String url ="/member/memberUpdateForm";
		if(memdb!=null) {
			if(memdb.getPass().equals(mem.getPass())) {  //수정 ok
				  msg = "수정 되었습니다.";
				  md.updateMember(mem);
				  url ="/member/memberinfo";
			}else {
				msg="비밀번호가 틀렸습니다.";
			}
		}		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "alert";
	}
	
	@RequestMapping("memberDeleteForm")
	public String memberDeleteForm() throws Exception {		
		   String login = (String) session.getAttribute("id");
		    Amem mem = md.oneMember(login);
		    request.setAttribute("amem", mem);
		    
		    String Tier = cd.tier(login); 
		    request.setAttribute("Tier", Tier);
		    String sum = cd.sum(login);
		     request.setAttribute("sum", sum);
		     String sum2 = cd.sum2(login);
		    request.setAttribute("sum2", sum2);
		return "member/memberDeleteForm";
	}
	
	@RequestMapping("memberDeletePro")
	public String memberDeletePro(String pass) throws Exception {
		
		   String login = (String) session.getAttribute("id");
		    Amem mem = md.oneMember(login);
		    request.setAttribute("amem", mem);
		    
		    String Tier = cd.tier(login); 
		    request.setAttribute("Tier", Tier);
		    String sum = cd.sum(login);
		     request.setAttribute("sum", sum);
		     String sum2 = cd.sum2(login);
		    request.setAttribute("sum2", sum2);
	
	Amem memdb = md.oneMember(login);
	String msg = " ";
	String url ="/member/memberDeleteForm";

	if(memdb!=null) {
		if(memdb.getPass().equals(pass)) {  //비밀번호 확인
			  msg = "탈퇴 되었습니다.";
			  md.deleteMember(login);
			  session.invalidate();
			  url ="/member/index";
		}else {
			msg="비밀번호가 틀렸습니다.";
		}
	}
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
	
	return "alert";
	}
	
	@RequestMapping("memberPassForm")
	public String memberPassForm() throws Exception {		
		   String login = (String) session.getAttribute("id");
		    Amem mem = md.oneMember(login);
		    request.setAttribute("amem", mem);
		    
		    String Tier = cd.tier(login); 
		    request.setAttribute("Tier", Tier);
		    String sum = cd.sum(login);
		     request.setAttribute("sum", sum);
		     String sum2 = cd.sum2(login);
		    request.setAttribute("sum2", sum2);
		return "member/memberPassForm";
	}
	
	@RequestMapping("memberPassPro")
	public String memberPassPro(String pass, String chgpass) throws Exception {
		
	String login =  (String) session.getAttribute("id");	
	Amem memdb = md.oneMember(login);

	String msg = " ";
	String url ="/member/memberPassForm";

	if(memdb!=null) {
		if(memdb.getPass().equals(pass)) {  
			  md.passMember(login, chgpass);
			  msg = login+"님이 비밀번호가 수정 되었습니다.";	  
			  url = "/member/index";
		}else {
			msg="비밀번호가 틀렸습니다.";
		}
	}
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
	
	return "alert";
	}
		
}
