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
    String ID ="root";
    String PWD ="asdf";
    String PORTNO ="3306";
    String DBNAME="eventdb";
    String TIMEZONE ="serverTimezone=UTC";
    String Query ="jdbc:mysql://localhost:" + PORTNO +"/" + DBNAME +"?"+TIMEZONE;
    Connection connection = null;
    PreparedStatement statement = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(Query, ID, PWD);
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