<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, dao.ProductDAO, dto.ProductVO" %>    
<%
	String user_id = (String)request.getSession().getAttribute("uLogin");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Addup 향수</title>
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
	width:200px;
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
	width:100%;
	position:relative;
	padding-bottom:440px;
	height:1100px;
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
	float:right;
	left:150px;
	padding:30px;
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
#content{
	padding:20px 90px;
	floate:right;
	width:1150px;
}
#content ul{
	padding:30px 50px;
	background: #f1f1f1;
	list-style:none;
}
#product_list{
	width:1200px;
	height:600px;
	text-align:center;
	margin-top:60px;
}
#product_list img{
		padding-top:50px;
}
#detail{
	background:#f1f1f1;
}

</style>
</head>
<body>
<div id="wrap">
	<div id="header">
		<h1 class="logo"><a href="index.jsp"><img src="img/logo.png"/></a></h1>	
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
			<ul>
				<% ProductVO pVo = (ProductVO)request.getAttribute("product"); %>
				<li><%= pVo.getProductName() %></li>
			</ul>
			<div id="product_list">
			<table>
				<tr>
					<td style="width:600px; height:600px;">
						<%
							String imagePath = request.getContextPath() +"/upload_image/"
							+ pVo.getProductImage();
							System.out.println(imagePath + "이미지 경로");
							request.setAttribute("product", pVo);
						%>
						<img border=0 width=550px height=550px src="<%=imagePath %>"/>
					</td>
					<td id="detail" style="width:540px; height:600px;">
						<table id="detail_table">
							<tr style="width:600px; height:100px;"><th style="width:120px; text-align:center">상&nbsp;품&nbsp;변&nbsp;호&nbsp;&nbsp;:
							</th><td style="width:480px;"><%= pVo.getProductNumber() %></td></tr>
						
							<tr style="width:540px; height:100px;"><th style="width:100px; text-align:center">&nbsp;&nbsp;성&nbsp;&nbsp;별&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
							</th><td style="width:480px;"><%= pVo.getProductSexCategory() %></td></tr>
						
							<tr style="width:540px; height:100px;"><th style="width:120px; text-align:center">상&nbsp;품&nbsp;농&nbsp;도&nbsp;&nbsp;:
							</th><td style="width:480px;"><%= pVo.getProductLevelCategory() %></td></tr>
							
							<tr style="width:540px; height:100px;"><th style="width:120px; text-align:center">상&nbsp;품&nbsp;가&nbsp;격&nbsp;:
							</th><td style="width:480px;"><%= pVo.getProductPrice() %>원</td></tr>
							
							<tr style="width:540px; height:150px;"><th style="width:120px; text-align:center">상&nbsp;품&nbsp;내&nbsp;용&nbsp;:
							</th><td style="width:480px;"><%= pVo.getProductContent() %></td></tr>
							
							<tr style="width:540px; height:100px;">
								<td>
										<input type="button" style="width:160px; height:50px; margin-left:30px" value="주문하기" 
										onclick="location.href='ControllerServlet?command=user_order&product_number=<%=pVo.getProductNumber()%>'"></input>
								</td>
								<td>
										<input type="button" style="width:160px; height:50px; margin-left:30px" value="장바구니"></input>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
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