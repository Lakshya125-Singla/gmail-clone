<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<%
    Connection con = null;
    String url = "jdbc:mysql://localhost:3306/login";
    String user1 = "root";
    String password = "root";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url, user1, password);
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<%
   String username = (String) session.getAttribute("user");
    String theme = "Light";
    String bg1 = "#ffffff";

    PreparedStatement fetch = con.prepareStatement("SELECT theme, background_color FROM login WHERE Username=?");
    fetch.setString(1, username);
    ResultSet rs = fetch.executeQuery();
    if (rs.next()) {
        theme = rs.getString("theme") != null ? rs.getString("theme") : "Light";
        bg1 = rs.getString("background_color") != null ? rs.getString("background_color") : "#ffffff";
    }
%>
<%
    String bg = (String) session.getAttribute("selectedBackground");
    if (bg == null) {
        bg = "default.jpg"; // fallback
    }
%>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Gmail Clone UI</title>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

	body {
		       background: #f3f3f3;
				background-image: url('backgrounds/<%= bg %>');
				background-size: cover;
				background-repeat: no-repeat;
				background-attachment: fixed;
				font-family: Arial, sans-serif;
				margin: 0;
				// padding: 20px;
				color: #fff;
				display: flex;
				height: 100vh;
				
			}
   

    /* Sidebar */
    .sidebar {
      width: 240px;
      background-color: #f1f3f4;
      border-right: 1px solid #ccc;
      transition: width 0.3s;
      overflow-x: hidden;
    }

    .sidebar.collapsed {
      width: 60px;
    }

    .sidebar .nav-item {
      display: flex;
      align-items: center;
      padding: 12px 20px;
      cursor: pointer;
      color: #333;
      transition: background 0.2s;
      position: relative;
	  text-decoration:none;
    }

    .sidebar .nav-item:hover {
      background-color: #a5d3ff;
	  text-decoration:none;
    }

    .sidebar .material-icons {
      margin-right: 20px;
	  text-decoration:none;
    }

    .sidebar.collapsed .nav-text {
      display: none;
	  text-decoration:none;
    }

    .sidebar.collapsed .nav-item::after {
      content: attr(data-tooltip);
      position: absolute;
	  text-decoration:none;
      left: 100%;
      top: 50%;
      transform: translateY(-50%);
      background: #333;
      color: #fff;
      font-size: 12px;
      padding: 4px 8px;
      border-radius: 4px;
      white-space: nowrap;
      opacity: 0;
      pointer-events: none;
      transition: opacity 0.3s;
    }

    .sidebar.collapsed .nav-item:hover::after {
      opacity: 1;
	  text-decoration:none;
    }

    /* Main Layout */
    .main {
      flex: 1;
      display: flex;
	  
      flex-direction: column;
    }

    /* Navbar */
    .navbar {
		
      height: 64px;
	  color:black;
	  text-decoration:none;
      background-color: #fff;
      border-bottom: 1px solid #ccc;
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 0 16px;
    }

    .navbar .left,
    .navbar .right {
      display: flex;
	  color:black;
	  text-decoration:none;
      align-items: center;
    }

    .navbar .material-icons {
      cursor: pointer;
      padding: 8px;
	  color:black;
	  text-decoration:none;
      border-radius: 50%;
      transition: background 0.2s;
    }

    .navbar .material-icons:hover {
      background-color: #f1f3f4;
	  color:black;
	  text-decoration:none;
    }

    .navbar .logo {
      font-size: 22px;
	  text-decoration:none;
      font-weight: bold;
      color: #d93025;
      margin-left: 16px;
    }

    .search-bar {
      flex: 1;
      margin: 0 20px;
      position: relative;
    }

    .search-bar input {
      width: 100%;
      padding: 10px 40px;
      border-radius: 24px;
      border: 1px solid #ccc;
      font-size: 14px;
    }

    .search-bar .material-icons {
      position: absolute;
      top: 50%;
	  padding:0px 20px 0px 0px;
      left: 12px;
      transform: translateY(-50%);
      color: #888;
    }

	.content {
		padding: 20px;
		text-decoration:none;
		overflow-y: auto;
		color:black;
	}

    @media (max-width: 768px) {
      .sidebar {
        width: 70px;
      }
      .sidebar .nav-text {
        display: none;
      }
      .search-bar {
        margin: 0 10px;
      }
    }
  
.compose-btn {
  background-color: #c2e7ff;
  border: none;
  padding: 10px 20px;
  margin: 10px;
  font-weight: bold;
  border-radius: 25px;
  cursor: pointer;
  width: 120px;
}

.compose-box {
  display: none;
  position: fixed;
  bottom: 30px;
  right: 30px;
  width: 400px;
  background: white;
  box-shadow: 0 4px 15px rgba(0,0,0,0.3);
  border-radius: 10px;
  z-index: 9999;
  padding: 15px;
}

.compose-box.active {
  display: block;
}

.compose-box input,
.compose-box textarea {
  width: 100%;
  padding: 8px;
  margin-bottom: 10px;
  border-radius: 6px;
  border: 1px solid #ccc;
}

.compose-header {
  display: flex;
  justify-content: space-between;
  margin-bottom: 10px;
  font-weight: bold;
}

.close-compose {
  background: none;
  border: none;
  font-size: 20px;
  cursor: pointer;
}

.compose-actions {
  display: flex;
  justify-content: flex-end;
  gap: 10px;
}


.compose-link {
  display: flex;
  align-items: center;
  background-color: #c2e7ff;
  color: #000;
  font-weight: bold;
  padding: 10px 10px;
  margin: 20px;
  border-radius: 25px;
  text-decoration: none;
  width: 140px;
  gap: 0px;
  transition: background 0.2s;
}

.compose-link:hover {
  background-color: #a5d3ff;
}

.compose-link .material-icons {
  font-size: 20px;
}
.nav-item:active{
	background-color:red;
	color:white;
}



															// Setting page css

.settings-wrapper {
  position: relative;
  display: inline-block;
}

.settings-btn {
  padding: 10px 16px;
  background-color: #1a73e8;
  color: white;
  border: none;
  border-radius: 6px;
  cursor: pointer;
  font-size: 15px;
}

.dropdown {
  display: none;
  position: absolute;
  background-color: #ffffff;
  min-width: 200px;
  box-shadow: 0px 4px 8px rgba(0,0,0,0.1);
  border-radius: 8px;
  z-index: 100;
  margin-top: 5px;
}

.dropdown a {
  color: #333;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  font-size: 14px;
  transition: 0.2s ease;
}

.dropdown a:hover {
  background-color: #f1f1f1;
}

</style>

</head>
<body>

  <!-- Sidebar -->
  <div class="sidebar" id="sidebar">
  <a class="compose-link" href="Gmail-Layout.jsp?nm=compose" title="Compose Mail">
  <span class="material-icons">edit</span>
  <span class="compose-text">Compose</span>
</a>
	
	
    <a class="nav-item" href="Gmail-Layout.jsp?nm=inbox" title="Inbox" >
	  <span class="material-icons">inbox</span>
	  <span class="compose-text">Inbox</span>
	</a>
    
    <a class="nav-item" href="Gmail-Layout.jsp?nm=star" title="Star" >
	  <span class="material-icons">star</span>
	  <span class="compose-text">Starred</span>
	</a>
    <a class="nav-item" href="Gmail-Layout.jsp?nm=snoozed" title="Snoozed" >
	  <span class="material-icons">access_time</span>
	  <span class="compose-text">Snoozed</span>
	</a>
	
    <a class="nav-item" href="Gmail-Layout.jsp?nm=send" title="Send Mail" >
	  <span class="material-icons">send</span>
	  <span class="compose-text">Send</span>
	</a>
    <a class="nav-item" href="Gmail-Layout.jsp?nm=drafts" title="Drafts Mail" >
	  <span class="material-icons">drafts</span>
	  <span class="compose-text">Drafts</span>
	</a>
    <a class="nav-item" href="Gmail-Layout.jsp?nm=spam" title="Spam Mail" >
	  <span class="material-icons">report</span>
	  <span class="compose-text">Spam</span>
	</a>
	<a class="nav-item" href="Gmail-Layout.jsp?nm=trash" title="Trash Mail" >
	  <span class="material-icons">delete</span>
	  <span class="compose-text">Trash</span>
	</a>
	

  </div>
<%	String seid=(String) session.getAttribute("id"); %>
<% String user=(String) session.getAttribute("user"); %>
  <!-- Main -->
  <div class="main">
    <!-- Navbar -->


	
	
    <div class="navbar">
      <a class="left" title="Menu" >
        <span class="material-icons" id="menuToggle" data-tooltip="Toggle Menu">menu</span>
        <span class="logo">Welcome  <%= session.getAttribute("user") %> Gmail</span>
      </a>

      <a class="search-bar" title="Search">
        <span class="material-icons">search</span>
        <input type="text" placeholder="Search mail">
      </a>
	  <div  class="right">
		<a href="/" title="Help">
			<span class="material-icons" data-tooltip="Help">help_outline</span>
		</a>
		<a href="Gmail-Layout.jsp?nm=setting"  title="Settings">
        <span class="material-icons" data-tooltip="Settings">settings</span>
		</a>
		<a href="/" title="Apps">
        <span class="material-icons" data-tooltip="Apps">apps</span>
		</a>
		<a href="/" title="Account">
        <span class="material-icons" data-tooltip="Account">account_circle</span>
		</a>
      </div>
    </div>

    <!-- Content -->
    <div class="content">
     <h2>Welcome To Gmail Clone</h2>
      <% 
	  String nm=request.getParameter("nm");
	  if(nm!=null)
	  {
		  if(nm.equals("compose"))
		  {
			  %>
			  <%@ include file='Gmail-Compose.jsp' %>
			  <%
		  }
		  if(nm.equals("inbox"))
		  {
			  %>
			  <%@ include file='New-Inbox.jsp' %>
			  <%
		  }
		  if(nm.equals("star"))
		  {
			  %>
			  <%@ include file='New-Star.jsp' %>
			  <%
		  } 
		  if(nm.equals("snoozed"))
		  {
			  %>
			  <%@ include file='New-Snooze.jsp' %>
			  <%
		  }
		  if(nm.equals("send"))
		  {
			  %>
			  <%@ include file='New-Send.jsp' %>
			  <%
		  }
		  if(nm.equals("trash"))
		  {
			  %>
			  <%@ include file='New-Trash.jsp' %>
			  <%
		  }
		  
		  if(nm.equals("drafts"))
		  {
			  %>
			  <%@ include file='New-Drafts.jsp' %>
			  <%
		  }
		  if(nm.equals("spam"))
		  {
			  %>
			  <%@ include file='New-Spam.jsp' %>
			  <%
		  } 
		  if(nm.equals("setting"))
		  {
			  %>
			  <%@ include file='setting.jsp' %>
			  <%
		  }
	  }
	  %>
	  <% 
	  String snm=request.getParameter("snm");
	  if(snm!=null)
	  {
		  if(snm.equals("password"))
		  {
			  %>
			  <%@ include file='change_password.jsp' %>
			  <%
		  }
		  if(snm.equals("background"))
		  {
			  %>
			  <%@ include file='change_background.jsp' %>
			  <%
		  }
		  if(snm.equals("theme"))
		  {
			  %>
			  <%@ include file='change_theme.jsp' %>
			  <%
		  }
		  if(snm.equals("email"))
		  {
			  %>
			  <%@ include file='change_email.jsp' %>
			  <%
		  }
		
	  }
%>
    </div>
</div>

  

<!-- Compose Email Popup -->


</body>
</html>
		