package controller;

import java.io.File;
import java.io.IOException;
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



import dao.BoardMybatisDao;
import dao.CartMybatisDao;
import dao.MemberMybatisDao;


import model.Comment;
import model.Amem;
import model.Auction;


@Controller
@RequestMapping("/pay/")
public class payController  {
	@Autowired
	BoardMybatisDao bd;
	@Autowired
	MemberMybatisDao md;
	HttpSession session;
	HttpServletRequest req;
	@Autowired
	CartMybatisDao cd;  

	
	@ModelAttribute
	protected void service(HttpServletRequest request) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		this.session = request.getSession();
		this.req=request;
	}
	
	

	@RequestMapping("naver")
	public String naver() throws Exception {
		// TODO Auto-generated method stub
		return "/pay/naver";
	}
	


	
}