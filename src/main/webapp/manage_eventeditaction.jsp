<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.sql.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>event edit action</title>
</head>
<body>
<%
request.setCharacterEncoding("euc-kr");
if(request.getParameter("event_number") == null) {
   System.out.println("오류");
} else {
    int event_number = Integer.parseInt(request.getParameter("event_number"));
    System.out.println("manage_eventeditaction param event_number :" + event_number);
    String event_name = request.getParameter("event_name");
    System.out.println("manage_eventeditaction param event_name :"+event_name);
    String event_content = request.getParameter("event_content");
    System.out.println("manage_eventeditaction param event_content :"+event_content);
    String event_startdate = request.getParameter("event_startdate");
    System.out.println("manage_eventeditaction param event_startdate :"+event_startdate);
    String event_enddate = request.getParameter("event_enddate");
    System.out.println("manage_eventeditaction param event_enddate :"+event_enddate);

String DB_URL = "jdbc:mariadb://localhost:3306/scentmall";
String DB_USER = "root";
String DB_PASSWORD= "rVd4DUrcnKSY";

    Connection connection = null;
    PreparedStatement statement = null;
    try {
        Class.forName("org.mariadb.jdbc.Driver");
        connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        String selectSql = "UPDATE eventdb.event_table SET event_name=?, event_content=?, event_startdate=?, event_enddate=? WHERE event_number=?";
        statement = connection.prepareStatement(selectSql);
        statement.setString(1, event_name);
        statement.setString(2, event_content);
        statement.setString(3, event_startdate);
        statement.setString(4, event_enddate);
        statement.setInt(5, event_number);
        statement.executeUpdate();
        response.sendRedirect(request.getContextPath()+"/manage_eventview.jsp?event_number="+event_number);
    } catch(Exception e) {
        e.printStackTrace();
        out.print("BOARD MODIFY ERROR!");
    } finally {
        try {statement.close();} catch(Exception e){}
        try {connection.close();} catch(Exception e){}
    }
}
%>
</body>
</html>
