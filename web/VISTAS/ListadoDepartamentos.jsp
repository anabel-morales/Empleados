<%-- 
    Document   : ListadoDepartamentos
    Created on : 24-abr-2020, 16:26:48
    Author     : Anabe
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="POJOS.Departamento"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado Departamentos</title>
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
                    <th>CÓDIGO</th>
                    <th>DESCRIPCIÓN</th>
                    <th>LOCALIZACIÓN</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <%
                        HttpSession sesion = request.getSession(true);
                        List<Departamento> ListadoGeneralDepartamento = (ArrayList) sesion.getAttribute("listadoDepartamentos");
                        Iterator IterDepartamento = ListadoGeneralDepartamento.iterator();
                        while (IterDepartamento.hasNext()) {
                            Departamento objDepartamento = (Departamento) IterDepartamento.next();

                    %>

                    <td><%= objDepartamento.getCodigo() %></td>
                    <td><%= objDepartamento.getDescripcion() %></td>
                    <td><%= objDepartamento.getLocalizacion() %></td>          
                    
                </tr>

                <%
                    }
                %>
            </tbody>
        </table>
        <p> <a href="../index.jsp">Volver atrás</a></p>
    </body>
</html>
