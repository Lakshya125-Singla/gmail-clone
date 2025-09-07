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
  <meta charset="UTF-8">
  <title>Mail Compose</title>
  <style>
  	 body {
				background-image: url('backgrounds/<%= bg2 %>');
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
  // background: #f1f3f4;
  // // padding: 50px;
  // display: flex;
  // justify-content: center;
// }

.compose-container {
  width: 100%;	
  background: white;
  padding: 25px;
  border-radius: 10px;
  box-shadow: 0 4px 12px rgba(0,0,0,0.15);
}

h2 {
  margin-top: 0;
}

label {
  display: block;
  margin-top: 15px;
  font-weight: bold;
}

input[type="text"],
input[type="email"],
select,
textarea {
  width: 100%;
  padding: 10px;
  margin-top: 5px;
  opacity:0.3;
  
  font-size: 14px;
  border: 1px solid #ccc;
  border-radius: 6px;
}

input[type="text"]:hover,
input[type="email"]:hover,
select:hover,
textarea:hover{
opacity:1;
}

input[type="file"] {
  margin-top: 10px;
  opacity:0.3;
}

input[type="file"]:hover{
	opacity:1;
}

.buttons {
  margin-top: 20px;
  display: flex;
  gap: 15px;
  justify-content: flex-end;
  opacity:1;
}

input {
  padding: 10px 20px;
  font-weight: bold;
  border-radius: 6px;
  border: none;
  cursor: pointer;
  opacity:0.1;
}
input:hover{
	opacity:1;
}

input[type="submit"] {
  background-color: #1a73e8;
  color: white;
  opacity:0.8;
}
input[type="submit"]:hover{
	opacity:1;
	background:blue;
	color:white;
}

input.discard {
  background-color: #f1f3f4;
  opacity:0.8;
  
}
</style>
</head>
<body>

  
    <h2>Compose Mail</h2>
    <form  action="Gmail-Compose.jsp"  id="mailForm">
      <label>From:</label>	
      <select name="from" required>
    <option value="">Select your email</option>
    <option value="<%= session.getAttribute("id") %>"><%= session.getAttribute("id") %></option>
  </select>

      <label>To:</label>
      <input type="email" name="to" placeholder="Recipient email" required>

      <label>Subject:</label>
      <input type="text" name="subject" placeholder="Subject" required>

      <label>Compose Email:</label>
      <textarea name="message" placeholder="Write your message here..." rows="8" required></textarea>

      <label>Attach File:</label>
      <input type="file" name="attachment">

      <div class="buttons">
        <input type="submit" value="Send" name="submit">
       </div>
    </form>

    <p id="status"></p>
  
  
<%@ page import="java.sql.*" %>
	<%!
		Connection conn = null;
		PreparedStatement ps=null;
		PreparedStatement ps1=null;
		// ResultSet rs = null;
		// Statement st=null;
	%>

  
<%
	String  id= request.getParameter("from");
	String toid = request.getParameter("to");
	String subject = request.getParameter("subject");
	String message = request.getParameter("message");
	String submit = request.getParameter("submit");

		if(submit!=null)
		{		
			if(submit.equals("Send"))
			{
				try
				{
					
						Class.forName("com.mysql.cj.jdbc.Driver");
						conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","root");
						ps=conn.prepareStatement(" insert into inbox  (id,toid,subject,message)  values(?,?,?,?)");
						ps1=conn.prepareStatement(" insert into send  (id,toid,subject,message) values(?,?,?,?)");
						ps.setString(1,id);
						ps.setString(2,toid);
						ps.setString(3,subject);
						ps.setString(4,message);
						int n=ps.executeUpdate();	
						
						ps1.setString(1,id);
						ps1.setString(2,toid);
						ps1.setString(3,subject);
						ps1.setString(4,message);
						int n1=ps1.executeUpdate();		
						
						if(n>0)
						{
							response.sendRedirect("Gmail-Layout.jsp");	
						}	
						if(n1>0)
						{
							response.sendRedirect("Gmail-Layout.jsp");	
						}
					}		
				
				catch(Exception ee)
				{
					ee.printStackTrace();
				}
			}
			
		}
%>
 

</body>
</html>
