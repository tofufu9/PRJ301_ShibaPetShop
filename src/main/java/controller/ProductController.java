/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.DAO.ImageDAO;
import model.DAO.ProductsDAO;
import model.entity.Products;

/**
 *
 * @author Duc
 */
@WebServlet(name = "ProductController", urlPatterns = {"/ProductController"})
@MultipartConfig
public class ProductController extends HttpServlet {

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
            out.println("<title>Servlet AdminController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminController at " + request.getContextPath() + "</h1>");
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
        Cookie[] cookies = request.getCookies();
        int aID = 0;
        if (cookies.length >= 1) {
            for (Cookie c : cookies) {
                if (c.getName().equals("admin")) {
                    aID = Integer.parseInt(c.getValue());
                }
            }
        }
        Products p = new Products(); // goi class products
        // thuc hien get cac thong tin ma user dan nhap vao o the input
        p.setBrID(Integer.parseInt(request.getParameter("brID"))); //get brId ma user da nhap vao
        p.settID(Integer.parseInt(request.getParameter("tID"))); // get tId ma user da nhap vao
        p.setSupID(Integer.parseInt(request.getParameter("supID"))); // get id ma user da nhap vao
        p.setpName(request.getParameter("pName"));
        p.setSellingPrice(Double.parseDouble(request.getParameter("sellingPrice")));
        p.setPrice(Double.parseDouble(request.getParameter("price")));
        p.setDescrible(request.getParameter("describle"));
        Date pDate = Date.valueOf(request.getParameter("pDate"));
        p.setpDate(pDate);
        //  p.setpDate(Date.from(Instant.now()));
        p.setQuantity(Integer.parseInt(request.getParameter("quantity")));
        p.setDiscount(Float.parseFloat(request.getParameter("discount")));
        p.setPetType(request.getParameter("pettype"));
        p.setaID(aID);
        String DIR = "data";
        ProductsDAO pDao = new ProductsDAO();
        if (request.getParameter("btnUpdate") != null) { // neu user da nhan vao nut btnUpdate thu thuc hien viec update san pham
            int pID = Integer.parseInt(request.getParameter("pID"));
            p.setpID(pID);
            pDao.update(p);

        } else {
            p.setStatus(Integer.parseInt(request.getParameter("status")));
            pDao.insert(p); // neu thong thi thuc hien insert san pham
            int pID = pDao.getMax();

            ImageDAO imgDao = new ImageDAO();
            try {
                List<Part> fileParts = (List<Part>) request.getParts();
                String pathOld = request.getServletContext().getRealPath("") + File.separator + DIR;
                //   String path = request.getServletContext().getRealPath("") + File.separator + DIR;
                // out.print("1");
                for (Part filePart : fileParts) {
                    // out.print("2");
                    if (filePart.getSubmittedFileName() != null) {
                        //   out.print("3");
                        String fileName = filePart.getSubmittedFileName(); //
                        // String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                        boolean check = imgDao.insert(pID, DIR + File.separator + fileName);

                        System.out.println(pathOld + File.separator + fileName);
                        filePart.write(pathOld + File.separator + fileName);
                    }
                }
            } catch (Exception ex) {
                System.out.println(ex);
                out.print("hi");

            }
            imgDao.closeConn();
        }
        pDao.closeConn();

        response.sendRedirect("./admin/product/listProducts.jsp");// chuyen den trang listproduct
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
