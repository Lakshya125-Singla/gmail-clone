<%@ page import="java.sql.*" %>
<%
    int mailId = Integer.parseInt(request.getParameter("sno"));

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "root");
        
        // TOGGLE the star value
        PreparedStatement ps = con.prepareStatement("UPDATE inbox SET is_starred = NOT is_starred WHERE id = ?");
        ps.setInt(1, mailId);
        ps.executeUpdate();
        
        response.sendRedirect("Gmail-Layout.jsp?nm=inbox");
        ps.close();
        con.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
