<%@ page language="java" pageEncoding="utf8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>이벤트 페이지</title>
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
<!--header 시작-->
<%@ include file="/header.jsp" %>
<!--header 끝-->
	
	<div id="container">
		<div id="mainnav">
			<dl class="category_about_us">
				<dt><a href="#">about us</a></dt>
			</dl>
			<dl class="category_shop">
				<dt><a href="#">shop</a></dt>
				<dd><a href="ControllerServlet?command=product_list&category=man">Man</a></dd>
				<dd><a href="ControllerServlet?command=product_list&category=woman">Woman</a></dd>
				<dd><a href="ControllerServlet?command=product_list2&category=perfume">Perfume</a></dd>
				<dd><a href="ControllerServlet?command=product_list2&category=eaudeperfume">Eau de perfume</a></dd>
				<dd><a href="ControllerServlet?command=product_list2&category=eaudecologne">Eau de cologne</a></dd>
				<dd><a href="#">Recommend</a></dd>
			</dl>
			<dl class="category_community">
				<dt><a href="#">community</a></dt>
			</dl>
			<dl class="category_event">
				<dt><a href="<%=request.getContextPath()%>/eventlist.jsp">Event/Notice</a></dt>
			</dl>
			<dl class="category_qna">
				<dt><a href="#">Q & A</a></dt>
			</dl>
		</div>
		
		<div id="content">
<%
if(request.getParameter("event_number") == null) {
    response.sendRedirect(request.getContextPath()+"/eventlist.jsp");
} else {
	int event_number = Integer.parseInt(request.getParameter("event_number"));
    System.out.println("event_number :"+event_number);
String DB_URL = "jdbc:mariadb://localhost:3306/scentmall";
String DB_USER = "root";
String DB_PASSWORD= "rVd4DUrcnKSY";

    Connection connection = null;
    PreparedStatement statement = null;
    ResultSet resultSet = null;
    try {
        Class.forName("org.mariadb.jdbc.Driver");
        connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        String sql = "SELECT event_name, event_content, event_startdate, event_enddate, event_banner FROM event_table WHERE event_number=?";
        statement = connection.prepareStatement(sql);
        statement.setInt(1, event_number);
        resultSet = statement.executeQuery();
        
        if(resultSet.next()) {
%>
			<table>
            <tr>
            <th>event_number :</th>
            <td><%=event_number%></td>
            </tr>
            <tr>
            <th>board_title :</th>
            <td> <%=resultSet.getString("event_name")%></td>
            </tr>
            <tr>
            <th>board_content :</th> <td><%=resultSet.getString("event_content")%></td></tr>
            <tr><th>board_img :</th> <td><%=resultSet.getString("event_banner")%><img src="/event_img/<%=resultSet.getString("event_banner")%>"></td></tr>
            <tr>
            <th>board_startdate :</th> <td><%=resultSet.getString("event_startdate")%></td></tr>
            <tr>
            <th>board_enddate :</th> <td><%=resultSet.getString("event_enddate")%></td></tr>
            </table>
<%
        }
    } catch(Exception e) {
        e.printStackTrace();
        out.println("BOARD VIEW ERROR!");
    } finally {
        try {resultSet.close();} catch(Exception e){}
        try {statement.close();} catch(Exception e){}
        try {connection.close();} catch(Exception e){}
    }
}
%>
	</div>
<!--footer 시작-->
<%@ include file="/footer.jsp" %>
<!--footer 끝-->
</body>
</html>
