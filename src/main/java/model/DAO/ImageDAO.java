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
public class ImageDAO {

    private Connection conn;//Declare Connection

    /**
     * Constructor Image
     */
    public ImageDAO() {
        DBConnection db = new DBConnection();//new Connection
        this.conn = db.getDBConnection();//get Connection
    }

    /**
     * Function to insert new Image
     *
     * @param pID
     * @param path
     * @return
     */
    public boolean insert(int pID, String path) {
        try {
            String sql = "INSERT INTO `image`(`pID`, `imageName`) VALUES (?,?)";//declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, pID);//set pID for sql query
            pst.setString(2, path);//set path for sql query
            return pst.execute();//excute query
        } catch (SQLException ex) {
            Logger.getLogger(ImageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;

    }

    /**
     * Function to get Image
     *
     * @param pID
     * @return
     */
    public ResultSet getImage(int pID) {
        try {
            String sql = "select * from image where pID = ?";//declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, pID);//set pID for sql query
            ResultSet rs = pst.executeQuery();//excute query

            return rs;//return image

        } catch (SQLException ex) {
            Logger.getLogger(ImageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }
    public void closeConn(){
        try {
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(ImageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
