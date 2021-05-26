<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>BOARD REMOVE FORM</title>
</head>
<body>
<%
if(request.getParameter("event_number") == null) {
    response.sendRedirect(request.getContextPath()+"manage_eventlist.jsp");
} else {
%>
    <form action="<%=request.getContextPath()%>/manage_eventdeleteaction.jsp" method="post">
        <input name="event_number" value="<%=request.getParameter("event_number")%>" type="hidden"/>
        <div>삭제하시겠습니까?</div>
        <div>
            <input type="submit" value="삭제"/>
            <input type="reset" value="초기화"/>
        </div>
    </form>
<%    
}
%>
</body>
</html>