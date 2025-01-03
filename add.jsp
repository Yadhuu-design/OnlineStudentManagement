<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Student Record</title>
</head>
<body>

	<h2>Add Student Record</h2>

	<%
		if ("POST".equalsIgnoreCase(request.getMethod())) {
			String name = request.getParameter("name");
			int age = Integer.parseInt(request.getParameter("age"));
			String major = request.getParameter("major");
			String year = request.getParameter("year");

			Connection conn =null;
			PreparedStatement ps =null;
			String url ="jdbc:mysql://localhost:3306/java123";
			String dbUser ="root";
			String dbPassword ="";

			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(url, dbUser, dbPassword);
				String sql = "INSERT INTO students(name,age,major,year) VALUES(?,?,?,?)";
				ps = conn.prepareStatement(sql);
				ps.setString(1,name);
				ps.setInt(2,age);
				ps.setString(3,major);
				ps.setString(4,year);

				int rowsAffected=ps.executeUpdate();
				if (rowsAffected>0) {
					out.println("Student record added successfully!");
				} else {
					out.println("Failed to add the student record.");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				conn.close();
				ps.close();
			}
		}
	%>

	<form action="add.jsp" method="POST">
		<table>
			<tr>
				<th colspan="2">Enter Student Details</th>
			</tr>
			<tr>
				<td>Name:</td>
				<td><input type="text" id="name" name="name" required></td>
			</tr>
			<tr>
				<td>Age:</td>
				<td><input type="number" id="age" name="age" required></td>
			</tr>
			<tr>
				<td>Major:</td>
				<td><input type="text" id="major" name="major" required></td>
			</tr>
			<tr>
				<td>Year:</td>
				<td><input type="text" id="year" name="year" required></td>
			</tr>
		</table>
		<br>
		<button type="submit">Add Record</button>
	</form>

	<br>
	<a href="view.jsp">View All Students</a>

</body>
</html>
