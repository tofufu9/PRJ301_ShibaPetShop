/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.Enumeration;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DAO.BillDAO;
import model.DAO.BillDetailDAO;
import model.DAO.ProductsDAO;
import model.entity.Products;

/**
 *
 * @author Long
 */
@WebServlet(name = "OrderController", urlPatterns = {"/OrderController"})
public class OrderController extends HttpServlet {

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
            out.println("<title>Servlet OrderController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderController at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        // processRequest(request, response);
        //String id = request.getAttribute("customerId").toString();
        String cID = "";
        if (request.getParameter("btnOrder") != null) { // neu ma bntoder da duoc nhan
            Cookie[] cookie = request.getCookies();
            for (Cookie c : cookie) {
                String cName = c.getName();
                if (cName.equals("idCustomer")) { // neu ma ten khach hang cung la id customer
                    cID = c.getValue(); // thi luu cac gia tri order
                }
            }
        }
        String name = request.getParameter("nameCustomer");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String note = request.getParameter("note");
        //double total = Double.parseDouble(session.getAttribute("totalPrice").toString());
        double total = Double.parseDouble(request.getParameter("total")); // lay cac thong tin
        BillDAO bDao = new BillDAO();
        bDao.addBill(Integer.parseInt(cID), "New", name, address, phone, note, total); // thuc hien add cac thong tin vao bill
        int billID = bDao.getMaxBill();
        BillDetailDAO bdDao = new BillDetailDAO();
        HashMap<Integer, Integer> listCart = new HashMap<Integer, Integer>();
        listCart = (HashMap<Integer, Integer>) session.getAttribute("listCart");
        ProductsDAO pDao = new ProductsDAO();
        for (Integer i : listCart.keySet()) {
            int quantity = listCart.get(i); // lay so luong
            Products p = pDao.getProduct(i); // get ac product
            bdDao.addBillDetail(billID, i, quantity, p.getPrice()); //add cac thong tin
        }
        session.removeAttribute("listCart");  // remove listcarrt
        pDao.closeConn();
        bDao.closeConn();
        bdDao.closeConn();
        response.sendRedirect("./customer/bill/billDetail.jsp"); // chuyen den trang chi tiet bill
//        Enumeration<String> pIds = session.getAttributeNames();
//        int success = 1;  // tạo biến kiểm tra mua thành công hay không
//        // đi đến từng sản phẩm, true nếu còn product trongg pIds
//        while (pIds.hasMoreElements()) {
//            // lấy id từng product
//            String pId = pIds.nextElement();
//            ProductsDAO pDao = new ProductsDAO();
//            if(pId.equals("conn"))
//                continue;
//            Products p = pDao.getProduct(Integer.parseInt(pId));
//            // lấy số lượng từ session
//            int quantity = (int) session.getAttribute(pId);
//
//            //insert bill detail, nếu thành công trả về 1, không thành công trả về 0
//            bdDao.addBillDetail(billID, Integer.parseInt(pId), quantity, quantity * p.getPrice());
//            //     success = 0;
//            //}
//            response.sendRedirect("./customer/bill/billDetail.jsp");
//
//        }
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
