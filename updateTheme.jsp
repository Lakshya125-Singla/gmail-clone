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

<%
	String username=(String) session.getAttribute("user"); 
    
    String theme = request.getParameter("theme");

    PreparedStatement update = con.prepareStatement("UPDATE login SET theme=? WHERE Username=?");
    update.setString(1, theme);
    update.setString(2, username);

    int i = update.executeUpdate();
    if (i > 0) {
        out.print("<p style='color:green;'>Theme updated successfully!</p>");
    } else {
        out.print("<p style='color:red;'>Theme update failed.</p>");
    }

    con.close();
%>
