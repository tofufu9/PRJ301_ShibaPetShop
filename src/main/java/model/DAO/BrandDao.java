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
 * @author Long
 */
public class BrandDao {

    private Connection conn;//Declare Connection

    /**
     * Constructor Brand
     */
    public BrandDao() {
        DBConnection db = new DBConnection();//new Connection
        this.conn = db.getDBConnection();//get Connection
    }


    /**
     * Function to get all brand
     *
     * @return
     */
    public ResultSet getAll() {
        try {
            String sql = "Select * from brand";//declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();//excute query
            return rs;//return brand
        } catch (SQLException ex) {
            Logger.getLogger(TypeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /**
     * Function to get brand
     *
     * @param brID
     * @return
     */
    public String getBrand(int brID) {
        try {
            String sql = "select * from brand where brID=?";//declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, brID);//set brID for sql query
            ResultSet rs = pst.executeQuery();//excute query
            if (rs.next()) {
                return rs.getString(2);//return banrd
            }
        } catch (SQLException ex) {
            Logger.getLogger(BrandDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public void closeConn(){
        try {
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(BrandDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public boolean insert(String brand){
        try {
            String sql= "INSERT INTO brand(brName) VALUES (?)";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, brand);
            return pst.execute();
        } catch (SQLException ex) {
            Logger.getLogger(BrandDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
