<%-- 
    Document   : Error
    Created on : 23-abr-2020, 21:10:24
    Author     : Anabe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
        <style type="text/css">
            html {
                width: 100%;
                height: 100%;
            }
            * {
                margin: 0; padding: 0;
            }
            body {
                background-image: url("../FOTOS/mal.png");
                background-position: center; 
                background-repeat: no-repeat;
                display: flex;
                flex-direction: column;
                min-height: 100vh;
                position: relative;
                -webkit-font-smoothing: antialiased;
                -moz-osx-font-smoothing: grayscale;
            }
            #error{
                font-family: Roboto;
                text-align: center;
                font-size: 30px;
                padding-top: 200px;
                color: #9D1313 ;
            }
           p {
                font-size: 1.8rem;
                text-align: center;
            }
            a{ 
                color: black;
                text-decoration: none; }
        </style>
    </head>
    <body>
        <h2 id="error">
            <% String codigo = request.getParameter("codigo");
                if (codigo.equals("departamento-alta-sin-empleados") || codigo.equals("departamento-alta-con-empleados")) {

            %>
            SE HA PRODUCIDO UN ERROR EN LA INSERCCIÓN DEL DEPARTAMENTO </h2>   
            <% } else if (codigo.equals("departamento-borrar-con-empleados")) {
            %>
        SE HA PRODUCIDO UN ERROR A LA HORA DE ELIMINAR UN DEPARTAMENTO JUNTO A SUS EMPLEADOS </h2>
        <%
        } else if (codigo.equals("departamento-actualizar")) {
        %>

    NO SE HA PODIDO MODIFICAR EL DEPARTAMENTO </h2>
    <%
    } else if (codigo.equals("empleado-alta-con-departamento")) {
    %>
NO SE HA PODIDO INSERTAR UN EMPLEADO </h2>
<%
} else if (codigo.equals("empleado-borrar")) {
%>
NO SE HA PODIDO BORRAR EL EMPLEADO </h2>
<%
} else if (codigo.equals("empleado-modificar")) {
%>
NO SE HA PODIDO MODIFICAR EL EMPLEADO </h2>
<%
    }
%>
 <p> <a href="../index.jsp">Volver atrás</a></p>

</body>
</html>
