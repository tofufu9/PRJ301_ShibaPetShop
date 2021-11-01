/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAO.CustomerDAO;
import model.entity.Customer;

/**
 *
 * @author Duc
 */
@WebServlet(name = "ChangeInforCustomer", urlPatterns = {"/ChangeInforCustomer"})
public class ChangeInforCustomer extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangeInforCustomer</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangeInforCustomer at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        //  processRequest(request, response);
        if (request.getParameter("btnChange") != null) { // neu button change da duoc nhan
            Customer c = new Customer(); // goi class customer  va get cac paramater ve =
            c.setcID(Integer.parseInt(request.getParameter("txtID")));
            c.setcUsername(request.getParameter("txtUser"));
            c.setcPassword(request.getParameter("txtPassword"));
            c.setcName(request.getParameter("txtName"));
            c.setAddress(request.getParameter("txtAddress"));
            c.setEmail(request.getParameter("txtEmail"));
            c.setPhonenumber(request.getParameter("txtPhone"));
            c.setGender(request.getParameter("txtGender"));
            c.setStatus(Integer.parseInt(request.getParameter("txtStatus")));
            Date date = Date.valueOf(request.getParameter("txtBirthday"));
            c.setBirthday(date);
            CustomerDAO cDao = new CustomerDAO(); // goi class customerDao de thuc hien cong viec can thiet
            int check = cDao.update(c); // thuc hien viec update customer
            cDao.closeConn();
            if (check != 0) {
                response.sendRedirect("./customer/Information.jsp"); // chuyen sang page Information
            }
        } else {//if(request.getParameter("btnChangePass") != null){
            Cookie[] cookies = request.getCookies();
            int id = 0;
            for (Cookie c : cookies) {
                if (c.getName().equals("idCustomer")) { // lay id customer de luu lai trong cookie
                    id = Integer.parseInt(c.getValue());
                }
            }
            String oldPass = request.getParameter("Oldpass"); // lay Oldpass va newPass user đa nhap vao
            String newPass = request.getParameter("newPass");
            CustomerDAO cDao = new CustomerDAO(); // goi class customer dao de thuc hien check pass
            int check = cDao.changePass(id, oldPass, newPass);
            cDao.closeConn();
            System.out.println(check);
            if (check == -1) {
                response.sendRedirect("./customer/changePassword.jsp"); // neu neu la -1 co nghia sai thi nhay lai trang cu
            } else if (check == 0) {
                response.sendRedirect("./customer/changePassword.jsp"); // neu sai thi nhay lai trang cu
            } else {
                response.sendRedirect("./customer/Information.jsp"); // dung thi nhay ve trang information
            }

        }
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
