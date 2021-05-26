<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>관리자 페이지</title>
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

<script type="text/javascript">
	function loginCheck() {
		if(document.frm.id.value.length == 0) {
			alert("아이디를 입력해주세요");
			frm.id.focus();
			return false;
		}
		if(document.frm.pw.value.length == 0) {
			alert("비밀번호를 입력해주세요");
			frm.pw.focus();
			return false;
		}
		
		return true;
	}
</script>

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
		
		<div id="content">
			<h1>관리자 메인 페이지입니다.</h1>
		</div>
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