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
public class ControladorEmpleadoModificarPorNif extends HttpServlet {
private SessionFactory SessionBuilder;

    @Override
    public void init() {
        SessionBuilder = HibernateUtil.getSessionFactory();
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
          
            Empleado objEmpleado = new Empleado("1234457".getBytes(StandardCharsets.UTF_8),
                    "06290540V", Hash.sha1("Anabel"), "Morales Nuñez", "Anabel",
                    "Empresaria", 21000.0, java.sql.Date.valueOf(LocalDate.of(1999, 7, 8)),
                    java.sql.Date.valueOf(LocalDate.now()));
            
            Departamento objDepartamento = new Departamento(11);
            objEmpleado.setDepartamento(objDepartamento);
            
            try{
                new DAOperaciones().modificarEmpleado(objEmpleado, SessionBuilder);
                 response.sendRedirect("./VISTAS/Correcto.jsp?codigo=empleado-modificar");
            } catch (HibernateException HE) {
               response.sendRedirect("./VISTAS/Error.jsp?codigo=empleado-modificar");
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
