
<%@ page language="java" %>
<%@ page session="true" %>
<html>
<head>
    <title>Change Background</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            // padding: 20px;
        }
        .gallery {
            display: flex;
            flex-wrap: wrap;
            gap: 25px;
        }
        .gallery img {
            width: 180px;
            height: 100px;
            cursor: pointer;
            border: 3px solid transparent;
            transition: border 0.3s ease;
        }
        .gallery img:hover {
            border: 3px solid #007bff;
        }
    </style>
</head>
<body>
    <h2>Select a Background</h2>
    <div class="gallery">
        <% for (int i = 1; i <= 10; i++) { %>
            <form action="updateBackground.jsp" method="post" style="display:flex; padding:10px;margin:10px; width:190px ; height:200px;">
                <input type="hidden" name="background" value="bg<%=i%>.jpg">
                <input type="image" src="backgrounds/bg<%=i%>.jpg" alt="Background <%=i%>" />
            </form>
        <% } %>
    </div>
</body>
</html>