package controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

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



import dao.BoardMybatisDao;
import dao.CartMybatisDao;
import dao.MemberMybatisDao;
import model.Amem;
import model.Apay;
import model.Auction;
import model.Cart;


@Controller
@RequestMapping("/jumun/")
public class JumunController {
      
   
   @Autowired
   CartMybatisDao cd = new CartMybatisDao();
   @Autowired
   MemberMybatisDao md;

   @Autowired
   BoardMybatisDao bd;
   
   
   
   public JumunController() {
      // TODO Auto-generated constructor stub
   }
   
   
   
   
   HttpSession session;
   HttpServletRequest req;
   
   
   @ModelAttribute
   protected void service(HttpServletRequest request) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      this.session = request.getSession();
      this.req=request;
   }
   @RequestMapping("jumunAdd") 
   public String jumunadd(int pnum) throws Exception {        
      String login = (String) session.getAttribute("id");
      Amem mem = md.oneMember(login);
      req.setAttribute("amem", mem);

      String id = (String) session.getAttribute("id");
    
        Cart c = new Cart();
        c.setUserid(id);
        c.setItemid(pnum);       
        
        cd.addToAproducts(c);
      
      req.setAttribute("msg", "추가 되었습니다");
      req.setAttribute("url", "/jumun/jumunList");
      return "alert";
      
   }
// JumunController.java
@RequestMapping("endList")
public String endList(HttpServletRequest request, Model model) throws Exception {
	String login = (String) session.getAttribute("id");
	Amem mem = md.oneMember(login);
	req.setAttribute("amem", mem);
	String Tier = cd.tier(login);
	req.setAttribute("Tier", Tier);
	String sum = cd.sum(login);
	req.setAttribute("sum", sum);
	String sum2 = cd.sum2(login);
	req.setAttribute("sum2", sum2);
	
	
	String loginId = (String) request.getSession().getAttribute("id");
    List<Auction> li = bd.endListByLoginId(loginId);
    model.addAttribute("li", li);
    return "jumun/endList";
}

	 
   
   @RequestMapping("jumunList")
   public String jumunList() throws Exception {
		String login = (String) session.getAttribute("id");
		Amem mem = md.oneMember(login);
		req.setAttribute("amem", mem);
		String Tier = cd.tier(login);
		req.setAttribute("Tier", Tier);
		String sum = cd.sum(login);
		req.setAttribute("sum", sum);
		String sum2 = cd.sum2(login);
		req.setAttribute("sum2", sum2);
      
        String id = (String) session.getAttribute("id");
      List<Cart>  li = cd.jumunList(id);
   
      System.out.println(li);
      req.setAttribute("li", li);
      
      return "jumun/jumunList";
   }

   @RequestMapping("jumunDeleteForm")
    public String jumunDeleteForm() throws Exception {
       // TODO Auto-generated method stub
       req.setAttribute("pnum", req.getParameter("pnum"));
       return "jumun/jumunDeleteForm";
    }
    
 @RequestMapping("jumunDeletePro")
 public String jumunDeletePro(int pnum) throws Exception {
     int count = cd.jumunDelete(pnum);

     String msg = (count > 0) ? "찜목록에서 삭제 되었습니다" : "삭제 불가합니다";
     String url = (count > 0) ? "/jumun/jumunList" : "/jumun/jumunDeleteForm?pnum=" + pnum;

     req.setAttribute("msg", msg);
     req.setAttribute("url", url);

     return "alert";
 } 
   
   @RequestMapping("myList")
   public String myList() throws Exception {
		String login = (String) session.getAttribute("id");
		Amem mem = md.oneMember(login);
		req.setAttribute("amem", mem);
		String Tier = cd.tier(login);
		req.setAttribute("Tier", Tier);
		String sum = cd.sum(login);
		req.setAttribute("sum", sum);
		String sum2 = cd.sum2(login);
		req.setAttribute("sum2", sum2);
      
        String id = (String) session.getAttribute("id");
        
      List<Cart>  li = cd.myList(id);
            
      req.setAttribute("li", li);
   
      
      return "jumun/myList";
   }   
   
   @RequestMapping("buyList") //~~/board/index
      public String buyList(HttpServletRequest req) throws Exception {
            // TODO Auto-generated method stub
      String login = (String) session.getAttribute("id");
      Amem mem = md.oneMember(login);
      req.setAttribute("amem", mem);
      String Tier = cd.tier(login); 
      req.setAttribute("Tier", Tier);
      
   List<Auction> li = bd.mainList();   
      
      
      req.setAttribute("li", li);
      
       return "jumun/buyList";
      }
   
   
}

