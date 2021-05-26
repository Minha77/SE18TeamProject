<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Addup 향수 관리자 공지사항 추가 페이지</title>
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

<script type="text/javascript">
	function registerCheck() {
		if(document.event_form.event_name.value.length==0) {
			alert("이벤트명을 기재하세요.");
			event_form.event_name.focus();
			return false;
		}
		if(document.event_form.event_content.value.length==0) {
			alert("내용을 기재하세요.");
			event_form.product_content.focus();
			return false;
		}
		if(isNaN(document.event_form.start_date.value)) {
			alert("시작일자를 입력하세요.");
			event_form.event_startdate.focus();
			return false;
		}
		if(isNaN(document.event_form.end_date.value)) {
			alert("종료일자를 입력하세요.");
			event_form.event_enddate.focus();
			return false;
		}
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
				<dd><a href="<%=request.getContextPath()%>/manage_eventlist.jsp">Event/Notice List</a></dd>
				<dd><a href="<%=request.getContextPath()%>/manage_eventadd.jsp">Event/Notice Register</a></dd>
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
     <h2>이벤트 / 공지사항 추가페이지</h2>

<form name="event_form" method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/manage_eventaddaction.jsp">
    <div>이벤트 명 : </div>
    <div><input type="text" name="event_name" id="event_name" /></div>
    <div>이벤트 내용 : </div>
    <div><textarea name="event_content" id="event_content" rows="5" cols="50"></textarea></div>
    <div>이벤트 시작일 : </div>
    <div><p><input type="date" name="event_startdate" id="event_startdate" value="2021-05-26" min="2021-05-26" max="2099-12-31"></p></div>
    <div>이벤트 종료일 : </div>
    <div><p><input type="date" name="event_enddate" id="event_enddate" value="2021-05-26" min="2000-01-01" max="2099-12-31"></p></div>
    <div>첨부파일</div>
    <div><input type="file" name="file" size=40/></div>
    <div>
        <input type="submit" onclick="return registerCheck()" value="글 입력"/>
        <input type="reset" value="초기화"/>
    </div>
</form>
		</div>
		</div>
<!--footer 시작-->
<%@ include file="/footer.jsp" %>
<!--footer 끝-->
</body>
</html>
