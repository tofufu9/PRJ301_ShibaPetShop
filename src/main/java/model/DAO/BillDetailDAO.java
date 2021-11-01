/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.DAO;

import DB.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Duc
 */
public class BillDetailDAO {

    private Connection conn;//Declare Connection

    /**
     * Constructor Bill Detail
     */
    public BillDetailDAO() {
        DBConnection db = new DBConnection();//new Connection
        conn = db.getDBConnection();//get Connection
    }

    /**
     * Function to add bill detail
     *
     * @param bID
     * @param pID
     * @param quantity
     * @param total
     */
    public void addBillDetail(int bID, int pID, int quantity, double total) {
        try {
            String sql = "Insert into billdetail values(?,?,?,?)";//declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, bID);//set bId for sql query
            pst.setInt(2, pID);//set pId for sql query
            pst.setInt(3, quantity);//set quantity for sql query
            pst.setDouble(4, total);//set total for sql query
            pst.executeUpdate();//excute sql query
            ProductsDAO pDao = new ProductsDAO();
            pDao.updateQuantity(pID, quantity);//update quantity to products
        } catch (SQLException ex) {
            Logger.getLogger(BillDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Function to get bill detail
     *
     * @param id
     * @return
     */
    public ResultSet getBillDetail(int id) {
        try {
            String sql = "SELECT * FROM `billdetail` WHERE bID=?";//Declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);//set bId for sql query
            ResultSet rs = pst.executeQuery();//ResultSet to store date
            return rs;//return bill detail
        } catch (SQLException ex) {
            Logger.getLogger(BillDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public ResultSet getBillDetail(){
        try{
            String sql = "select * from billdetail";
            PreparedStatement pst = conn.prepareStatement(sql);
            return pst.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(BillDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public void closeConn(){
        try {
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(BillDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
