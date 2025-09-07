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
  <title>Starred Mail</title>
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

    table {
      width: 100%;
      border-collapse: collapse;
      background-color: white;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }

    th, td {
      padding: 12px 16px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }

    tr:hover {
      background-color: #f5f5f5;
    }

    .star {
      cursor: pointer;
      font-size: 20px;
      color: #ccc;
    }

    .starred {
      color: gold;
    }

  </style>
</head>
<body>

  <h2> Starred Mails</h2>


  <script>
    function toggleStar(element) {
      element.classList.toggle("starred");
    }
  </script>

</body>
</html>
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