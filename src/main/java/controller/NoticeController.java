package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dao.CartMybatisDao;
import dao.MemberMybatisDao;
import dao.NoticeMybatisDao;
import model.Amem;
//import dao.BoardMybatisDao;

import model.Notice;

@Controller
@RequestMapping("/notice/")
public class NoticeController {
	@Autowired
	MemberMybatisDao md;
	HttpSession session;
	HttpServletRequest req;
	@Autowired
	NoticeMybatisDao nc;

	@Autowired
	CartMybatisDao cd;

	@ModelAttribute
	protected void init(HttpServletRequest request) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		this.session = request.getSession();
		this.req = request;

	}

	@RequestMapping("index") // ~~/board/index
	public String index() throws Exception {
		return "notice/index";
	}

	@RequestMapping("noticeForm")
	public String noticeForm() throws Exception {
		String login = (String) session.getAttribute("id");
		Amem mem = md.oneMember(login);
		req.setAttribute("amem", mem);
		String Tier = cd.tier(login);
		req.setAttribute("Tier", Tier);
		String sum = cd.sum(login);
		req.setAttribute("sum", sum);
		String sum2 = cd.sum2(login);
		req.setAttribute("sum2", sum2);
		return "notice/noticeForm";
	}

	@RequestMapping("noticePro")
	public String noticePro(@RequestParam("f") MultipartFile multipartFile, Notice notice,
			@RequestParam(name = "isPublic", defaultValue = "N") String ispublic) throws Exception {

		String path = req.getServletContext().getRealPath("/") + "image/board/";
		String filename = null;
		String msg = "게시물 등록 실패";
		String url = "/notice/noticeForm";

		String boardid = (String) session.getAttribute("boardid");
		String name = (String) session.getAttribute("id");
		if (boardid == null)
			boardid = "1";

		notice.setBoardid(boardid);
		notice.setName(name);
		notice.setIsPublic(ispublic);

		if (!multipartFile.isEmpty()) {
			File file = new File(path, multipartFile.getOriginalFilename());
			filename = multipartFile.getOriginalFilename();
			try {
				multipartFile.transferTo(file);
				notice.setFile1(filename);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		int num = nc.insertNotice(notice);
		if (num > 0) {
			msg = "게시물 등록 성공";
			url = "/notice/noticeList";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "alert";
	}

	

	@RequestMapping("noticeInfo")
	public String noticeInfo(String boardid, int num) throws Exception {
		// TODO Auto-generated method stub
		if (boardid != null) { // ? boardid = 3
			session.setAttribute("boardid", boardid);
			session.setAttribute("pageNum", "1");
		}
		boardid = (String) session.getAttribute("boardid");
		if (boardid == null)
			boardid = "1";
		String noticeName = "";
		switch (boardid) {
		case "1":
			noticeName = "공지사항";
			break;
		case "2":
			noticeName = "자주묻는질문";
			break;
		case "3":
			noticeName = "1:1문의";
			break;
		}
		req.setAttribute("noticeName", noticeName);

		String login = (String) session.getAttribute("id");
		Amem mem = md.oneMember(login);

		req.setAttribute("amem", mem);
		Notice notice = nc.oneNotice(num);

		String msg = "";
		String url = "";
		if (notice.getIsPublic().equals("Y") || notice.getName().equals(login)) {
			// 공개된 글이면 정보 전달
			req.setAttribute("notice", notice);
			String Tier = cd.tier(login);
			req.setAttribute("Tier", Tier);

			String sum = cd.sum(login);
			req.setAttribute("sum", sum);
			String sum2 = cd.sum2(login);
			req.setAttribute("sum2", sum2);

			return "/notice/noticeInfo";
		} else {

			msg = "비공개 설정";
			url = "/notice/noticeList";

		}

		req.setAttribute("msg", msg);
		req.setAttribute("url", url);

		return "alert";
	}

	@RequestMapping("noticeUpdateForm")
	public String noticeUpdateForm(int num) throws Exception {
		// TODO Auto-generated method stub

		Notice notice = nc.oneNotice(num);
		String login = (String) session.getAttribute("id");
		Amem mem = md.oneMember(login);
		req.setAttribute("amem", mem);

		req.setAttribute("notice", notice);
		String Tier = cd.tier(login);
		req.setAttribute("Tier", Tier);

		String sum = cd.sum(login);
		req.setAttribute("sum", sum);
		String sum2 = cd.sum2(login);
		req.setAttribute("sum2", sum2);
		return "notice/noticeUpdateForm";
	}

	@RequestMapping("noticeUpdatePro")
	public String noticeUpdatePro(@RequestParam("f") MultipartFile multipartFile, Notice notice) throws Exception {

		String path = req.getServletContext().getRealPath("/") + "image/board/";
		String filename = null;

		Notice originnotice = nc.oneNotice(notice.getNum());

		String msg = "게시물 수정 실패";
		String url = "/notice/noticeForm?num=" + originnotice.getNum();
		if (originnotice.getPass().equals(notice.getPass())) {

			if (!multipartFile.isEmpty()) {
				File file = new File(path, multipartFile.getOriginalFilename());
				filename = multipartFile.getOriginalFilename();
				try {
					multipartFile.transferTo(file);
					notice.setFile1(filename);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				notice.setFile1(originnotice.getFile1());
			}
			System.out.println(notice);
			int count = nc.updateNotice(notice);
			if (count > 0) {
				msg = "게시판 수정 완료";
				url = "/notice/noticeInfo?num=" + originnotice.getNum();
			}
		} else {
			msg = "비밀번호를 확인하세요.";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "alert";

	}

	@RequestMapping("noticeDeleteForm")
	public String noticeDeleteForm() throws Exception {
		String login = (String) session.getAttribute("id");
		Amem mem = md.oneMember(login);
		req.setAttribute("amem", mem);
		String Tier = cd.tier(login);
		req.setAttribute("Tier", Tier);
		req.setAttribute("num", req.getParameter("num"));
		return "notice/noticeDeleteForm";
	}

	@RequestMapping("noticeDeletePro")
	public String noticeDeletePro(int num) throws Exception {

		Notice notice = nc.oneNotice(num);
		String msg = "삭제 불가합니다";
		String url = "/notice/noticeDeleteForm?num=" + num;
		if (notice.getPass().equals(req.getParameter("pass"))) {
			int count = nc.noticeDelete(num);
			if (count > 0) {
				msg = "게시글이 삭제 되었습니다";
				url = "/notice/noticeList";
			}

		} else {
			msg = "비밀번호 확인하세요";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "alert";

	}
	@RequestMapping("noticeList")
	public String noticeList(String boardid, String pageNum) throws Exception {
		// TODO Auto-generated method stub

		// board session 처리한다.
		if (boardid != null) { // ? boardid = 3
			session.setAttribute("boardid", boardid);
			session.setAttribute("pageNum", "1");
		}
		boardid = (String) session.getAttribute("boardid");
		if (boardid == null)
			boardid = "1";
		String noticeName = "";
		switch (boardid) {
		case "1":
			noticeName = "공지사항";
			break;
		case "2":
			noticeName = "자주묻는질문";
			break;
		case "3":
			noticeName = "1:1문의";
			break;
		}
		// page 설정
		if (pageNum != null) {
			session.setAttribute("pageNum", pageNum);
		}

		pageNum = (String) session.getAttribute("pageNum");
		if (pageNum == null)
			pageNum = "1";

		int limit = 10; // 한페이장 게시글 갯수
		int pageInt = Integer.parseInt(pageNum); // 페이지 번호
		int noticeCount = nc.noticeCount(boardid); // 전체 개시글 갯수

		int noticeNum = noticeCount - ((pageInt - 1) * limit);

		List<Notice> li = nc.noticeList(pageInt, limit, boardid);

		// pagging
		int bottomLine = 3;
		int start = (pageInt - 1) / bottomLine * bottomLine + 1; // 1,2,3->1 ,,4,5,6->4
		int end = start + bottomLine - 1;
		int maxPage = (noticeCount / limit) + (noticeCount % limit == 0 ? 0 : 1);
		if (end > maxPage)
			end = maxPage;

		req.setAttribute("bottomLine", bottomLine);
		req.setAttribute("start", start);
		req.setAttribute("end", end);
		req.setAttribute("maxPage", maxPage);
		req.setAttribute("pageInt", pageInt);

		req.setAttribute("li", li);
		req.setAttribute("noticeName", noticeName);
		req.setAttribute("noticeCount", noticeCount);
		req.setAttribute("noticeNum", noticeNum);

		String login = (String) session.getAttribute("id");
		Amem mem = md.oneMember(login);
		req.setAttribute("amem", mem);
		String Tier = cd.tier(login);
		req.setAttribute("Tier", Tier);
		String sum = cd.sum(login);
		req.setAttribute("sum", sum);
		String sum2 = cd.sum2(login);
		req.setAttribute("sum2", sum2);
		return "notice/noticeList";
	}
	
	@RequestMapping("mynotice")
	public String mynotice(String boardid, String pageNum) throws Exception {
		// TODO Auto-generated method stub
		// board session 처리한다.
		if (boardid != null) { // ? boardid = 3
			session.setAttribute("boardid", boardid);
			session.setAttribute("pageNum", "1");
		}
		boardid = (String) session.getAttribute("boardid");
		if (boardid == null)
			boardid = "1";
		String noticeName = "";
		switch (boardid) {
		case "1":
			noticeName = "공지사항";
			break;
		case "2":
			noticeName = "자주묻는질문";
			break;
		case "3":
			noticeName = "1:1문의";
			break;
		}
		// page 설정
		if (pageNum != null) {
			session.setAttribute("pageNum", pageNum);
		}

		pageNum = (String) session.getAttribute("pageNum");
		if (pageNum == null)
			pageNum = "1";

		int limit = 3; // 한페이장 게시글 갯수
		int pageInt = Integer.parseInt(pageNum); // 페이지 번호
		int noticeCount = nc.noticeCount(boardid); // 전체 개시글 갯수
		System.out.println(noticeCount + "======" + boardid);
		int noticeNum = noticeCount - ((pageInt - 1) * limit);
		String login = (String) session.getAttribute("id");
		List<Notice> li = nc.mynotice(pageInt, limit, boardid, login);

		// pagging
		int bottomLine = 3;
		int start = (pageInt - 1) / bottomLine * bottomLine + 1; // 1,2,3->1 ,,4,5,6->4
		int end = start + bottomLine - 1;
		int maxPage = (noticeCount / limit) + (noticeCount % limit == 0 ? 0 : 1);
		if (end > maxPage)
			end = maxPage;

		req.setAttribute("bottomLine", bottomLine);
		req.setAttribute("start", start);
		req.setAttribute("end", end);
		req.setAttribute("maxPage", maxPage);
		req.setAttribute("pageInt", pageInt);

		req.setAttribute("li", li);
		req.setAttribute("noticeName", noticeName);
		req.setAttribute("noticeCount", noticeCount);
		req.setAttribute("noticeNum", noticeNum);

		
		Amem mem = md.oneMember(login);
		req.setAttribute("amem", mem);
		String Tier = cd.tier(login);
		req.setAttribute("Tier", Tier);
		String sum = cd.sum(login);
		req.setAttribute("sum", sum);
		String sum2 = cd.sum2(login);
		req.setAttribute("sum2", sum2);
		

		return "notice/mynotice";
	}
}
