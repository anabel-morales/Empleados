<%-- 
    Document   : index
    Created on : 23-abr-2020, 19:30:19
    Author     : Anabe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empleados-Departamento</title>
        <style type="text/css">
            html {
                width: 100%;
                height: 100%;
            }
            * {
                margin: 0; padding: 0;
            }
            body {
                background-image: url("./FOTOS/3372240.jpg");
                background-size: cover;
                background-position: center; 
                background-repeat: no-repeat;
                display: flex;
                flex-direction: column;
                min-height: 100vh;
                position: relative;
                -webkit-font-smoothing: antialiased;
                -moz-osx-font-smoothing: grayscale;
            }
            .sub-menu-parent {
                position: relative;
                padding-right: 20px;
                padding-left: 20px;
            }
            .sub-menu {
                visibility: hidden;
                /* hides sub-menu */
                opacity: 0;
                position: absolute;
                top: 100%;
                left: 0;
                width: 100%;
                transform: translateY(-2em);
                z-index: -1;
                transition: all 0.3s ease-in-out 0s, visibility 0s linear 0.3s, z-index 0s linear 0.01s;
            }
            .sub-menu-parent:focus .sub-menu,
            .sub-menu-parent:focus-within .sub-menu,
            .sub-menu-parent:hover .sub-menu {
                visibility: visible;
                /* shows sub-menu */
                opacity: 1;
                z-index: 1;
                transform: translateY(0%);
                transition-delay: 0s, 0s, 0.3s;
                /* this removes the transition delay so the menu will be visible while the other styles transition */
            }
            /* presentational */
            body {
                padding: 2%;
                font: 18px/1.4 sans-serif;
            }
            nav a {
                color: #ea6556;
                font-size: 30px;
                display: block;
                padding: 0.5em 1em;
                text-decoration: none;
            }
            nav a:hover {
                color: #FA8072;
            }
            nav ul,
            nav ul li {
                list-style-type: none;
                padding: 0;
                margin: 0;
            }
            nav > ul {
                background: #EEE;
                text-align: center;
            }
            nav > ul > li {
                display: inline-block;
                border-left: solid 1px #aaa;
            }
            nav > ul > li:first-child {
                border-left: none;
            }
            .sub-menu {
                background: #DDD;
            }

        </style>
    </head>
    <body>
        <nav>
            <ul>
                <li class="sub-menu-parent" tab-index="0">
                    <a href="#">Departamento</a>
                    <ul class="sub-menu">
                        <li><a href="./ControladorDepartamentoAltaSinEmpleados">Alta sin empleado</a></li>
                        <li><a href="./ControladorDepartamentoAltaConEmpleado">Alta con empleado</a></li>
                        <li><a href="./ControladorDepartamentoBorrarConEmpleados">Baja con empleados</a></li>
                        <li><a href="./ControladorDepartamentoActualizarInsertar">Insertar/actualizar</a></li>
                    </ul>
                </li>
                <li class="sub-menu-parent" tab-index="0">
                    <a href="#">Empleado</a>
                    <ul class="sub-menu">
                        <li><a href="./ControladorAltaEmpleadoConDepartamento">Alta con departamento existente</a></li>
                        <li><a href="./ControladorEmpleadoModificarPorNif">Modificación datos</a></li>
                        <li><a href=".//ControladorEmpleadoBajaPorNifYPassword">Baja</a></li>
                       
                    </ul>
                </li>
                <li class="sub-menu-parent" tab-index="0">
                    <a href="#">Listados &nbsp&nbsp&nbsp</a>
                    <ul class="sub-menu">
                        <li><a href="./ControladorListadoEmpleados">Empleados</a></li>
                        <li><a href="./ControladorListadoDepartamentoyEmpleados">Departamento completo</a></li>
                        <li><a href="./ControladorListadoDepartamentos">Departamentos</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </body>
</html>
