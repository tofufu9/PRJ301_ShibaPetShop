/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAO.BillDetailDAO;
import model.DAO.ProductsDAO;
import model.unit.Sort;
import model.entity.*;
import model.unit.CSV;
import model.unit.Download;

/**
 *
 * @author Nhan
 */
@WebServlet(name = "SaveController", urlPatterns = {"/SaveController"})
public class SaveController extends HttpServlet {

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
            out.println("<title>Servlet SaveController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SaveController at " + request.getContextPath() + "</h1>");
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
        HashMap<Integer, Integer> products = new HashMap<>();
        BillDetailDAO bdDao = new BillDetailDAO();
        ProductsDAO pDao = new ProductsDAO();
        try {

            ResultSet rs = bdDao.getBillDetail();

            while (rs.next()) {
                int key = rs.getInt("pID");
                int quantity = rs.getInt("quantity");

                if (products.get(key) == null) {
                    products.put(key, quantity);
                } else {
                    quantity += products.get(key);
                    products.put(key, quantity);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        Sort sort = new Sort();
        HashMap<Integer, Integer> newList = sort.sortHashMapByValues(products);

        ArrayList<Products> productList = new ArrayList<>();
        ArrayList<Integer> quanities = new ArrayList<>();

        for (int pId : newList.keySet()) {
            productList.add(pDao.getProduct(pId));
            quanities.add(newList.get(pId));
        }

        String path = request.getSession().getServletContext().getRealPath("/");//create varible to get path of source
        String filePath = path + "Top10Product.csv";//create file path to save file path
        File upload = new File(filePath);//create new File with varible filePath
        upload.createNewFile();//recall method of class file to create new file

        FileWriter writer = new FileWriter(upload);//recall class FileWrite with varible upload

        int len = productList.size();//get film size

        if (len > 11) {//if length greater 11
            len = 11;//set length is 11
        };

        CSV.writeLine(writer, Arrays.asList("No.", "ID", "NAME",
                "PRICE", "QUANTITY", "SOLD"));//use method writeLine of class CSVUtils
        for (int i = 0; i < len; i++) {//the loop to get the length
            CSV.writeLine(writer, Arrays.asList("" + (i + 1), "" + productList.get(i).getpID(), productList.get(i).getpName(),
                    "" + productList.get(i).getPrice(), "" + productList.get(i).getQuantity(), "" + quanities.get(i)));//use method writeLine of class CSVUtils
        }

        writer.flush();//Delete backpace
        writer.close();//close the writer

        pDao.closeConn();
        bdDao.closeConn();

        FileInputStream inputStream = new FileInputStream(filePath);
        String disposition = "attachment; fileName=Top10Products.csv";
        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", disposition);
        response.setHeader("content-Length", String.valueOf(Download.stream(inputStream, response.getOutputStream())));

        response.sendRedirect("admin/product.listproduct.jsp");
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
