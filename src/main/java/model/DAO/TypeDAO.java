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
public class TypeDAO {

    private Connection conn;//Declare Connection

    /**
     * Constructor Type
     */
    public TypeDAO() {
        DBConnection db = new DBConnection();//new Connection
        this.conn = db.getDBConnection();//get Connection
    }

    /**
     * Function to get all Type
     *
     * @return
     */
    public ResultSet getAll() {
        try {
            String sql = "Select * from type";//declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();//excute query
            return rs;//return Type
        } catch (SQLException ex) {
            Logger.getLogger(TypeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /**
     * Function to get Type by TypeID
     *
     * @param tID
     * @return
     */
    public String getType(int tID) {
        try {
            String sql = "select * from type where tID=?";//declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, tID);//set tId for sql query
            ResultSet rs = pst.executeQuery();//excute query
            if (rs.next()) {
                return rs.getString(2);//reuturn Type
            }
        } catch (SQLException ex) {
            Logger.getLogger(TypeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public void closeConn(){
        try {
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(TypeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public boolean insert(String type){
        try {
            String sql= "INSERT INTO type(tName) VALUES (?)";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, type);
            return pst.execute();
        } catch (SQLException ex) {
            Logger.getLogger(TypeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

}
