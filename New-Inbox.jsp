<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<%
    Connection con4 = null;
    String url3 = "jdbc:mysql://localhost:3306/login";
    String user3 = "root";
    String password3 = "root";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con4 = DriverManager.getConnection(url3, user3, password3);
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<%
   String username2 = (String) session.getAttribute("user");
    String theme2 = "Light";
    String bg3 = "#ffffff";

    PreparedStatement fetch2 = con4.prepareStatement("SELECT theme, background_color FROM login WHERE Username=?");
    fetch2.setString(1, username2);
    ResultSet rs3 = fetch2.executeQuery();
    if (rs3.next()) {
        theme2 = rs3.getString("theme") != null ? rs3.getString("theme") : "Light";
        bg3 = rs3.getString("background_color") != null ? rs3.getString("background_color") : "#ffffff";
    }
%>
<%
    String bg2 = (String) session.getAttribute("selectedBackground");
    if (bg2 == null) {
        bg2 = "default.jpg"; // fallback
    }
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inbox</title>
<style>
	 body {
				background-image: url('backgrounds/<%= bg %>');
				background-size: cover;
				background-repeat: no-repeat;
				background-attachment: fixed;
				font-family: Arial, sans-serif;
				margin: 0;
				color: #fff;
				// background: #f3f3f3;
				display: flex;
				justify-content: center;
			}
	// body {
            // font-family: Arial, sans-serif;
            // background: #f3f3f3;
            // // padding: 40px 10px;
            // display: flex;
            // justify-content: center;
	// }

     a{
		color:red;
	}
	a:active{
		color:purple;
	}

	.inbox-header {
            font-size: 24px;
            font-weight: bold;
            padding: 20px;
            border-bottom: 1px solid #eee;
	}

	.email-item {
            padding: 16px 20px;
            display: flex;
            justify-content: space-between;
            border-bottom: 1px solid #eee;
	}

	.email-item:last-child {
            border-bottom: none;
	}

	.email-subject {
            font-weight: bold;
            color: #333;
	}

	.email-time {
            color: #777;
	}
	td{
			width:300px;
			gap:23px;
			padding:15px 20px;
			border:2px dashed black;
			border-radius:5px;
	}
	.message{
			width:1000px;
	}
	.btn{
		display:flex;
		align-items:end;
		justify-content:end;
		padding:0px;
		margin:0px;
	}
  input[type="submit"] {
    margin: 10px 0;
    padding: 6px 12px;
    background-color: #d9534f;
    color: white;
    border: none;
    border-radius: 6px;
    cursor: pointer;
  }
  input[type="submit"]:hover {
    background-color: #c9302c;
  }
</style>
</head>
<body>
<%
	String seid2=(String) session.getAttribute("id"); 
%>    
<%@ page import="java.sql.*" %>
<%!
	Connection con = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	Statement st=null;
%>

<% String id2=(String)  session.getAttribute("id"); %>
<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","root");
	String sql = "SELECT * FROM inbox WHERE toid='"+id2+"'" ;
	st = con.createStatement();
	rs = st.executeQuery(sql);
	out.println("<table  width='100%' style='margin-top: 10px;'>");
%>
	<form action="Gmail-Layout.jsp">
	
<%
	while(rs.next())
	{
		out.println("<tbody id='mailTable'>");
		out.println("<tr>");	
		out.println("<td>");
		out.println("<input type='checkbox' class='mail-checkbox' value="+rs.getString(1)+ "  name=inbox-delete id='check' />");
		out.println("<a href='Inside-Mail.jsp'>");
		out.println(rs.getString(2));
		out.println("</a>	");
		out.println("</td>");
		out.println("<td>");
		out.println(rs.getString(3));
		out.println("</td>");
		out.println("<td class='message'>");
		out.println(rs.getString(4));
		out.println("</td>");
		out.println("<td class='message'>");
		out.println(rs.getString(5));
		out.println("</td>");
		out.println("</tr>");
		out.println("<tbody>");
	}
%>
<div class="btn">
		<input  value="Delete" name="delete" type="submit" id="delete">
		</div>
	<%
		out.println("</form>");
		out.println("</table>");

%>


</body>
</html>