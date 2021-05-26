<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="dao.CategoryDAO, dto.CategoryVO, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	if(session.getAttribute("mLogin") == null) {
		RequestDispatcher dispatcher = request.getRequestDispatcher("manager_login.jsp");
		dispatcher.forward(request, response);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head><style>
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
pr{
	background-color:#ffcc00;
	border-bottom:1px dotted #9933aa;
}
</style>
<script type="text/javascript">
	function registerCheck() {
		if(document.product_form.product_name.value.length==0) {
			alert("상품명을 기재하세요.");
			product_form.product_name.focus();
			return false;
		}
		if(document.product_form.product_price.value.length==0) {
			alert("가격을 기재하세요.");
			product_form.product_price.focus();
			return false;
		}
		if(isNaN(document.product_form.product_price.value)) {
			alert("숫자를 입력하세요.");
			product_form.product_price.focus();
			return false;
		}
		if(document.product_form.product_content.value.length==0) {
			alert("내용을 기재하세요.");
			product_form.product_content.focus();
			return false;
		}
		
		return true;
	}
</script>
</head>
<body>
<div id="wrap">
	<div id="header">
		<h1 class="logo"><a href="index.jsp"><img src="img/logo.png"/></a></h1>	
		<dl class="topnav">
			<dd><a href="ControllerServlet?command=logout">log out</a></dd>
			<dd><a href="manager_login.jsp">manager</a></dd>
		</dl>
	</div> <!-- header -->
	
	<div id="container">
		<div id="mainnav">
			<dl class="category_about_us">
				<dt><a href="#">about us</a></dt>
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
			
		</div> <!-- mainnav -->
		<div id="content">
			<br><h2>Regsiter Product</h2><br>
			<form name="product_form" action="ControllerServlet?command=manager_upload" 
			method="post" enctype="multipart/form-data">
			<table border=0 width="680px">	
				<tr>
					<th class="pr">성별 카테고리</th>
					<td>
					<select name="product_sex_category" style="width:150px">
					<%
						CategoryDAO cDao = CategoryDAO.getInstance();
						ArrayList<CategoryVO> cList = cDao.getAllSexCategory();
						
						for(CategoryVO cVo : cList) {
							String categorySex = cVo.getCategorySex();
					%>
						<option value=<%=categorySex %>>
						<%=categorySex %>
						</option>
					<%
						}
					%>
					</select>
					</td>
				</tr>
				<tr>
					<th class="pr">등급 카테고리</th>
					<td>
					<select name="product_level_category" style="width:150px">
					<%
						ArrayList<CategoryVO> cList2 = cDao.getAllLevelCategory();
						for(CategoryVO cVo : cList2) {
							String categoryLevel = cVo.getCategoryLevel();
					%>
						<option value=<%=categoryLevel %>>
						<%=categoryLevel %>
						</option>
					<%
						}
					%>
					</select>
					</td>
				</tr>
				<tr>
					<th class="pr">상품 이름</th>
					<td align="left">
						<input type="text" name="product_name">
					</td>
				</tr>
				<tr>
					<th class="pr">상품 가격</th>
					<td>
						<input type="text" name="product_price" maxlength="10">
					</td>
				</tr>
				<tr>
					<th class="pr">상품 소개</th>
					<td>
						<textarea name="product_content" row="12" cols="50"></textarea>
					</td>
				</tr>
				<tr>
					<th class="pr">상품 이미지</th>
					<td>
						<input type="file" name="product_image"/><br>
						(# 파일 최대크기 20MB)
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" onclick="return registerCheck()" value="상품 등록"/>
						<input type="reset" value="취소"/>
					</td>
				</tr>
			</table>
			</form>
		</div>
	</div> <!-- container -->
</div> <!-- wrap -->

<div id="footer">
	<div class="footerArea">
		<p class="copy">
			&copy; Copyright WebServer Programming Project <br>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Team 8 Sonminho, Leewujin <br>
			&nbsp; &nbsp; &nbsp; &nbsp;Contact us smin2846@gmail.com
		</p>
	</div>
</div>
</body>
</html>