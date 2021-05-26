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
<title></title>
<style>
html, body{
	width:100%;
	height:100%;
}
#wrap{
	width:1400px;
	height:100%;
	margin:0px auto;
}
body > #wrap{
	height:auto;
	min-height:100%;
}
#header{
	position:relative;
	padding-bottom:70px;
	border-bottom:1px solid #cccccc;
}
.logo{
	padding: 32px 0 12px 40px;
}
.logo img{
	margin-top:30px;
}
.topnav{
	position:absolute;
	right:30px;
	top:2px;
}
.topnav dd{
	float:left;
	font-size:12px;
	padding-right:11px;
	margin-right:10px;
}
.topnav dd a{
	color:black;
	font-size:1.1em;
	text-decoration:none;
}
.topnav dd a:hover{
	color:gray;
	text-decoration:underline;
}
#mainnav{
	display:block;
	padding-top:30px;
	padding-left:50px;
	float:left;
}
#mainnav dl{
	display:block;
	font:'Nanum Gothic', sans-serif;
	margin-top:10px;
	margin-bottom:36px;
}
#mainnav dt{
	color:black;
	font-weight:bold;
	font-size:16px;
}
#mainnav dt a{
	color:black;
	text-decoration:none;
}
#mainnav dt a:hover{
	color:gray;
	text-decoration:line-through;
}
#mainnav dd{
	display:block;
	margin-top:15px;
}
#mainnav dd a{
	color:black;
	font-size:0.9em;
	text-decoration:none;
}
#mainnav dd a:hover{
	color:gray;
	text-decoration:underline;
}

#container{
	position:relative;
	padding-bottom:550px;
	*zoom: 1;
}
#container:after{
	content:'';
	display:block;
	clear:both;
}
#content{
	position:absolute;
	display:inlen-block;
	top:100px;
	left:450px;
	width:800px;
	height:600px;
	margin:0 auto;
}
#content{
	width:800px;
	margin:0px auto;
}
#content table{
	width:100%;
	border-collapse:collapse;
	font-size:14px;
	line-height:24px;
}
#content table td, th{
	border:#d3d3d3 solid 1px;
	paading: 30px;
}
#content table tr{
	height:50px;
}
#content table th{
	background:gray;
}
#content table input, #content table select, #content table textarea{
	margin-left:10px;
}
#footer{
	position:relative;
	margin-top:-101px;
	background-color:#fff;
}
#footer .footerArea{
	border-top: 1px solid #cccccc;
	padding: 0;
	width: 1400px;
	height: 100px;
	margin: 0 auto;	
	color: #666;
	font-size: 0.9em;
	*zoom: 1;
}
#footer .footerArea:after{
	content: '';
	display: block;
	clear: both;	
}
#footer .copy{
	margin-left:38%;
	font-family: 'Nanum Gothic', sans-serif;
}
</style>
</head>
<body>
<%


String uploadDir = "/event_img";

int maxSize = 1024 * 1024 * 100;
String encoding = "UTF-8";
MultipartRequest multipartRequest= new MultipartRequest(request, uploadDir, maxSize, encoding, new DefaultFileRenamePolicy());

String fileName = multipartRequest.getOriginalFileName("file");
String event_banner = multipartRequest.getFilesystemName("file");

String event_name = multipartRequest.getParameter("event_name");
System.out.println("param event_name:"+ event_name);
String event_content = multipartRequest.getParameter("event_content");
System.out.println("param event_content:"+ event_content);
String event_startdate = multipartRequest.getParameter("event_startdate");
System.out.println("param event_startdate:"+ event_startdate);
String event_enddate = multipartRequest.getParameter("event_enddate");
System.out.println("param event_startdate:"+ event_enddate);
System.out.println("param event_startdate : " + event_banner);

String DB_URL = "jdbc:mariadb://localhost:3306/scentmall";
String DB_USER = "root";
String DB_PASSWORD= "rVd4DUrcnKSY";
Connection connection = null;
PreparedStatement statement = null;
try {
    Class.forName("org.mariadb.jdbc.Driver");
    connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    if(connection != null){
    	out.println("WebDB 데이터페이스로 연결했습니다. <br>");
    }
    String sql = "INSERT INTO event_table(event_name, event_content, event_startdate, event_enddate, event_banner) values(?,?,?,?,?)";
    statement = connection.prepareStatement(sql);
    statement.setString(1,event_name);
    statement.setString(2,event_content);
    statement.setString(3,event_startdate);
    statement.setString(4,event_enddate);
    statement.setString(5,event_banner);
    statement.executeUpdate();
    
response.sendRedirect(request.getContextPath()+"/manage_eventlist.jsp");
} catch(Exception e) {
    e.printStackTrace();
    out.print("입력 예외 발생");
} finally {
    try {statement.close();} catch(Exception e){}
    try {connection.close();} catch(Exception e){}
}
%>
</body>
</html>
