<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
		//이미 로그인 중이면 홈으로 돌려보냄
        session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");

		if(user_id != null) 
		{
			out.println("<script>alert('이미 로그인 중입니다.');</script>");
			 out.println("<script>window.location='/index.jsp';</script>");
		}
		else //
		{
			String input_id = request.getParameter("id");
			String input_pw = request.getParameter("pw");
			
			
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
					
	              //입력받은 아이디로 db검색 
				  String query = "SELECT * FROM user WHERE id = '" + input_id + "'";
				  
				  result = stmt.executeQuery(query);
	              
	              //id가 존재할경우
	              if(result.next())
	              {
	            	  String pw = result.getString("pw");
	            	  
	            	  //db와 입력받은 pw 값을 비교
	            	  if(pw.equals(input_pw))
	            	  {
	            		  //일치하는 경우 세션 생성하고 메인화면으로 보냄
	            		  session.setAttribute("id", result.getString("id"));
		            	  session.setAttribute("idno", result.getString("idno"));
		            	  session.setAttribute("isadmin", result.getString("isadmin"));
		            	  session.setAttribute("name", result.getString("name"));
		            	  session.setAttribute("email", result.getString("email"));
		            	  
		            	  //관리자 아이디일 경우 관리자 메인페이지로 보냄
		            	  if(result.getString("isadmin").equals("0"))
		            	  {
		            		  out.println("<script>window.location='/index.jsp';</script>");
		            	  }
		            	  else
		            	  {
		            		  out.println("<script>window.location='/manage_main.jsp';</script>");
		            	  }
		            	  
	            		 
	            	  }
	            	  else
	            	  {
	            		  //비밀번호가 일치하지 않는 경우 경고메세지 띄우고 메인화면으로 보냄
	            		  out.println("<script>alert('로그인 실패 - 아이디, 비밀번호를 확인해주세요');</script>");
	            		  out.println("<script>window.location='/index.jsp';</script>");
	            	  }
	              }
	              else
	              {
	            	//아이디가 db에 검색되지 않는 경우 경고메세지 띄우고 메인화면으로 보냄
            		  out.println("<script>alert('로그인 실패 - 아이디, 비밀번호를 확인해주세요');</script>");
            		  out.println("<script>window.location='/index.jsp';</script>");
	            	  
	              }
	              
	         }

	         catch(Exception e){

	              out.println(e);

	         }
			
		}

		

%>
