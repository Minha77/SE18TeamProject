<%@ page language="java" pageEncoding="utf8"%>
<%@ page import="dao.EventDAO, dto.EventVO, java.util.*" %>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>관리자 공지사항 목록</title>
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
			<h2>이벤트 / 공지사항 목록</h2>
			
			<%
int currentPage = 1;
if(request.getParameter("currentPage") != null) {
    currentPage = Integer.parseInt(request.getParameter("currentPage"));
}
 
int totalRowCount = 0;

String DB_URL = "jdbc:mariadb://localhost:3306/scentmall";
String DB_USER = "root";
String DB_PASSWORD= "rVd4DUrcnKSY";

Connection connection = null;
PreparedStatement totalStatement = null;
PreparedStatement listStatement = null;
ResultSet totalResultSet = null;
ResultSet listResultSet = null;

try {
    connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    Class.forName("org.mariadb.jdbc.Driver");
    String totalSql = "SELECT COUNT(*) FROM event_table";
    totalStatement = connection.prepareStatement(totalSql);
    totalResultSet = totalStatement.executeQuery();
    if(totalResultSet.next()) {
        totalRowCount = totalResultSet.getInt(1);
    }
%>
    <div>전체행의 수 : <%=totalRowCount%></div>
<%    
    int pagePerRow = 10;
    String listSql = "SELECT event_number, event_name, event_startdate, event_enddate FROM event_table LIMIT ?,?";
    listStatement = connection.prepareStatement(listSql);
    listStatement.setInt(1, (currentPage-1)*pagePerRow); 
    listStatement.setInt(2, pagePerRow); 
    listResultSet = listStatement.executeQuery();
%>
    <table border="1">
        <thead>
            <tr>
            	<th>no.</th>
                <th>event name</th>
                <th>event startdate</th>
                <th>event enddate</th>
            </tr>
        </thead>
        <tbody>
<%
            while(listResultSet.next()) {
%>
                <tr>
                	<td><%=listResultSet.getInt("event_number")%></td>
                    <td><a href="<%=request.getContextPath()%>/manage_eventview.jsp?event_number=<%=listResultSet.getInt("event_number")%>"><%=listResultSet.getString("event_name")%></a></td>
                    <td><%=listResultSet.getString("event_startdate")%></td>
                    <td><%=listResultSet.getString("event_enddate")%></td>
<%        
            }
%>
        </tbody>
    </table>
<%
    int lastPage = totalRowCount/pagePerRow;
    if(totalRowCount%pagePerRow != 0) {
        lastPage++;
    }
%>
<%
        if(currentPage>1) {
%>
            <a href="<%=request.getContextPath()%>/manage_eventlist.jsp?currentPage=<%=currentPage-1%>">이전</a>
<%
        }
        if(currentPage < lastPage) {
%>
 
            <a href="<%=request.getContextPath()%>/manage_eventlist.jsp?currentPage=<%=currentPage+1%>">다음</a>
<%
        }
%>
    </div>
<%
} catch(Exception e) {
    e.printStackTrace();
    out.print("데이터 가져오기 에러!");
} finally {
    try {totalResultSet.close();} catch(Exception e){}
    try {listResultSet.close();} catch(Exception e){}
    try {totalStatement.close();} catch(Exception e){}
    try {listStatement.close();} catch(Exception e){}
    try {connection.close();} catch(Exception e){}
}
%>
	</div>
<!--footer 시작-->
<%@ include file="/footer.jsp" %>
<!--footer 끝-->
</body>
</html>
