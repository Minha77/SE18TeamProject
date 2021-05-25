<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
		// db 연결 부분
         String DB_URL = "jdbc:mariadb://localhost:3306/scentmall";

         String DB_USER = "root";

         String DB_PASSWORD= "rVd4DUrcnKSY";

         Connection conn;

         Statement stmt;
         
         ResultSet result;

         try {

              Class.forName("org.mariadb.jdbc.Driver");

              conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

              stmt = conn.createStatement();
				
              //입력받은 id와 email 값과 db에 있는 값을 비교해서 같은 같이 있으면 중복이므로 회원가입 실패 -> 메인화면으로 돌려보낸다
			  String query = "SELECT idno FROM user WHERE id = '" + request.getParameter("user_id") + "' OR email = '" + request.getParameter("user_email") + "'";
			  
			  result = stmt.executeQuery(query);
              
              //중복된 id나 email이 존재하면 오류 알림과 함께 메인화면으로 이동시킴
              if(result.next())
              {
            	  out.println("<script>alert('회원가입 실패(잘못된 요청입니다)');</script>");
            	  out.println("<script>window.location='/index.jsp';</script>");
              }
              else
              {
            	  //db에 회원정보를 저장
            	  String join_query = "INSERT INTO user (id, pw, name, email, created) VALUES ('" + request.getParameter("user_id") + "', '" + request.getParameter("user_pw") + "', '" + request.getParameter("user_nickname") + "', '" + request.getParameter("user_email") + "',  now()) ";
            	  
            	  out.println("<script>alert('회원가입이 완료되었습니다!');</script>");
            	  stmt.executeUpdate(join_query);
            	  
            	  //session 생성 로그인 구현되면 이부분 로그인jsp파일로 넘기는 것으로 수정
            	  session.setAttribute("id", request.getParameter("user_id"));
            	  session.setAttribute("idno", request.getParameter("idno"));
            	  session.setAttribute("isadmin", "0");
            	  session.setAttribute("name", request.getParameter("user_nickname"));
            	  session.setAttribute("email", request.getParameter("user_email"));
            	  
            	  out.println("<script>window.location='/index.jsp';</script>");
            	  
              }
              
         }

         catch(Exception e){

              out.println(e);

         }

%>
