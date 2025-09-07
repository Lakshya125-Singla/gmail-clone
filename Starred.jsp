<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    // String username5 = (String) session.getAttribute("username");
    // if (username5 == null) {
        // response.sendRedirect("signup.jsp");
        // return;
    // }

    // int mailId = Integer.parseInt(request.getParameter("mail_id"));

    Connection conn = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "root");

        String sql = "UPDATE emails SET starred = 1 WHERE id = ?";
        ps = conn.prepareStatement(sql);
        ps.setInt(1, mailId);

        int updated = ps.executeUpdate();

        // Redirect back to inbox or sent page
        response.sendRedirect("Inbox.jsp"); // or "Send.jsp" depending on where it's called from

    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        try { if(ps != null) ps.close(); } catch(Exception e) {}
        try { if(conn != null) conn.close(); } catch(Exception e) {}
    }
%>
// <%
// if(theme.equals("Light")){
	// %>
	// <style>
	// body{
		// color:black;
		// background:white;
	// }
	// </style>
	// <%
// }
// else if(theme.equals("Dark")){
	// %>
	// <style>
		// body{
			// color:white;
			// background:black;
		// }
		// </style>
		// <%
// }
// else if(theme.equals("Blue")){
	// %>
	// <style>
		// body{
			// color:white;
			// background:blue;
		// }
		// </style>
		// <%
// }
// else if(theme.equals("Red")){
	// %>
	// <style>
		// body{
			// color:white;
			// background:red;
		// }
		// </style>
		// <%
// }
// else{
	// %>
	// <style>
	// body{
		// color:black;
		// background:#f3f3f3;
	// }
	// <%
// }
	
// %>