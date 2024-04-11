package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


import model.Amem;



public class AdminInterceptor extends HandlerInterceptorAdapter {
	
	
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
       
        
		   System.out.println("AdminInterceptor preHandle 작동");
	        
	        HttpSession session = request.getSession();
	     
	        
	         Amem mem = (Amem)session.getAttribute("mem");
	        
	         System.out.println(mem);
	        
	      
        
  
	         if (mem == null || mem.getAdminchk().equals("0")) { // 관리자 계정 아닌 경우
	        	    response.sendRedirect(request.getContextPath() + "/member/loginForm"); // 메인페이지로 리다이렉트
	        	    return false;
	        	} else { // 나머지 코드
	        	//    response.sendRedirect(request.getContextPath() + "/admin/main");
	        	    return true;  // 관리자 계정 로그인 경우(lvo != null && lvo.getAdminCk() == 1)
	        	}
	         
	       
	        
	}
  
	
	

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response,Object handler,Exception ex)
		throws Exception{
		System.out.println("AdminInterceptor afterCompletion");
	}
	
	
	
	
	
	
}
