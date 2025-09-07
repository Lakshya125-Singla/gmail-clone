<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Login Successful</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(135deg, #4caf50, #81c784);
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .container {
      background-color: white;
      padding: 40px;
      border-radius: 15px;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
      text-align: center;
      max-width: 400px;
      width: 100%;
    }

    .container h1 {
      color: #4caf50;
      font-size: 32px;
      margin-bottom: 10px;
    }

    .container p {
      font-size: 18px;
      color: #555;
    }

    .btn {
      margin-top: 25px;
      padding: 10px 25px;
      font-size: 16px;
      color: white;
      background-color: #4caf50;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      transition: background-color 0.3s ease;
      text-decoration: none;
      display: inline-block;
    }

    .btn:hover {
      background-color: #388e3c;
    }
  </style>
</head>
<body>

  <div class="container">
  <h1>Signup Successful!</h1>
    <p>Thank you for signing up. You can now log in to your account.</p>
    <a class="btn" href="signup.jsp">Go to Login</a>
  </div>

</body>
</html>

	