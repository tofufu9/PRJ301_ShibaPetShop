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
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DAO.AdminDAO;
import model.DAO.CustomerDAO;
import model.entity.Customer;

/**
 *
 * @author Duc
 */
@WebServlet(name = "AccountController", urlPatterns = {"/AccountController"})
public class AccountController extends HttpServlet {

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
            out.println("<title>Servlet AccountController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AccountController at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        Customer c = new Customer();
        CustomerDAO cDao = new CustomerDAO();
        if (request.getParameter("btnSignIn") != null) { // neu da nhan vao nut bnt
            c.setcPassword(request.getParameter("cPassword")); // getPassword
            c.setcUsername(request.getParameter("cUsername")); // gte username
            c.setcName(request.getParameter("cName")); // get Name
            c.setPhonenumber(request.getParameter("cPhonenumber")); // get cPhonenumber
            c.setAddress(request.getParameter("address")); // get address
            Date birthday = Date.valueOf(request.getParameter("birthday")); // get birthday
            c.setBirthday(birthday);
            c.setEmail(request.getParameter("email")); // get email
            c.setStatus(1);
            c.setGender(request.getParameter("gender")); // get gender
            cDao.insert(c); // thuc hien goi insert de insert customer
            int maxID = cDao.getMaxCustomer(); // get maxcustomer
            cDao.login(request.getParameter("cUsername"), request.getParameter("cPassword"));
            Cookie userCookie = new Cookie("user", request.getParameter("cUsername")); // tao cookie de luu id dang nhap
            Cookie idCookie = new Cookie("idCustomer", String.valueOf(maxID));

            userCookie.setMaxAge(60 * 60 * 24); // set time 24h
            idCookie.setMaxAge(60 * 60 * 24);

            response.addCookie(userCookie);
            response.addCookie(idCookie);
            cDao.closeConn();
            //response.sendRedirect("home.jsp");
            if (request.getParameter("returnURL") != null) { // neu  returnURL ma khong rong
                response.sendRedirect(request.getParameter("returnURL")); // thi chuyen sang
            } else {
                response.sendRedirect("./index.jsp");  // neu rong thi chuyen sang index.jsp
            }
        } else if (request.getParameter("btnLogin") != null) { // neu dan nhan nut login
            // CustomerDAO cDao = new CustomerDAO();
            String user = request.getParameter("user"); // get uername va password
            String pass = request.getParameter("pass");
            int id = cDao.login(user, pass);
            cDao.closeConn();
            if (id != -1) {
                Cookie userCookie = new Cookie("user", user); // tao cookie luu id username
                Cookie idCookie = new Cookie("idCustomer", String.valueOf(id));

                userCookie.setMaxAge(60 * 60 * 24);
                idCookie.setMaxAge(60 * 60 * 24);

                response.addCookie(userCookie);
                response.addCookie(idCookie);
                if (request.getParameter("returnURL") != null) {
                    response.sendRedirect(request.getParameter("returnURL"));
                } else {
                    response.sendRedirect("./index.jsp"); // chuyen den trang index
                }
                // response.sendRedirect("home.jsp");
            } else {
//                out.println("<script type=\"text/javascript\">");
//                out.println("alert('User or password incorrect');");
//                out.println("location='login.jsp';");
//                out.println("</script>");
                String mes = "Register is not success ! User is exit !";
                response.sendRedirect("./auth/login.jsp?message="+mes);
            }
        } else if (request.getParameter("btnSignInPage") != null) {
            cDao.closeConn();
            response.sendRedirect("./auth/signin.jsp"); // chuyen den trang dang ky
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
