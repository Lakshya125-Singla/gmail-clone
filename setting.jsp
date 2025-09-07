<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<%
    Connection con6 = null;
    String url6 = "jdbc:mysql://localhost:3306/login";
    String user6 = "root";
    String password6 = "root";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con6 = DriverManager.getConnection(url6, user6, password6);
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<%
   String username6 = (String) session.getAttribute("user");
    String theme6 = "Light";
    String bg6 = "#ffffff";

    PreparedStatement fetch6 = con6.prepareStatement("SELECT theme, background_color FROM login WHERE Username=?");
    fetch6.setString(1, username6);
    ResultSet rs6 = fetch6.executeQuery();
    if (rs6.next()) {
        theme6 = rs6.getString("theme") != null ? rs6.getString("theme") : "Light";
        bg6 = rs6.getString("background_color") != null ? rs6.getString("background_color") : "#ffffff";
    }
%>
<%
    String bg7 = (String) session.getAttribute("selectedBackground");
    if (bg7 == null) {
        bg7 = "default.jpg"; // fallback
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Settings - Gmail Clone</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<style>
		 body {
				background-image: url('backgrounds/<%= bg7 %>');
				background-size: cover;
				background-repeat: no-repeat;
				background-attachment: fixed;
				font-family: Arial, sans-serif;
				margin: 0;
				// padding: 20px;
				color: #fff;
			}

        .settings-container {
            max-width: 600px;
            margin: 80px auto;
            background: white;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            padding: 30px;
        }
        .settings-header {
            font-size: 1.8rem;
            font-weight: 600;
            margin-bottom: 20px;
            color: #202124;
        }
        .settings-list a {
            display: flex;
            align-items: center;
            text-decoration: none;
            padding: 15px;
            border-bottom: 1px solid #eee;
            color: #333;
            transition: 0.3s;
        }
        .settings-list a:hover {
            background-color: #f0f0f0;
        }
        .settings-list i {
            margin-right: 15px;
            font-size: 18px;
            color: #5f6368;
        }
    </style>
</head>
<body>


    <div class="settings-container">
        <div class="settings-header">
            <i class="fa-solid fa-gear"></i> Settings for <%= username != null ? username : username %>
        </div>

        <div class="settings-list">
            <a href="Gmail-Layout.jsp?snm=password"><i class="fas fa-lock"></i> Change Password</a>
            <a href="Gmail-Layout.jsp?snm=background"><i class="fas fa-image"></i> Change Background</a>
            <a href="Gmail-Layout.jsp?snm=theme"><i class="fas fa-paint-brush"></i> Change Theme</a>
            <a href="Gmail-Layout.jsp?snm=email"><i class="fas fa-envelope"></i> Change Email</a>
        </div>
    </div>

	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
