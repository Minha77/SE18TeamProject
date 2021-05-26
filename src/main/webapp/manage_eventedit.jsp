<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.sql.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>event edit page</title>
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
#content form{
	padding:120px;
	width:250px;
	margin:0 auto;
}
#content input{
	margin-top:30px;
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
<h1>이벤트 수정</h1>
<div id="header">
		<h1 class="logo"><a href="index.jsp"><img src="img/logo.png"/></a></h1>	
		<dl class="topnav">
			<dd><a href="ControllerServlet?command=logout">logout</a></dd>
			<dd><a href="manager_login.jsp">manager</a></dd>
		</dl>
	</div>
	<div id="container">
		<div id="mainnav">
		<dl class="category_about_us">
				<dt><a href="#">about us</a></dt>
				</dl>
			<dl class="Event_Noitce">
				<dt><a href="#">Event/Notice</a></dt>
				<dd><a href="ControllerServlet?command=manage_eventlist">Event/Notice List</a></dd>
				<dd><a href="ControllerServlet?command=manage_eventadd">Event/Notice Register</a></dd>
			</dl>
			<dl class="category_shop">
				<dt><a href="#">Product</a></dt>
				<dd><a href="ControllerServlet?command=manager_register">Product Register</a></dd>
				<dd><a href="ControllerServlet?command=manager_list">Product List</a></dd>
				<dd><a href="ControllerServlet?command=manager_order_list">Product order</a></dd>
				<dd><a href="#">Product Q & A</a></dd>
			</dl>
			<dl class="community">
				<dt><a href="#">Community</a>
			</dl>
			<dl>
				<dt><a href="">logout</a></dt>
			</dl>
		</div>
<%
if(request.getParameter("event_number") == null) {
    response.sendRedirect(request.getContextPath()+"/manage_eventlist.jsp");
} else {
    int event_number = Integer.parseInt(request.getParameter("event_number"));
    System.out.println("boardModify param event_number:"+ event_number);
    String event_name = "";
    String event_content = "";
    String event_startdate = "";
    String event_enddate = "";
    String event_banner = "";
    
    String ID ="root";
    String PWD ="asdf";
    String PORTNO ="3306";
    String DBNAME="eventdb";
    String TIMEZONE ="serverTimezone=UTC";
    String Query ="jdbc:mysql://localhost:" + PORTNO +"/" + DBNAME +"?"+TIMEZONE;
    Connection connection = null;
    PreparedStatement statement = null;
    ResultSet resultSet = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(Query, ID, PWD);
        String selectSql = "SELECT event_name, event_content, event_startdate,event_enddate,event_banner FROM event_table WHERE event_number=?";
        statement = connection.prepareStatement(selectSql);
        statement.setInt(1, event_number);
        resultSet = statement.executeQuery();
        if(resultSet.next()) {
            event_name = resultSet.getString("event_name");
            event_content = resultSet.getString("event_content");
            event_startdate=resultSet.getString("event_startdate");
            event_enddate=resultSet.getString("event_enddate");
            event_banner=resultSet.getString("event_banner");
            
        } else {
            response.sendRedirect(request.getContextPath()+"/manage_eventlist.jsp");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.print("BOARD MODIFY FROM ERROR!");
    } finally {
        try {resultSet.close();} catch(Exception e){}
        try {statement.close();} catch(Exception e){}
        try {connection.close();} catch(Exception e){}
    }
%>    
<div id="content">
    <form method="post" action="<%=request.getContextPath()%>/manage_eventeditaction.jsp">
        <div>event_number</div>
        <div><input name="event_number" value="<%=event_number%>" type="text" readonly="readonly"/></div>
        <div> event_name : <input name="event_name" id="event_name" type="text" value="<%=event_name%>"/></div>
        <div>event_content : </div>
        <div><textarea name="event_content" id="event_content" rows="5" cols="50"><%=event_content%></textarea></div>
        <div>이벤트 시작일 : </div>
    <div><p><input type="date" name="event_startdate" id="event_startdate" value="<%=event_startdate%>" min="2021-05-26" max="2099-12-31"></p></div>
    <div>이벤트 종료일 : </div>
    <div><p><input type="date" name="event_enddate" id="event_enddate" value="<%=event_enddate%>" min="2000-01-01" max="2099-12-31"></p></div>
        <div>
            <input type="submit" value="글수정"/>
            <input type="reset" value="초기화"/>
        </div>
    </form>
    </div>
    <%
}
    %>
    </div>
		<div id="footer">
	<div class="footerArea">
		<p class="copy">
			&copy; Copyright Software Engineering Project <br>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Team 18 Parksungho, Hwangminha, Leewujin <br>
			&nbsp; &nbsp; &nbsp; &nbsp;Contact us rkddkwl219@gmail.com
		</p>
	</div>
	</div>
</body>
</html>