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
 * @author Nhan
 */
public class SupplierDAO {

    private Connection conn;//Declare Connection

    /**
     * Constructor Supplier
     */
    public SupplierDAO() {
        DBConnection db = new DBConnection();//new Connection
        this.conn = db.getDBConnection();//get Connection
    }

    /**
     * Function to get get all Supplier
     *
     * @return
     */
    public ResultSet getAll() {
        try {
            String sql = "Select * from supplier";//declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();//excute query
            return rs;//return Supplier
        } catch (SQLException ex) {
            Logger.getLogger(SupplierDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /**
     * Function to get SUpplier by sup ID
     *
     * @param supID
     * @return
     */
    public String getSupplier(int supID) {
        try {
            String sql = "select * from supplier where supID=?";//declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, supID);//set supID for sql query
            ResultSet rs = pst.executeQuery();//excute query
            if (rs.next()) {
                return rs.getString(2);//reuturn Supplier
            }
        } catch (SQLException ex) {
            Logger.getLogger(SupplierDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public void closeConn(){
        try {
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(SupplierDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
