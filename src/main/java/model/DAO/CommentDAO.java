/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;

import DB.DBConnection;
import model.entity.Comment;

/**
 *
 * @author Duc
 */
public class CommentDAO {

    private Connection conn;//Declare Connection

    /**
     * Constructor Comment
     */
    public CommentDAO() {
        DBConnection db = new DBConnection();//new Connection
        this.conn = db.getDBConnection();//get Connection
    }

    /**
     * Function to get all comment
     *
     * @return
     */
    public ResultSet getAll() {
        try {
            String sql = "select * from comment";//declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();//excute query
            return rs;//return comment
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /**
     * Function to get all comment
     *
     * @param cmtID
     * @return
     */
    public Comment getComment(int cmtID) {
        try {
            String sql = "Select * from comment where cmtID = ?";//declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, cmtID);//set cmtID for sql query
            ResultSet rs = pst.executeQuery();//excute query
            while (rs.next()) {
                Comment c = new Comment(cmtID, rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getDate(5), rs.getInt(6));
                return c;//return comment
            }
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ResultSet getCommentbyProduct(int pID) {
        try {
            String sql = "select * from comment where pID=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, pID);
            ResultSet rs = pst.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean insert(Comment c) {
        try {
            String sql = "INSERT INTO `comment`(`pID`, `cID`, `cmtMessage`, `cmtDate`, `status`) VALUES (?,?,?,?,?)";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, c.getpID());
            pst.setInt(2, c.getcID());
            pst.setString(3, c.getCmtMessage());
            pst.setDate(4, java.sql.Date.valueOf(LocalDate.now()));
            pst.setInt(5, 0);
            return pst.execute();
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;

    }

    public int delete(int cmtID) {
        try {
            String sql = "DELETE FROM `comment` WHERE cmtID=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, cmtID);
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int changeStatus(int cmtID, int newStatus) {
        try {
            String sql = "update comment set status = ? where cmtID=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, newStatus);
            pst.setInt(2, cmtID);
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    public void closeConn(){
        try {
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
