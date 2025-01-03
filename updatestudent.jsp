<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Student</title>
</head>
<body>

	<h2>Update Student Record</h2>

	<%
		Connection conn =null;
		PreparedStatement ps =null;
		String url ="jdbc:mysql://localhost:3306/java123";
		String dbUser ="root";
		String dbPassword ="";

		int id =Integer.parseInt(request.getParameter("id"));
		String name =request.getParameter("name");
		int age =Integer.parseInt(request.getParameter("age"));
		String major =request.getParameter("major");
		String year =request.getParameter("year");

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn =DriverManager.getConnection(url, dbUser, dbPassword);

			String sql ="UPDATE students SET name =?, age =?, major =?, year =? WHERE id =?";
			ps =conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setInt(2, age);
			ps.setString(3, major);
			ps.setString(4, year);
			ps.setInt(5, id);

			int rowsUpdated =ps.executeUpdate(); 

			if (rowsUpdated > 0) {
				out.println("Student record updated successfully!");
			} else {
				out.println("Could not update the student record");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
			ps.close();
		}
	%>

	<a href="view.jsp">Back to Student Records</a>

</body>
</html>
