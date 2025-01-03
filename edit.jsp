<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Student</title>
</head>
<body>

<h2>Edit Student Record</h2>

<%
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    String url = "jdbc:mysql://localhost:3306/java123";
    String dbUser = "root";
    String dbPassword = "";

    int id = Integer.parseInt(request.getParameter("id"));
    String name ="", major ="", year ="";
    int age =0;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url,dbUser,dbPassword);
        String sql = "SELECT * FROM students WHERE id = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1,id);
        rs = stmt.executeQuery();

        if (rs.next()) {
            name =rs.getString("name");
            age =rs.getInt("age");
            major =rs.getString("major");
            year =rs.getString("year");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
    	conn.close();
		stmt.close();
    }
%>

<form action="updatestudent.jsp" method="post">
    <input type="hidden" name="id" value="<%= id %>">
    <label for="name">Name:</label><br>
    <input type="text" id="name" name="name" value="<%= name %>" required><br><br>

    <label for="age">Age:</label><br>
    <input type="number" id="age" name="age" value="<%= age %>" required><br><br>

    <label for="major">Major:</label><br>
    <input type="text" id="major" name="major" value="<%= major %>" required><br><br>

    <label for="year">Year:</label><br>
    <input type="text" id="year" name="year" value="<%= year %>" required><br><br>

    <input type="submit" value="Update">
</form>

<a href="view.jsp">Back to Student Records</a>

</body>
</html>
