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
<%@ page import="java.sql.*" %>
<%
	String username=(String) session.getAttribute("user"); 
    String current = request.getParameter("currentPassword");
    String newPass = request.getParameter("newPassword");
    String confirmPass = request.getParameter("confirmPassword");

    PreparedStatement pst = con.prepareStatement("SELECT * FROM login WHERE Username=? AND Password=?");
    pst.setString(1, username);
    pst.setString(2, current);
    ResultSet rs = pst.executeQuery();
	if(newPass.equals(confirmPass))
	{

		if (rs.next()) {
			PreparedStatement update = con.prepareStatement("UPDATE login SET Password=? WHERE Username=?");
			update.setString(1, newPass);
			update.setString(2, username);
			int i = update.executeUpdate();
			if (i > 0) {
						response.sendRedirect("password_success.jsp");
			}
		} else {
									response.sendRedirect("password_failed.jsp");
		}
		con.close();
	}
	else{
												response.sendRedirect("password_not_match.jsp");
	}
	
%>