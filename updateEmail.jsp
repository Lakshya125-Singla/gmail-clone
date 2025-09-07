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
    String current = request.getParameter("currentEmail");
    String newEmail = request.getParameter("newEmail");
    String confirmEmail = request.getParameter("confirmEmail");

	PreparedStatement pst = con.prepareStatement("SELECT * FROM login WHERE Username=? AND Id=?");
	pst.setString(1, username);
	pst.setString(2, current);
	ResultSet rs = pst.executeQuery();
	if(newEmail.equals(confirmEmail))
	{
		if (rs.next()) 
		{
			PreparedStatement update = con.prepareStatement("UPDATE login SET Id=? WHERE Username=?");
			update.setString(1, newEmail);
			update.setString(2, username);
			int i = update.executeUpdate();
			if (i > 0) 
			{
						response.sendRedirect("email_success.jsp");
			}
		}
			else 	
			{
													response.sendRedirect("email_failed.jsp");
			}
		con.close();
	}
	else{
														response.sendRedirect("email_not_match.jsp");
	}
%>
