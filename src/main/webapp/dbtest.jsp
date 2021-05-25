<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import=”java.sql.*”

         contentType=”text/html;charset=utf-8″%>

<%

         String DB_URL = “jdbc:mariadb://localhost:3306/scentmall”;

         String DB_USER = “root”;

         String DB_PASSWORD= “rVd4DUrcnKSY”;

         Connection conn;

         Statement stmt;

         try {

              Class.forName(“org.gjt.mm.mysql.Driver”);

              conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

              stmt = conn.createStatement();

              conn.close();

              out.println(“MySQL Connection Success!”);

         }

         catch(Exception e){

              out.println(e);

         }

%>
</body>
</html>