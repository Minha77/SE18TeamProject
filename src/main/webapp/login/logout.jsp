<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//세션 삭제하고 알림창 띄우고 메인화면으로 
	session.removeAttribute("id");
	session.removeAttribute("idno");
	session.removeAttribute("isadmin");
	session.removeAttribute("name");
	session.removeAttribute("email");
	
	out.println("<script>alert('로그아웃 되었습니다');</script>");
	out.println("<script>window.location='/index.jsp';</script>");
%>