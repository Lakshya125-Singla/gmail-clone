<%@ page import="java.sql.*" %>
<%
    Connection con = null;
    String url = "jdbc:mysql://localhost:3306/login";
    String user = "root";
    String password = "root";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url, user, password);
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<style>
body{
	color:black;
	// background:red;
}
</style>
<%@ page language="java" %>
<%
    String background = request.getParameter("background");
    if (background != null) {
        session.setAttribute("selectedBackground", background);
    }
    response.sendRedirect("Gmail-Layout.jsp");
%>

%>
