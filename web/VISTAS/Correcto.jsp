<%-- 
    Document   : Correcto
    Created on : 23-abr-2020, 20:48:23
    Author     : Anabe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Correcto</title>
        <style type="text/css">
            html {
                width: 100%;
                height: 100%;
            }
            * {
                margin: 0; padding: 0;
            }
            body {
                background-image: url("../FOTOS/bien.png");
                background-position: center; 
                background-repeat: no-repeat;
                display: flex;
                flex-direction: column;
                min-height: 100vh;
                position: relative;
                -webkit-font-smoothing: antialiased;
                -moz-osx-font-smoothing: grayscale;
            }


            h2{
                font-family: Roboto;
                text-align: center;
                font-size: 30px;
                padding-top: 200px;
                color: #0F5306 ;
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

        <% String codigo = request.getParameter("codigo");
            if (codigo.equals("departamento-alta-sin-empleados")) {

        %>
        <h2>SE HA INSERTADO EL DEPARTAMENTO CORRECTAMENTE</h2>   
        <%              } else if (codigo.equals("departamento-alta-con-empleados")) {

        %>
        <h2> SE HA INSERTADO CORRECTAMENTE EL DEPARTAMENTO JUNTO A SU EMPLEADO </h2>
        <%    } else if (codigo.equals("departamento-borrar-con-empleados")) {
        %>
        <h2> SE HA BORRADO EL DEPARTAMENTO JUNTO A SUS EMPLEADOS </h2>
        <%
        } else if (codigo.equals("departamento-actualizar")) {
        %>
        <h2> SE HA MODIFICADO EL DEPARTAMENTO CORRECTAMENTE </h2>
        <%
        } else if (codigo.equals("empleado-alta-con-departamento")) {
        %>
        <h2> SE HA INSERTADO EL EMPLEADO CORRECTAMENTE</h2>
        <%
        } else if (codigo.equals("empleado-borrar")) {
        %>
        <h2> SE HA BORRADO EL EMPLEADO CORRECTAMENTE</h2>
        <%
        } else if (codigo.equals("empleado-modificar")) {
        %>
        <h2> SE HA MODIFICADO EL EMPLEADO CORRECTAMENTE</h2>
        <%
            }
        %>
       <p> <a href="../index.jsp">Volver atrás</a></p>

    </body>
</html>
