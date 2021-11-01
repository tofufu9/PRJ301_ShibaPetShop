/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DAO.ProductsDAO;
import model.entity.Products;

/**
 *
 * @author Nhan
 */
@WebServlet(name = "CartController", urlPatterns = {"/CartController"})
public class CartController extends HttpServlet {

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
            String url = request.getParameter("url");
            HttpSession session = request.getSession(); // get Session ve
            int pID = Integer.parseInt(request.getParameter("id")); // get id
            int quantity = Integer.parseInt(request.getParameter("quantity")); // get so luong
            if (session.getAttribute("listCart") == null) {
                HashMap<Integer, Integer> listCart = new HashMap<Integer, Integer>();
                listCart.put(pID, quantity);
                session.setAttribute("listCart", listCart);
            } else {
                HashMap<Integer, Integer> listCart = new HashMap<Integer, Integer>();
                listCart = (HashMap<Integer, Integer>) session.getAttribute("listCart");
                if (listCart.containsKey(pID)) {
                    int q = listCart.get(pID);
                    q += quantity; // cong so luong san pham len
                    listCart.put(pID, q);
                    session.setAttribute("listCart", listCart);
                } else {
                    listCart.put(pID, quantity);
                    session.setAttribute("listCart", listCart);
                }

            }
            // response.sendRedirect("./customer/product/cart.jsp"); // chuyen den trang cart.jsp
            response.sendRedirect(url +"?message=1&pID="+pID);

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
