
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Login/Sign Up Page</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      background: #f4f4f4;
      margin: 0;
    }
.login-container {
  background: white;
  padding: 30px;
  border-radius: 10px;
  box-shadow: 0 5px 15px rgba(0,0,0,0.2);
  width: 300px;
}
  .container {
      background: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      width: 300px;
    }
    h2 {
      text-align: center;
      margin-bottom: 20px;
    }
    input[type="text"], input[type="password"], input[type="email"] {
      width: 100%;
      padding: 10px;
      margin: 10px 0;
      border: 1px solid #ccc;
      border-radius: 5px;
    }
	.button{
		display:flex;
		justify-content:center;
		align-items:center;
		gap:13px;
	}
   input[type="submit"] {
      width: 50%;
      padding: 10px;
      background: #007bff;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 16px;
    }
   input[type="submit"]:hover {
      background: #0056b3;
    }
	
	  /* Responsive for small screens */
    @media screen and (max-width: 600px) {
      .sidenav {
        width: 100%;
        height: auto;
        position: relative;
      }
      .sidenav a {float: left;}
      .main {margin-left: 0;}
    }

    @media screen and (max-width: 400px) {
      .sidenav a {
        text-align: center;
        float: none;
      }
  </style>
</head>
<body>

  
  <div class="login-container" id="loginPage">
    <h2>Login</h2>
    <form id="loginForm">
      <div class="input-group">
        <label for="username" >Username</label>
        <input type="text" placeholder="Username" name="username" id="loginUsername" required>
      </div>     
	  <div class="input-group">
        <label for="email" >Email Id</label>
	    <input type="text" placeholder="Email Id" name="email" id="loginUsername" required>
      </div>
      <div class="input-group">
        <label for="password">Password</label>
        <input type="password" placeholder="Password" name="password" id="loginPassword" required>
      </div>
  <div class="button">
   <input value="Login" type="submit" name="submit" id="login"></input>
   <input  value="Sign Up" type="submit" onclick="showSignUpPage()" name="submit" id="sign-up"></input>
   </div>
   </form>
    <p id="message"></p>
  </div>
  
<%@ page import="java.sql.*" %>
<%!
Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		%>

<%

		String username= request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String submit= request.getParameter("submit");

	if(submit!=null)
	{		
		if(submit.equals("Login"))
		{
			try 
			{
				if(username!=null)
				{
					Class.forName("com.mysql.cj.jdbc.Driver");
					conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","root");
					
					String sql = "SELECT * FROM login WHERE Username=? AND Password=?";
					pst = conn.prepareStatement(sql);
					pst.setString(1, username);
					pst.setString(2, password);
					rs = pst.executeQuery();
					
					if (rs.next()) 
					{
						session.setAttribute("id",email);
						session.setAttribute("user",username);
						response.sendRedirect("login-success.html");
					}
					else 
					{
						response.sendRedirect("login_failed.html");
					}
				}	
			}
			
			catch(Exception e) 
			{
				out.println("Error: " + e.getMessage());
			}
		} 
		if(submit.equals("Sign Up"))
		{
			response.sendRedirect("sign.jsp");
		}
	}
%>

</body>
</html>
