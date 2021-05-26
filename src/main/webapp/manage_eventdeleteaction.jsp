<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>event delete action</title>
</head>
<body>
<%
if(request.getParameter("event_number") == null) {
    response.sendRedirect(request.getContextPath()+"/manage_eventlist.jsp");
} else {
    int event_number = Integer.parseInt(request.getParameter("event_number"));
    System.out.println("event_number :"+ event_number);
    String DB_URL = "jdbc:mariadb://localhost:3306/scentmall";
    String DB_USER = "root";
    String DB_PASSWORD= "rVd4DUrcnKSY";
    Connection connection = null;
    PreparedStatement statement = null;
    try {
        Class.forName("org.mariadb.jdbc.Driver");
        connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        String sql = "DELETE FROM event_table WHERE event_number=?";
        statement = connection.prepareStatement(sql);
        statement.setInt(1, event_number);
        if(statement.executeUpdate()==1){
            response.sendRedirect(request.getContextPath()+"/manage_eventlist.jsp");
        } else {
            response.sendRedirect(request.getContextPath()+"/manage_eventdelete.jsp?event_number="+event_number);
        }
    } catch(Exception e) {
        e.printStackTrace();
        out.print("BOARD REMOVE ERROR!");
    } finally {
        try {statement.close();} catch(Exception e){}
        try {connection.close();} catch(Exception e){}
    }
}
%>
</body>
</html>
