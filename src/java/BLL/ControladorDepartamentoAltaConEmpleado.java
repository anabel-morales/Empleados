/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BLL;

import CLASES.Hash;
import DAO.DAOperaciones;
import DAO.HibernateUtil;
import POJOS.Departamento;
import POJOS.Empleado;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;

/**
 *
 * @author Anabe
 */
public class ControladorDepartamentoAltaConEmpleado extends HttpServlet {
private SessionFactory SessionBuilder;

    @Override
    public void init() {
        SessionBuilder = HibernateUtil.getSessionFactory();
    }
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
             //CREAMOS EL OBJETO DEPARTAMENTO CON SUS VALORES
            Departamento objDepartamento = new Departamento("73", "Deportes", "Casas Ibañez");

            //CREAMOS EL OBJETO EMPLEADO CON SUS VALORES Y LE ASIGNAMOS EL DEPARTAMENTO
            Empleado objEmpleado1 = new Empleado(objDepartamento, ("123456879".getBytes(StandardCharsets.UTF_8)),
                    "06290542F", Hash.sha1("Edu"), "Mondejar Sevillano", "Eduardo", "Futbolista",
                    2540.2, java.sql.Date.valueOf(LocalDate.of(1998, 12, 3)),
                    java.sql.Date.valueOf(LocalDate.now()));
            
            Empleado objEmpleado2= new Empleado(objDepartamento, ("123456870".getBytes(StandardCharsets.UTF_8)),
                    "06290540S", Hash.sha1("Daniel"), "Pardo", "Daniel", "Programador",
                    2540.2, java.sql.Date.valueOf(LocalDate.of(1988, 11, 5)),
                    java.sql.Date.valueOf(LocalDate.now()));
            
            //tambien se puede creando un HashSet
            objDepartamento.setEmpleados(objEmpleado1);
            objDepartamento.setEmpleados(objEmpleado2);
            
          try {
                new DAOperaciones().insertarDepartamento(objDepartamento,SessionBuilder);
                response.sendRedirect("./VISTAS/Correcto.jsp?codigo=departamento-alta-con-empleados");
            } catch (HibernateException HE) {
               response.sendRedirect("./VISTAS/Error.jsp?codigo=departamento-alta-con-empleados");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
