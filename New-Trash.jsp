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
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Trash Mails</title>
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


    h2 {
      color: #202124;
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
	a{
		color:red;
	}
	a:active{
		color:purple;
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

  <%@ page import="java.sql.*" %>
<%!
	Connection ccon = null;
	PreparedStatement ppst = null;
	ResultSet rrs = null;
	Statement sst=null;
%>

<%
	String id1=(String) session.getAttribute("id");
	// String id2=(String) session.getAttribute("id");
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	ccon = DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","root");
		
		String sql = "SELECT * FROM trash WHERE id='" + id1 + "' OR toid='" + id1 + "'";
		sst = ccon.createStatement();
		rrs = sst.executeQuery(sql);
			out.println("<table  width='100%' style='margin-top: 10px;'>");
%>
	<form action="Gmail-Layout.jsp">
<%
		while(rrs.next())
		{
		out.println("<tbody id='mailTable'>");
			out.println("<tr>");	
			out.println("<td>");
			out.println("<input type='checkbox' class='mail-checkbox' value="+rrs.getString(1)+ "  name='trash-delete' id='check' />");
			out.println("<a href='Inside-Mail.jsp'>");
			out.println(rrs.getString(2));
			out.println("</a>	");
			out.println("</td>");
			out.println("<td>");
			out.println(rrs.getString(3));
			out.println("</td>");
			out.println("<td class='message'>");
			out.println(rrs.getString(4));
			out.println("</td>");
			out.println("<td class='message'>");
			out.println(rrs.getString(5));
			out.println("</td>");
			out.println("</tr>");
			out.println("<tbody>");
		}
%>
<div class="btn">
		<input value="Delete" name="delete" type="submit" id="delete"></input>
	</div>
<%
		out.println("</form>");
			out.println("</table>");
%>
</body>
</html>
