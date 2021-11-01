/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAO.BillDAO;
import model.DAO.CustomerDAO;
import model.DAO.ProductsDAO;
import model.entity.Bill;
import model.entity.Customer;
import model.entity.Products;

/**
 *
 * @author Duc
 */
@WebServlet(name = "Change", urlPatterns = {"/Change"})
public class ChangeStatusController extends HttpServlet {

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
            if(request.getParameter("pID") != null){ // get iD cua san pham
                int pID = Integer.parseInt(request.getParameter("pID"));
                ProductsDAO pDao = new ProductsDAO();
                Products p = pDao.getProduct(pID);
                if(p.getSpID() == 1 ){ // neu san pham la  1 thi set changstt =0
                    pDao.ChangeStatus(pID,0);
                }else{
                    pDao.ChangeStatus(pID,1); // nguoc lai thi set 1
                }
                pDao.closeConn();
                response.sendRedirect("admin/product/listProducts.jsp"); // chuyen den trang listproducts
            }else if(request.getParameter("cID") != null){
                int cID = Integer.parseInt(request.getParameter("cID"));
                CustomerDAO cDao = new CustomerDAO();
                Customer c = cDao.getCustomer(cID); // get customer
                if(c.getStatus() == 0){ // neu get bang 0 thi doi ss sang 1
                    cDao.ChangeStatus(cID, 1);
                }else{
                    cDao.ChangeStatus(cID, 0); // nguoc lai
                }
                cDao.closeConn();
                response.sendRedirect("admin/customer/listCustomer.jsp"); // chuyen den trang customer
            }else if(request.getParameter("bID") != null){
                int bID = Integer.parseInt(request.getParameter("bID"));
                BillDAO bDao = new BillDAO();
                Bill b = bDao.getBill(bID);

                if(b.getbStatus().equals("New")){ //neu get Stt = new
                    bDao.changeStatus(bID, "Delivered"); // thi trang thai la evivered
                }else{
                    bDao.changeStatus(bID, "New");
                }
                bDao.closeConn();
                response.sendRedirect("admin/bill/listBill.jsp");
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
