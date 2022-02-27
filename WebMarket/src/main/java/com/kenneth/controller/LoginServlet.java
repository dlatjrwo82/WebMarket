package com.kenneth.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kenneth.dao.MemberDAO;
import com.kenneth.dto.MemberVO;

@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("member/login.jsp");	// 페이지 이동
		dispatcher.forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "member/login.jsp";		
		
		request.setCharacterEncoding("UTF-8");		// post 방식 한글처리
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();		// 출력처리
		
		//MemberDAO mDao = new MemberDAO();
		MemberDAO mDao = MemberDAO.getInstance();
		
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		
		int result = mDao.userCheck(userid, pwd);
		
		if (result == 1) {
			//out.print("<br>" + mVo.getName());
			
			// 입력한 userid에 관련 정보를 데이터베이스에서 조회
			MemberVO mVo = mDao.getMember(userid);
			
			HttpSession session = request.getSession();		// 세션 사용 방법
			session.setAttribute("loginUser", mVo);			// 회원 정보를 세션에 저장
			
			//out.print("인증이 완료되었습니다.");		// 회원 전용 페이지로 이동
			request.setAttribute("message", "인증이 완료되었습니다.");
			url = "main.jsp";
		} else if (result == 0 ) {
			//out.print("비밀번호가 맞지 않습니다.");		// 다시 로그인 시도
			request.setAttribute("message", "비밀번호가 맞지 않습니다.");
		} else {
			//out.print("존재하지 않는 회원입니다.");		// 회원 가입 시도
			request.setAttribute("message", "존재하지 않는 회원입니다.");
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
	}
}
