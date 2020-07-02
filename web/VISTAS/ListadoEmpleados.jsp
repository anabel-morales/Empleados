<%-- 
    Document   : ListadoEmpleados
    Created on : 24-abr-2020, 15:05:10
    Author     : Anabe
--%>

<%@page import="org.hibernate.Hibernate"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="POJOS.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado Empleados</title>
        <style type="text/css">
            @import url(https://fonts.googleapis.com/css?family=Lato:300, 400, 700);

            body {
                background: #fb887c;
                color: #fff;
                font-family: "Lato", Arial, sans-serif;
            }

            h1 {
                font-family: "proxima-nova", sans-serif;
                letter-spacing: -0.01em;
                font-weight: 700;
                font-style: normal;
                font-size: 60px;
                margin-left: -3px;
                line-height: 1em;
                color: #fff;
                text-align: center;
                margin-bottom: 8px;
                text-rendering: optimizeLegibility;
            }

            table {
                width: 80%;
                margin: auto;
            }

            table,
            th,
            td {
                border: 1px solid #fff;
                border-collapse: collapse;
            }

            th,
            td {
                padding: 15px;
            }
            p {
                font-size: 2rem;
                text-align: center;
            }
            a{ 
                color: white;
                text-decoration: none; }

        </style>
    </head>
    <body>
        <h1> LISTADO GENERAL DE EMPLEADOS CON SUS DEPARTAMENTOS</h1>
        <table>
            <thead>
                <tr>
                    <th>NIF</th>
                    <th>NOMBRE</th>
                    <th>APELLIDOS</th>
                    <th>DEPARTAMENTO</th>
                    <th>LOCALIZACIÓN</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <%
                        HttpSession sesion = request.getSession(true);
                        List<Empleado> ListadoGeneralEmpleados = (ArrayList) sesion.getAttribute("listadoEmpleados");
                        Iterator IterEmpleado = ListadoGeneralEmpleados.iterator();
                        while (IterEmpleado.hasNext()) {
                            Empleado objEmpleado = (Empleado) IterEmpleado.next();

                    %>

                    <td><%= objEmpleado.getNif()%></td>
                    <td><%= objEmpleado.getNombre()%></td>
                    <td><%= objEmpleado.getApellidos()%></td>          
                    <td><%= objEmpleado.getDepartamento().getDescripcion()%></td>
                    <td><%= objEmpleado.getDepartamento().getLocalizacion()%></td>
                </tr>

                <%
                    }
                %>
            </tbody>
        </table>
        <p> <a href="../index.jsp">Volver atrás</a></p>
    </body>
</html>