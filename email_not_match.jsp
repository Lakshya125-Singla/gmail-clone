<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Email not match</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(135deg, #f44336, #e57373);
      height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .container {
      background-color: #fff;
      padding: 40px;
      border-radius: 15px;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
      text-align: center;
      max-width: 400px;
      width: 100%;
    }

    .container h1 {
      color: #f44336;
      font-size: 32px;
      margin-bottom: 15px;
    }

    .container p {
      font-size: 18px;
      color: #666;
    }

    .btn {
      margin-top: 25px;
      padding: 10px 25px;
      font-size: 16px;
      color: white;
      background-color: #f44336;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      text-decoration: none;
      display: inline-block;
      transition: background-color 0.3s ease;
    }

    .btn:hover {
      background-color: #d32f2f;
    }
  </style>
</head>
<body>

  <div class="container">
    <h1>New email and Confirm email is not matched.</h1>
    <p>Oops! Your New email and Confirm email is not match. Please try again.</p>
    <a class="btn" href="Gmail-Layout.jsp">Back to dashboard</a>
  </div>

</body>
</html>
