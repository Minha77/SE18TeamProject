<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session = request.getSession();
	String user_id = (String)session.getAttribute("id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Scentmall</title>
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
	padding-bottom:440px;
	*zoom: 1;
	
}
#container:after{
	content:'';
	display:block;
	clear:both;
}
#content{
	display:block;
	position:absolute;
	left:150px;
	padding:30px;
}
#content img{
	margin-left:90px;
	width:1000px;
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

<--header 시작-->
<%@ include file="/header.jsp" %>
<--header 끝-->

<div id="wrap">
	<div id="header">
		<h1 class="logo"><a href="index.jsp"><img src="/img/logo.jpg"/></a></h1>	
		<dl class="topnav">
			<dd><a href="user_login.jsp">
			<%
				if(user_id == null) {
			%>		login
			<%
				} else {
			%>
					<%= user_id %>님 로그인
			<%
				}
			%>
			</a></dd>
			
			<dd><a href="ControllerServlet?command=logout"><% if(user_id != null) %>log out</a></dd>
			<dd><a href="#"><% if(user_id != null) %>my page</a></dd>
			<dd><a href="#"><% if(user_id != null) %>cart</a></dd>
			<dd><a href="ControllerServlet?command=user_order_list"><% if(user_id != null) %>order</a></dd>
			<dd><a href="manager_login.jsp"><% if(user_id==null) %>manager</a></dd>
		</dl>
	</div> <!-- header -->
	<dd><a href="/join/agreement.jsp">회원가입</a></dd>
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
			<dl class="category_qna">
				<dt><a href="#">Q & A</a></dt>
			</dl>
		</div> <!-- mainnav -->
		<div id="content">
			<h1>
				<img src="img/main_img.png"/>
			</h1>
			<h1>
				<img src="img/main_img2.png"/>
			</h1>
			
		</div>
	</div> <!-- container -->
</div> <!-- wrap -->

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