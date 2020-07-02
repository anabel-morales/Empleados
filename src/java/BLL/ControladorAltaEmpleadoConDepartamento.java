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
public class ControladorAltaEmpleadoConDepartamento extends HttpServlet {

    private SessionFactory SessionBuilder;

    @Override
    public void init() {
        SessionBuilder = HibernateUtil.getSessionFactory();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int IdDepart = 3;

            //CREAMOS UN CONSTRUCTOR SOLAMENTE CON EL ID, EN LA CLASE DEPARTAMENTO
            Departamento objDepartamento = new Departamento(IdDepart);

            //ENCRIPTACIONES PARA AÑADIR AL EMPLEADO
            String PasswordEncriptado = Hash.sha1("Anabel");
            String codigo = "1234457";
            byte[] codigoBinario = codigo.getBytes(StandardCharsets.UTF_8);

            //CREAMOS EL OBJETO EMPLEADO Y LE AÑADIMOS LOS VALORES
            Empleado ObjEmpleado = new Empleado(objDepartamento, codigoBinario,
                    "06290540V", PasswordEncriptado, "Morales Nuñez", "Anabel",
                    "Estudiante", 21000.0, java.sql.Date.valueOf(LocalDate.of(1999, 7, 8)),
                    java.sql.Date.valueOf(LocalDate.now()));

            try {
                new DAOperaciones().insertarEmpleado(ObjEmpleado, SessionBuilder);
                response.sendRedirect("./VISTAS/Correcto.jsp?codigo=empleado-alta-con-departamento");
            } catch (HibernateException HE) {
                response.sendRedirect("./VISTAS/Error.jsp?codigo=empleado-alta-con-departamento");
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
