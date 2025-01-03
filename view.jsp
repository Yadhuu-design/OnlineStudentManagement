<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Student Records</title>
</head>
<body>

	<h2>Student Records</h2>

	<%
		Connection conn =null;
		Statement ps =null;
		ResultSet rs =null;
		String url ="jdbc:mysql://localhost:3306/java123";
		String dbUser ="root";
		String dbPassword ="";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, dbUser, dbPassword);
			String sql = "SELECT * FROM students";
			ps = conn.createStatement();
			rs = ps.executeQuery(sql);
	%>
	<table border="1">
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Age</th>
				<th>Major</th>
				<th>Year</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<%
				while (rs.next()) {
						int id = rs.getInt("id");
						String name = rs.getString("name");
						int age = rs.getInt("age");
						String major = rs.getString("major");
						String year = rs.getString("year");
			%>
			<tr>
				<td><%=id%></td>
				<td><%=name%></td>
				<td><%=age%></td>
				<td><%=major%></td>
				<td><%=year%></td>
				<td><a href="edit.jsp?id=<%=id%>">Edit</a> | <a
					href="delete.jsp?id=<%=id%>"
					onclick="return confirm('Are you sure you want to delete this record?');">Delete</a>
				</td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>

	<%
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
			ps.close();
		}
	%>

	<br>
	<a href="add.jsp">Add New Student</a>

</body>
</html>
