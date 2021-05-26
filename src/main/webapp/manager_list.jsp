<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="dao.ProductDAO, dto.ProductVO, java.util.*" %>
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
	padding-bottom:400px;
	*zoom: 1;
}
#container:after{
	content:'';
	display:block;
	clear:both;
}
#content{
	width:1000px;
	margin:0px auto;
}
#content table{
	position:relative;
	padding-left:80px;
	width:700px;
	margin:0px auto;
}
#content table tr{
	text-align:center;
	height:80px;
}
#content table td{
	min-width:140px;
}
#content table #column{
	background:gray;
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
		<br>
		<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Product List</h2>
			<table width=80% border=0>
				<tr id="column">
					<th>번호</th>
					<th>상품명</th>
					<th>상품가격</th>
					<th>성별</th>
					<th>등급</th>
					<th>상품 이미지</th>
					<th>비고</th>
				</tr>
				<%
					ProductDAO pdao = ProductDAO.getInstance();
					ArrayList<ProductVO> list = pdao.getAllProducts();
					
					for(ProductVO pVo : list) {
				%>
						<tr>
							<td><%=pVo.getProductNumber()%></td>
							<td><%=pVo.getProductName()%></td>
							<td><%=pVo.getProductPrice()%></td>
							<td><%=pVo.getProductSexCategory() %></td>
							<td><%=pVo.getProductLevelCategory() %></td>
							<td>
					<%
							String imagePath = request.getContextPath() +"/upload_image/"
							+ pVo.getProductImage();
							System.out.println(imagePath + "이미지 경로");
							request.setAttribute("productVO", pVo);
					%>	
							<img src="<%=imagePath %>" border=0 width=80 height=80>
							</td>
							<td>
							<a href="ControllerServlet?command=manager_update&product_number=<%=pVo.getProductNumber()%>">수정</a> | 
							<a href="ControllerServlet?command=manager_delete&product_number=<%=pVo.getProductNumber()%>">삭제</a></td>
						</tr>
				<%		
					}
				%>
			</table>
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