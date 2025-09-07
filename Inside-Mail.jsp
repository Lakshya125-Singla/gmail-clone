<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Read Mail - Gmail Clone</title>
  <style>
  body {
  font-family: Arial, sans-serif;
  margin: 0;
  background: #f6f8fc;
}

header {
  background-color: #fff;
  padding: 15px 20px;
  display: flex;
  align-items: center;
  border-bottom: 1px solid #ccc;
  position: sticky;
  top: 0;
}

header button {
  margin-right: 15px;
  padding: 6px 10px;
  font-size: 14px;
  cursor: pointer;
  border-radius: 6px;
  border: 1px solid #ccc;
  background-color: black;
  color:white;
}

.mail-content {
  background: #fff;
  margin: 20px auto;
  padding: 20px;
  max-width: 800px;
  border-radius: 12px;
  box-shadow: 0 2px 6px rgba(0,0,0,0.1);
}

.mail-header h2.subject {
  margin: 0;
  font-size: 20px;
}

.mail-meta {
  margin: 10px 0;
  font-size: 14px;
  color: #555;
}

.mail-meta p {
  margin: 5px 0;
}

.mail-body {
  margin-top: 20px;
  font-size: 16px;
  line-height: 1.6;
  color: #333;
}

  </style>

</head>
<body>
<header>
    <button onclick="goBack()"> Back </button>
    <h1>Mail View</h1>
  </header>

<%@ page import="java.sql.*" %>
<%!
Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		Statement st=null;
		%>

<%
			
	String id1=(String)  session.getAttribute("id");
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","root");
					
		String sql = "SELECT * FROM inbox where toid='"+id1+"'";
		st = con.createStatement();
		rs = st.executeQuery(sql);
		do
		{
	  out.println("<main class='mail-content'>");
		out.println("<div class='mail-header'>");
		  out.println("<h2 class='subject'>");
		  out.println(rs.getString(3)) ;
		  out.println("</h2>");
		  out.println("<div class='mail-meta'>");
			out.println("<p><strong>From:</strong>");
		out.println(rs.getString(1));
			out.println("</p>");
			out.println("<p><strong>To:</strong>");
				out.println(rs.getString(2));
			out.println("</p>");
			 out.println("<p><strong>Date:</strong> June 24, 2025 -- 9:42 AM</p>");
		   out.println("</div>");
		 out.println("</div>");
		 out.println("<div class='mail-body'>");
		   out.println("<p>");
		   out.println(rs.getString(4));
		   out.println("</p>");
		out.println("</div>");
	  out.println("</main>");
		}while(rs.next());
  %>
  <script>
  function goBack() {
  window.history.back(); // Or: window.location.href = 'mailbox.html';
}

  </script>
</body>
</html>
