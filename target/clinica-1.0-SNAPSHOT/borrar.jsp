<%-- 
    Document   : borrar
    Created on : 27/03/2024, 2:26:04 p. m.
    Author     : mp200
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection con = null;
            Statement st = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/inventarios?user=root&password=paula");
                st = con.createStatement();
                st.executeUpdate("delete FROM clinica where codigo='"+request.getParameter("codigo") +"';");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } catch (Exception e) {
                out.print(e);
            }
        %>

    </body>
</html>