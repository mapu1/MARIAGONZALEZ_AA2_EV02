<%@page import="java.sql.*"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

        <title>Gestion Clínicas</title>
    </head>
    <body>
        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
        %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col" colspan="2" class="text-center"><h3>Clínicas</h3></th>
                                <th scope="col" >
                                    <a href="crear.jsp"><i class="fa fa-user-plus" aria-hidden="true"></i></a>
                                </th>
                             
                            </tr>
                            <tr>
                                <th scope="col">Código</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Acciones</th>
                             
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    con = DriverManager.getConnection("jdbc:mysql://localhost/inventarios?user=root&password=paula");
                                    st = con.createStatement();
                                    rs = st.executeQuery("SELECT * FROM `CLINICA`;");
                                    while (rs.next()) {
                            %>
                            
                                <th scope="row"><%= rs.getString(1)%></th>
                                <td><%= rs.getString(2)%></td>
                                <td>
                          
                                    <a href="editar.jsp?codigo=<%= rs.getString(1)%>&nombre=<%= rs.getString(2)%>"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                    
                                    <a href="borrar.jsp?codigo=<%= rs.getString(1)%>" class="ml-1"><i class="fa fa-trash" aria-hidden="true"></i></a>
                                </td>
  
                            </tr>                                    
                            <%
                                    }
                                } 
                                catch (Exception e) {
                                    out.print("error mysql "+e);
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>

