<%-- 
    Document   : crear
    Created on : 27/03/2024, 9:52:50 a. m.
    Author     : mp200
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Editar clínica</title>
    </head>
    <body>
        <%
        String codigo = request.getParameter("codigo");
        String nombre = request.getParameter("nombre");
        %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">

                    <form action="editar.jsp" method="get">
                        
                        <div class="form-group">
                            <label for="direccion">Nombre</label>
                            <input type="text" class="form-control" id="nombre" value="<%= nombre %>" name="nombre" placeholder="Nombre" required="required">
                        </div>
                        
                        <a href="index.jsp" class="btn btn-danger">Cancelar <i class="fa fa-ban" aria-hidden="true"></i></a>

                        <button type="submit" name="enviar" class="btn btn-primary">Guardar <i class="fa fa-floppy-o" aria-hidden="true"></i></button>
                        <input type="hidden" name="codigo" value="<%= codigo%>" >
                    </form>

                </div>
            </div>
        </div>
        <%
    if(request.getParameter("enviar") != null){

        try {
            Connection con = null;
            Statement st = null;

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/inventarios?user=root&password=paula");
            st = con.createStatement();
            st.executeUpdate("update clinica set nombre='" + nombre + "' where codigo='"+codigo+"';");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (Exception e) {
            out.print(e);
        }
    }
%>

    </body>
</html>
