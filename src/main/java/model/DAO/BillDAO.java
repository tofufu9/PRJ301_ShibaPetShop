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
import model.entity.Bill;

/**
 *
 * @author Duc
 */
public class BillDAO {

    private Connection conn;//declare Connection

    public BillDAO() {//Constructor of BillDAO
        DBConnection db = new DBConnection();//new Connection
        conn = db.getDBConnection();//get Connection
    }

    /**
     * Function use to add new bill
     *
     * @param cusID
     * @param bStatus
     * @param cName
     * @param address
     * @param phone
     * @param note
     * @param total
     * @return
     */
    public boolean addBill(int cusID, String bStatus, String cName, String address, String phone, String note, double total) {
        int rs = 0;//decalre rs
        try {
            String sql = "INSERT INTO `bill`(`cID`, `bStatus`, `customerName`, `bDate`, `address`, `phone`, `note`, `total`) VALUES (?,?,?,?,?,?,?,?)";//Declare sql qurery
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, cusID);//set customer ID for query
            pst.setString(2, bStatus);//set customer ID for query
            pst.setString(3, cName);//set customer name for query
            pst.setDate(4, java.sql.Date.valueOf(LocalDate.now()));//set customer birthday for query
            pst.setString(5, address);//set customer adress for query
            pst.setString(6, phone);//set customer phone number for query
            pst.setString(7, note);//set customer note for query
            pst.setDouble(8, total);//set customer total for query
            rs = pst.executeUpdate();//excute sql query
        } catch (SQLException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs > 0 ? true : false;
    }

    /**
     * Function to get max bill
     *
     * @return
     */
    public int getMaxBill() {
        try {
            DBConnection db = new DBConnection();//new Connection
            String sql = "Select max(bID) as bID from bill";//Declare sql query

            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();//ResultSet to store data
            if (rs.next()) {
                return rs.getInt("bID");//return max bill
            }

        } catch (SQLException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    /**
     * getAll use to get all bill
     *
     * @return
     */
    public ResultSet getAll() {
        try {
            String sql = "select * from bill";//Declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();//excute query
            return rs;//return list bill
        } catch (SQLException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /**
     * getBill use to get bill by bill ID
     *
     * @param id
     * @return
     */
    public Bill getBill(int id) {
        try {
            String sql = "select * from bill where bID=?";//Declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);//set bId for sql query
            ResultSet rs = pst.executeQuery();//ResultSet to store data
            if (rs.next()) {
                Bill b = new Bill(id, rs.getInt(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getDouble(9));
                return b; //return bill
            }
        } catch (SQLException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /**
     * update use to update bill
     *
     * @param b
     * @return
     */
    public int update(Bill b) {
        try {
            String sql = "UPDATE `bill` SET `cID`=?,`customerName`=?,`bDate`=?,`address`=?,`phone`=?,`note`=?,`total`=? WHERE bID=?";//Declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, b.getcID());//set cId for sql query
            pst.setString(2, b.getCustomerName());//set cId for sql query
            pst.setDate(3, java.sql.Date.valueOf(LocalDate.now()));//set bDate for sql query
            pst.setString(4, b.getAddress());//set address for sql query
            pst.setString(5, b.getPhone());//set phone for sql query
            pst.setString(6, b.getNote());//set note for sql query
            pst.setDouble(7, b.getTotal());//set total for sql query
            pst.setInt(8, b.getbID());//set cId for sql query
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    /**
     * delete use to delete bill
     *
     * @param id
     * @return
     */
    public int delete(int id) {
        try {
            String sql = "delete from bill where bID=?";//declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);//set bID for sql query
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    /**
     * changeStatus to change status of bill
     *
     * @param bID
     * @param newStatus
     * @return
     */
    public int changeStatus(int bID, String newStatus) {
        try {
            String sql = "UPDATE `bill` SET `bStatus`=? WHERE bID = ?";//declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, newStatus);//set bStatus for sql query
            pst.setInt(2, bID);//set bId for sql query
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    /**
     * getBillbyCustomer use to get bill by customer ID
     *
     * @param cId
     * @return
     */
    public ResultSet getBillbyCustomer(int cId) {
        try {
            String sql = "select * from bill where cID =?";//delcare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, cId);//set cID for sql query
            return pst.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }
    public void closeConn(){
        try {
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
