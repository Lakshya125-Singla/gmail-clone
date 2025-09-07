


<%
    String currentTheme = "Light"; // Default fallback
    PreparedStatement fetch1 = con.prepareStatement("SELECT theme FROM login WHERE Username=?");
    fetch1.setString(1, username);
    ResultSet rs1 = fetch1.executeQuery();
    if (rs1.next()) {
        currentTheme = rs1.getString("theme") != null ? rs1.getString("theme") : "Light";
    }
%>
<h2>Change Theme</h2>
<form method="post" action="updateTheme.jsp">
    <label>Select Theme:</label>
    <select name="theme">
        <option value="Light" name="light" <%= currentTheme.equals("Light") ? "selected" : "" %>>Light</option>
        <option value="Dark" name="dark" <%= currentTheme.equals("Dark") ? "selected" : "" %>>Dark</option>
        <option value="Blue" name="blue" <%= currentTheme.equals("Blue") ? "selected" : "" %>>Blue</option>
        <option value="Red" name="red" <%= currentTheme.equals("Red") ? "selected" : "" %>>Red</option>
        <option value="System" name="system" <%= currentTheme.equals("System") ? "selected" : "" %>>System Default</option>
    </select><br><br>
    <input type="submit" value="Apply Theme" name="submit">
</form>
