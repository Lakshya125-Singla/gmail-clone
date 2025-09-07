<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Signup Page</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f0f4f8;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .signup-container {
      background: #fff;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
      width: 300px;
    }

    h2 {
      text-align: center;
      margin-bottom: 20px;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"] {
      width: 100%;
      padding: 10px;
      margin: 8px 0;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    .buttons {
      display: flex;
      justify-content: space-between;
      margin-top: 20px;
    }

    input[type="submit"] {
      padding: 10px 15px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      width: 48%;
    }

    .signup-btn {
      background-color: #4CAF50;
      color: white;
    }

    .cancel-btn {
      background-color: #f44336;
      color: white;
    }

    #message {
      margin-top: 15px;
      text-align: center;
      color: #333;
    }
	
  </style>
</head>
<body>
  <div class="signup-container">
    <h2>Signup</h2>
    <form action="sign.jsp"   method=get>
      <input type="text" id="username" placeholder="Username" name="username" required />
      <input type="email" id="email" placeholder="Email" name="email" required />
      <input type="password" id="password" placeholder="Password" name="password" required />

      <div class="button">
        <input type="submit" value="Sign Up" class="signup-btn" name="submit">
        <input type="submit" class="cancel-btn"  value="Cancel" name="submit" >
      </div>
    </form>

    <div id="message"></div>
  </div>

<%@ page import="java.sql.*" %>
<%!
Connection conn = null;
		PreparedStatement ps=null;
		ResultSet rs = null;
		Statement st=null;
		%>

<%
	
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String id = request.getParameter("email");
		String submit= request.getParameter("submit");
		
		
	if(submit!=null)
	{
		if(submit.equals("Sign Up"))
		{
			try
			{
				if(username!=null)
				{
					Class.forName("com.mysql.cj.jdbc.Driver");
					conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","root");
					st=conn.createStatement();
					String q="select * from login";
					rs=st.executeQuery(q);
					
					ps=conn.prepareStatement(" insert into login values(?,?,?,'null','null')");
					ps.setString(1,username);
					ps.setString(2,password);
					ps.setString(3,id);
					int n=ps.executeUpdate();		
					if(n>0)
					{
						response.sendRedirect("signup_success.jsp");	
					}
				}		
			}
			catch(Exception ee)
			{
				
				ee.printStackTrace();
			}
		}
		if(submit.equals("Cancel"))
		{
			response.sendRedirect("signup.jsp");
		}
	}
%>

  <script>
    document.getElementById("signupForm").addEventListener("submit", function (e) {
      e.preventDefault();
      const username = document.getElementById("username").value;
      document.getElementById("message").textContent = `Welcome, ${username}! Signup successful.`;
    });

    function cancelSignup() {
      document.getElementById("signupForm").reset();
      document.getElementById("message").textContent = "Signup cancelled.";
    }
  </script>
</body>
</html>

