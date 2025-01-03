<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Student</title>
</head>
<body>

<h2>Delete Student Record</h2>

<%
    Connection conn =null;
    PreparedStatement ps =null;
    String url ="jdbc:mysql://localhost:3306/java123";
    String dbUser ="root";
    String dbPassword ="";

    int id =Integer.parseInt(request.getParameter("id"));

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn =DriverManager.getConnection(url,dbUser,dbPassword);
        String sql ="DELETE FROM students WHERE id = ?";
        ps =conn.prepareStatement(sql);
        ps.setInt(1,id);
        int rowsDeleted = ps.executeUpdate();

        if (rowsDeleted > 0) {
            out.println("Student record deleted successfully!");
        } else {
            out.println("Could not delete the student record.");
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
