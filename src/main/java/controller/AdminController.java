package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dao.AdminMybatisDao;

import dao.BoardMybatisDao;
import dao.MemberMybatisDao;
import dao.NoticeMybatisDao;
import model.Amem;
import model.Auction;
import model.Comment;
import model.Notice;
import model.Report;

@Controller
@RequestMapping("/admin/")
public class AdminController {

	@Autowired
	HttpSession session;
	HttpServletRequest request;
	@Autowired
	AdminMybatisDao ad;
	@Autowired
	MemberMybatisDao md;
	@Autowired
	BoardMybatisDao bd;
	@Autowired
	NoticeMybatisDao nc;

	@RequestMapping("main")
	public String main() throws Exception {
		// TODO Auto-generated method stub
		return "admin/main";
	}

	@ModelAttribute
	protected void service(HttpServletRequest request) throws ServletException, IOException {
		this.request = request;
		request.setCharacterEncoding("utf-8");
		this.session = request.getSession();

	}

	@RequestMapping("answerinfo")
	public String Answerinfo(Model model, @RequestParam int num) throws UnsupportedEncodingException, SQLException {
		// contentReport 메서드 호출
		Notice answerinfo = nc.contentanswer(num);

		// 모델에 데이터 추가
		model.addAttribute("answerinfo", answerinfo);

		// 뷰 이름 반환
		return "admin/answerinfo";
	}

	@RequestMapping("AdminReport")
	public String AdminReport() throws Exception {

		return "admin/AdminReport";

	}

	@RequestMapping("AnswerForm")
	public String AnswerForm(@RequestParam("num") String num, Model model) {
		// name과 subject 값을 사용하는 로직 추가
		// ...
		model.addAttribute("num", num);
		return "admin/AnswerForm";
	}

	@RequestMapping("AnswerPro")
	public String AnswerPro(@RequestParam(name = "num", required = true) int num,
			@RequestParam("answer") String answer) {
		// num과 answer를 사용하여 DAO를 통해 업데이트 수행

		int adminnotice = ad.updateAnswer(num, answer);

		String msg = "답변 등록 완료";

		request.setAttribute("msg", msg);

		return "adminalert";

	}

	@RequestMapping("ReportForm")
	public String ReportForm(int num) throws Exception {
		System.out.println(num);
		String login = (String) session.getAttribute("id");
		Amem mem = md.oneMember(login);
		request.setAttribute("amem", mem);
		Auction auc = ad.oneReport(num);

		request.setAttribute("auction", auc);

		return "admin/ReportForm";

	}

	@RequestMapping("ReportPro")
	public String ReportPro(HttpServletRequest request, int pnum) throws Exception {
		System.out.println("pro  " + pnum);
		String login = (String) session.getAttribute("id");
		Amem mem = md.oneMember(login);
		request.setAttribute("amem", mem);
		Auction auc = ad.oneReport(pnum);
		request.setAttribute("auction", auc);
		Report rep = new Report();

		// 사용자가 제출한 내용
		String content = request.getParameter("content"); // 실제로는 요청에서 받아오는 데이터로 대체"

		rep.setReportid(login);
		rep.setReportpnum(pnum);
		rep.setContent(content);
		rep.setRegdate(new Date());
		rep.setReportedid(auc.getUserid());
		// ReportService를 통해 데이터 저장
		ad.insertReport(rep);

		String msg = "게시물 신고 완료";
		String url = "/board/boardInfo?num=" + pnum;

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert";
	}

	@RequestMapping("Reportlist")
	public String reportList(Model model) {
		List<Report> reportList = ad.selectReportList();
		model.addAttribute("reportList", reportList);
		return "admin/Reportlist";
	}

	@RequestMapping("reportInfo")
	public String reportInfo(Model model, @RequestParam int reportpnum, String amemid) {
		// contentReport 메서드 호출
		List<Report> reportlist = ad.contentReport(reportpnum, amemid);

		// 모델에 데이터 추가
		model.addAttribute("reportlist", reportlist);

		// 뷰 이름 반환
		return "admin/reportInfo";
	}

	@RequestMapping("deleteReportPro")
	public String deleteReportPro(int reportpnum) {
		// DAO에서 deleteReport 호출
		ad.deleteReport(reportpnum);

		// 삭제 후 어떤 페이지로 이동할지 리턴
		return "admin/Reportlist";
	}

	@RequestMapping("MemberList")
	public String MemberList(Model model) {
		List<Amem> memberList = ad.selectMemberList();
		model.addAttribute("memberList", memberList);
		return "admin/MemberList";
	}

	@RequestMapping("Question")

	public String Question(Model model) throws Exception {
		Notice notice = new Notice();
		// List<Notice> QuestionList = nc.noticeList(pageInt,limit,"3");
		List<Notice> QuestionList = nc.selectQuestionList();

		model.addAttribute("QuestionList", QuestionList);

		System.out.println(QuestionList);
		return "admin/Question";

	}

	@RequestMapping("deleteMembers")
	public String deleteMembers(@RequestParam("selectedMembers") String selectedMembers) {
		String[] ids = selectedMembers.split(",");
		ad.deleteMembers(ids);
		System.out.println(selectedMembers);
		return "admin/MemberList";
	}

	@RequestMapping("banreasonform")
	public String banreasonform(String id, Model model) {

		model.addAttribute("id", id);
		return "/admin/banreasonform";
	}

	@RequestMapping("banmember")
	public String banmember(@RequestParam("id") String id, @RequestParam("banreason") String banreason) {
		ad.banMember(id, banreason);
		return "redirect:/admin/MemberList";
	}
	@RequestMapping("Unbanmember")
	public String UnbanMember(@RequestParam("id") String id) {
		ad.UnbanMember(id);
		return "redirect:/admin/MemberList";
	}

}
