package controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.InternalResourceView;

import dao.AdminMybatisDao;
import dao.BoardMybatisDao;
import dao.CartMybatisDao;
import dao.MemberMybatisDao;

import model.Comment;
import model.Report;
import model.AddbuyList;
import model.Amem;
import model.Apay;
import model.Auction;
import model.Cart;

@Controller
@RequestMapping("/board/")
public class BoardController {
	@Autowired
	BoardMybatisDao bd;
	@Autowired
	MemberMybatisDao md;
	HttpSession session;
	HttpServletRequest req;
	@Autowired
	CartMybatisDao cd;
	@Autowired
	AdminMybatisDao ad;

	@ModelAttribute
	protected void service(HttpServletRequest request) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		this.session = request.getSession();
		this.req = request;
	}

	@RequestMapping("allList") //~~/board/index
    public String allList() throws Exception {
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
    
    
    req.setAttribute("li", li);
    
     return "board/allList";
    }
	 

	
	@RequestMapping("searchauction")
	public String searchauction(Model model, String pname) throws Exception {
		System.out.println("======== searchauction");
		System.out.println(pname);
		String login = (String) session.getAttribute("id");
		Amem mem = md.oneMember(login);
		req.setAttribute("amem", mem);  

		String Tier = cd.tier(login);
		req.setAttribute("Tier", Tier);
	    String sum = cd.sum(login);
	     req.setAttribute("sum", sum);
	     String sum2 = cd.sum2(login);
	    req.setAttribute("sum2", sum2);
		List<Auction> li = bd.searchBoards(pname);
		model.addAttribute("li", li);
		System.out.println(li);

		return "board/allList";
	}

	@RequestMapping("boardForm")
	public String boardForm(String boardid, String pageNum) throws Exception {
		// TODO Auto-generated method stub
		String login = (String) session.getAttribute("id");
		Amem mem = md.oneMember(login);
		req.setAttribute("amem", mem);
	    String sum = cd.sum(login);
	     req.setAttribute("sum", sum);
	     String sum2 = cd.sum2(login);
	    req.setAttribute("sum2", sum2);
		String Tier = cd.tier(login);
		req.setAttribute("Tier", Tier);
		if (req.getParameter("boardid") != null) { // ? boardid = 3
			session.setAttribute("boardid", boardid);
			session.setAttribute("pageNum", "1");
		}

		boardid = (String) session.getAttribute("boardid");
		if (boardid == null)
			boardid = "1";
		String boardPname = "";
		switch (boardid) {
		case "1":
			boardPname = "가전";
			break;
		case "2":
			boardPname = "의류";
			break;
		case "3":
			boardPname = "프라모델";
			break;
		case "4":
			boardPname = "골동품";
			break;
		case "5":
			boardPname = "악기";
			break;
		case "6":
			boardPname = "명품시계";
			break;
		case "7":
			boardPname = "악세사리";
			break;
		case "8":
			boardPname = "레저";
			break;

		}

		req.setAttribute("boardPname", boardPname);
		return "board/boardForm";
	}

	@RequestMapping("boardPro")
	public String boardPro(@RequestParam("f") MultipartFile multipartFile, Auction board,String boardid) throws Exception {

		String path = req.getServletContext().getRealPath("/") + "image/board/";
		String filename = null;
		String msg = "게시물 등록 실패";
		String url = "/board/boardForm";

		
		board.setBoardid(boardid);

		if (!multipartFile.isEmpty()) {
			File file = new File(path, multipartFile.getOriginalFilename());
			filename = multipartFile.getOriginalFilename();
			try {
				multipartFile.transferTo(file);
				board.setFile1(filename);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		int num = bd.insertBoard(board);
		if (num > 0) {
			msg = "게시물 등록 성공";
			url = "/board/allList";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "alert";
	}

	@RequestMapping("products")
	public String products(String boardid, String pageNum, String pagePnum) throws Exception {
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
		// board session 처리한다.
		if (boardid != null) { // ? boardid = 3
			session.setAttribute("boardid", boardid);
			session.setAttribute("pageNum", "1");
		}

		boardid = (String) session.getAttribute("boardid");
		if (boardid == null)
			boardid = "1";
		String boardPname = "";
		switch (boardid) {
		case "1":
			boardPname = "가전";
			break;
		case "2":
			boardPname = "의류";
			break;
		case "3":
			boardPname = "프라모델";
			break;
		case "4":
			boardPname = "골동품";
			break;
		case "5":
			boardPname = "악기";
			break;
		case "6":
			boardPname = "명품시계";
			break;
		case "7":
			boardPname = "악세사리";
			break;
		case "8":
			boardPname = "레저";
			break;

		}

		// page 설정
		if (pagePnum != null) {
			session.setAttribute("pagePnum", pagePnum);
		}

		pageNum = (String) session.getAttribute("pagePnum");
		if (pagePnum == null) {
			pagePnum = "1";
		}

		int limit = 10; // 한 페이지당 게시글 갯수
		int pageInt = Integer.parseInt(pagePnum); // 페이지 번호
		int boardCount = bd.boardCount(boardid); // 전체 게시글 갯수

		int boardNum = boardCount - ((pageInt - 1) * limit);

		List<Auction> li = bd.boardList(pageInt, limit, boardid);

		// paging
		int bottomLine = 3;
		int start = (pageInt - 1) / bottomLine * bottomLine + 1;
		int end = start + bottomLine - 1;
		int maxPage = (boardCount + limit - 1) / limit;

		if (end > maxPage) {
			end = maxPage;
		}

		req.setAttribute("bottomLine", bottomLine);
		req.setAttribute("start", start);
		req.setAttribute("end", end);
		req.setAttribute("maxPage", maxPage);
		req.setAttribute("pageInt", pageInt);

		req.setAttribute("li", li);
		req.setAttribute("boardPname", boardPname);
		req.setAttribute("boardCount", boardCount);
		req.setAttribute("boardNum", boardNum);

		return "board/products";

	}

	@RequestMapping("checkout")
	public String checkout(int num) throws Exception {
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
		Auction board = bd.oneBoard(num);
		req.setAttribute("board", board);

		return "/board/checkout";
	}

	@RequestMapping("buyList")
	
	public String buyList() throws Exception {
	
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
		List<Auction> li = bd.buyList(id);
	
		System.out.println(li);
		req.setAttribute("li", li);
	
		return "board/buyList";
	}

	@RequestMapping("boardInfo")
	public String boardInfo(int num, Model model) throws Exception {
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
		// Check if the user is 'banned' and show alert if true
		if (mem != null && "BANNED".equals(mem.getStatus())) {
			String msg = "경매기능 사용이 정지된 계정입니다." + "정지사유:" + mem.getBanreason() + "1대1문의를 이용해주세요";
			String url = "/member/index";
	
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "alert";
		}
	
		bd.cntBoard(num);
	
		Auction board = bd.oneBoard(num);
	
		// 신고 횟수 가져오기
		int reportcount = ad.selectReportCount(board.getUserid());
		model.addAttribute("reportcount", reportcount);
	
		List<AddbuyList> AddbuyList = bd.List(num);
		System.out.println(AddbuyList);
	
		int maxbuy = bd.maxbuycnt(num);
		System.out.println(maxbuy);
		model.addAttribute("maxbuy", maxbuy);
	
		List<Comment> commentLi = bd.commentList(num);
		int count = commentLi.size();
		req.setAttribute("commentLi", commentLi);
		req.setAttribute("board", board);
		req.setAttribute("count", count);
		req.setAttribute("ab", AddbuyList);
		
		return "board/boardInfo";
	}

	@RequestMapping("checkoutpro")
	   public String checkoutpro(Apay apay,int num, String memo,String tel,int sp,String bal,String end) throws Exception {
	      // TODO Auto-generated method stub
	
		
		Auction board = bd.oneBoard(num);
	      req.setAttribute("board", board); 
	  
	      Auction auction = new Auction();
	      auction.setPnum(num); // 컨트롤러에서 받은 num을 pnum으로 설정
	      auction.setEnd(end); // 컨트롤러에서 받은 end 값을 설정
	      bd.updateEnd(auction); // 수정된 DAO 메서드 호출
	      
	      String login = (String) session.getAttribute("id");
	      Amem mem = md.oneMember(login);
	      req.setAttribute("amem", mem);
	      String sum = cd.sum(login);
	       req.setAttribute("sum", sum);
	       String sum2 = cd.sum2(login);
	      req.setAttribute("sum2", sum2);
			String Tier = cd.tier(login);
			req.setAttribute("Tier", Tier);
	      
			num = bd.apay(apay); 
	      req.setAttribute("sp", sp); 
	      req.setAttribute("bal", bal); 
	      req.setAttribute("tel", tel);       
	       req.setAttribute("apay", apay);
	       req.setAttribute("memo", memo);
	 	  
	  
	       
	      return "/board/success";
	      
	   
	   }
	@RequestMapping("success")
	public String success(int num) throws Exception {
		// TODO Auto-generated method stub

		return "/board/success";
	}

	@RequestMapping("boardUpdateForm")
	public String boardUpdateForm(int num) throws Exception {
		String login = (String) session.getAttribute("id");
		Amem mem = md.oneMember(login);
		req.setAttribute("amem", mem);

		String Tier = cd.tier(login);
		req.setAttribute("Tier", Tier);
	    String sum = cd.sum(login);
	     req.setAttribute("sum", sum);
	     String sum2 = cd.sum2(login);
	    req.setAttribute("sum2", sum2);
		Auction board = bd.oneBoard(num);
		req.setAttribute("board", board);
		return "board/boardUpdateForm";
	}

	@RequestMapping("buyPro")
	public String buyPro(int pnum, String buy, String buyid, String id, Date buydate) throws Exception {
		String login = (String) session.getAttribute("id");
		Amem mem = md.oneMember(login);
		req.setAttribute("amem", mem);

		Auction board = new Auction();
		board.setPnum(pnum);
		board.setBuy(buy);
		board.setBuyid(buyid);

		int result = bd.updateBuy(board);

		// -- 기록 test
		AddbuyList ab = new AddbuyList();
		ab.setPnum(pnum);
		ab.setBuyid(buyid);
		ab.setBuy(buy);
		ab.setBuydate(buydate);

		bd.addTobuyList(ab);

		String msg;
		String url;

		if (result > 0) {
			msg = "입찰이 완료되었습니다.";
			url = "/board/boardInfo?num=" + pnum;
		} else {
			msg = "입찰에 실패하였습니다.";
			url = "/board/products"; // 실패 시 돌아갈 페이지를 정의해야 합니다.
		}

		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		System.out.println("pnum: " + pnum + ", buy: " + buy + ", buyid: " + buyid);
		return "alert";
	}

	@RequestMapping("buyNowPro")
	public String buyNowPro(int pnum, String userid, String prompt) throws Exception {
		Map<String, Object> params = new HashMap<>();
		params.put("pnum", pnum);
		params.put("userid", userid);
		params.put("prompt", prompt);

		System.out.println("pnum: " + pnum + ", userid: " + userid + ", prompt: " + prompt);
		int result = bd.buyNow(params);

		String msg;
		String url;

		if (result > 0) {
			msg = "즉시구매가 완료되었습니다.";
			url = "/board/boardInfo?num=" + pnum;
		} else {
			msg = "즉시구매에 실패하였습니다.";
			url = "/board/boardInfo?num=" + pnum; // 실패 시 돌아갈 페이지를 정의해야 합니다.
		}

		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "alert";
	}

	@RequestMapping("boardUpdatePro")
	public String boardUpdatePro(@RequestParam("f") MultipartFile multipartFile, Auction board) throws Exception {

		String path = req.getServletContext().getRealPath("/") + "image/board/";
		String filename = null;
		Auction originboard = bd.oneBoard(board.getPnum());

		String msg = "게시물 수정 실패";
		String url = "/board/boardForm?num=" + originboard.getPnum();
		if (originboard.getPass().equals(board.getPass())) {

			if (!multipartFile.isEmpty()) {
				File file = new File(path, multipartFile.getOriginalFilename());
				filename = multipartFile.getOriginalFilename();
				try {
					multipartFile.transferTo(file);
					board.setFile1(filename);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				board.setFile1(originboard.getFile1());
			}
			System.out.println(board);
			int count = bd.updateBoard(board);
			if (count > 0) {
				msg = "게시판 수정 완료";
				url = "/board/boardInfo?num=" + originboard.getPnum();
			}
		} else {
			msg = "비밀번호를 확인하세요.";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "alert";

	}

	@RequestMapping("reservComm")
	@ResponseBody
	public String reservComm(@RequestParam("ser") int ser) throws Exception {
		System.out.println(ser);
		bd.upcnt(ser);
		int upcnt = bd.getUpcnt(ser);
		System.out.println(upcnt);
		return "" + upcnt;
	}

	@RequestMapping("cntList")
	public String cntList(Model model, String pname) throws Exception {
		System.out.println(pname);

		List<Auction> li = bd.cntList(pname);

		model.addAttribute("li", li);
		System.out.println(li);

		return "board/allList";
	}

	@RequestMapping("boardDeleteForm")
	public String boardDeleteForm() throws Exception {
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
		req.setAttribute("pnum", req.getParameter("num"));
		return "board/boardDeleteForm";
	}

	@RequestMapping("boardDeletePro")
	public String boardDeletePro(HttpServletRequest req, int pnum, String pass) throws Exception {

		String login = (String) session.getAttribute("id");
		Amem mem = md.oneMember(login);
		req.setAttribute("amem", mem);

		Auction board = bd.oneBoard(pnum);
		String msg = "삭제 불가합니다";
		String url = "/board/boardDeleteForm?num=" + pnum;

		if (board.getPass().equals(pass)) {
			int count = bd.boardDelete(pnum);
			if (count > 0) {
				msg = "게시글이 삭제 되었습니다";
				url = "/jumun/myList";
			}

		} else {
			msg = "비밀번호 확인하세요";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "alert";

	}

	@RequestMapping("boardCommentPro")
	public View boardCommentPro(String comment, int boardnum) throws Exception {
		String userid = (String) session.getAttribute("id");
		bd.insertComment(comment, boardnum, userid);
		Comment c = new Comment();
		c.setNum(boardnum);
		c.setContent(comment);
		req.setAttribute("c", c);
		req.setAttribute("userid", userid); // 수정된 부분
		req.setAttribute("count", req.getParameter("count"));
		return new InternalResourceView("/single/boardCommentPro.jsp");
	}

	@RequestMapping("commentDeleteForm")
	public String commentDeleteForm(Integer ser) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(ser + "============");
		String login = (String) session.getAttribute("id");
		Amem mem = md.oneMember(login);
		req.setAttribute("amem", mem);
		req.setAttribute("ser", ser);
		req.setAttribute("pnum", req.getParameter("pnum"));
		return "/board/commentDeleteForm";
	}

	@RequestMapping("commentDeletePro")
	public String commentDeletePro(HttpServletRequest req, Integer ser, String pass) throws Exception {
		System.out.println(ser);
		String login = (String) session.getAttribute("id");
		Amem mem = md.oneMember(login);
		req.setAttribute("amem", mem);
		Comment comment = bd.oneComment(ser);
		String msg = "삭제 불가합니다";
		int boardNum = comment.getNum();
		String url = "/board/boardInfo?num=" + boardNum;	
			int count = bd.commentDelete(ser);
			if (count > 0) {
				msg = "댓글이 삭제 되었습니다";				
			}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		req.setAttribute("comment", comment); // comment 정보를 모델에 추가

		return "alert";
	}

}