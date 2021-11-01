/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.DAO;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import static java.nio.charset.StandardCharsets.UTF_8;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import DB.DBConnection;
import model.entity.Customer;
import sun.security.provider.MD5;

/**
 *
 * @author Duc
 */
public class CustomerDAO {

    private Connection conn;//declare Connection

    /**
     * Constructor Customer
     */
    public CustomerDAO() {
        DBConnection db = new DBConnection();//new Connection
        conn = db.getDBConnection();//get Connection
    }

    /**
     * Function use to check User
     *
     * @param user
     * @return
     */
    public boolean checkUser(String user) {
        try {
            String sql = "select * from customer where cUsername=?";//declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();//excute query
            if (rs.next()) {
                return false;
            } else {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    /**
     * Function to insert customer ( register )
     *
     * @param c
     * @return
     */
    public boolean insert(Customer c) {
        try {
            String sql = "insert into customer(`cPassword`, `cUsername`, `cName`, `phonenumber`, `address`, `birthday`, `email`, `status`, `gender`) values (MD5(?),?,?,?,?,?,?,?,?)";//declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, c.getcPassword());//set cPassword for sql query
            pst.setString(2, c.getcUsername());//set cUsername for sql query
            pst.setString(3, c.getcName());//set cName for sql query
            pst.setString(4, c.getPhonenumber());//set phonenumber for sql query
            pst.setString(5, c.getAddress());//set adress for sql query
            pst.setDate(6, (Date) c.getBirthday());//set birthday for sql query
            pst.setString(7, c.getEmail());//set email for sql query
            pst.setInt(8, c.getStatus());//set status for sql query
            pst.setString(9, c.getGender());//set gender for sql query
            return pst.execute();//excute query
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    /**
     * Function to update customer info
     *
     * @param c
     * @return
     */
    public int update(Customer c) {
        try {
            String sql = "UPDATE `customer` SET `cPassword`=MD5(?),`cUsername`=?,`cName`=?,`phonenumber`=?,`address`=?,`birthday`=?,`email`=?,`status`=?,`gender`=? WHERE `cID`=?";//declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, c.getcPassword());//set cPassword for sql query
            pst.setString(2, c.getcUsername());//set cUsername for sql query
            pst.setString(3, c.getcName());//set cName for sql query
            pst.setString(4, c.getPhonenumber());//set phonenumber for sql query
            pst.setString(5, c.getAddress());//set address for sql query
            pst.setDate(6, (Date) c.getBirthday());//set birthday for sql query
            pst.setString(7, c.getEmail());//set email for sql query
            pst.setInt(8, c.getStatus());//set status for sql query
            pst.setString(9, c.getGender());//set gender for sql query
            pst.setInt(10, c.getcID());//set cID for sql query
            return pst.executeUpdate();//excute query
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    /**
     * Function to delete customer
     *
     * @param id
     * @return
     */
    public int delete(int id) {
        try {
            String sql = "DELETE FROM `customer` WHERE cID=?";//declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);//set cID for sql query
            return pst.executeUpdate();//excute query
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    /**
     * Function to change status of customer
     *
     * @param id
     * @param status
     * @return
     */
    public int ChangeStatus(int id, int status) {
        try {
            String sql = "UPDATE `customer` SET `status`=? WHERE  `cID`=?";//declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, status);//set status for sql query
            pst.setInt(2, id);//set cID for sql query
            return pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    /**
     * Function to login for customer
     *
     * @param user
     * @param pass
     * @return
     */
    public int login(String user, String pass) {
        try {
            String sql = "SELECT * FROM `customer` WHERE `cUsername`=? AND `cPassword`=MD5(?)";//declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, user);//set cUsername for sql query
            pst.setString(2, pass);//set cPassword for sql query
            ResultSet rs = pst.executeQuery();//excute query
            if (rs.next()) {
                return rs.getInt("cID");
            } else {
                return -1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    /**
     * Function to get all customer
     *
     * @return
     */
    public ResultSet getAll() {
        try {
            String sql = "SELECT * FROM `customer` where status =1";//declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();//excute query
            return rs;//return customers
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ResultSet getDel() {
        try {
            String sql = "SELECT * FROM `customer` where status =0";//declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();//excute query
            return rs;//return customers
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    /**
     * Function use to get customer by ID
     *
     * @param id
     * @return
     */
    public Customer getCustomer(int id) {
        try {
            String sql = "select * from customer where cID=?";//declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);//set cID for sql query
            ResultSet rs = pst.executeQuery();//ResultSet to store data
            if (rs.next()) {
                Customer c = new Customer(id, rs.getString(3), rs.getString(2), rs.getString(4), rs.getString(5), rs.getString(6), rs.getDate(7), rs.getString(8), rs.getInt(9), rs.getString(10));
                return c;//return customer
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    /**
     * Function to change password
     *
     * @param cID
     * @param oldPass
     * @param newPass
     * @return
     */
    public int changePass(int cID, String oldPass, String newPass) {
        try {
            String sql = "select * from customer where cID = ?";//declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, cID);//set cID for sql qurery
            ResultSet rs = pst.executeQuery();//excute query
            // mã hóa MD5
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] bytes = md.digest(oldPass.getBytes("UTF-8"));
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < bytes.length; i++) {
                byte b = bytes[i];
                String hex = Integer.toHexString((int) 0x00FF & b);
                if (hex.length() == 1) {
                    sb.append("0");
                }
                sb.append(hex);
            }
            String old = sb.toString();
            if (rs.next()) {
                if (rs.getString(2).equalsIgnoreCase(old)) {
                    String sql2 = "UPDATE customer set cPassword=md5(?) where cID=?";//sql query to update password
                    PreparedStatement pst2 = conn.prepareStatement(sql2);
                    pst2.setString(1, newPass);//set new pass for sql
                    pst2.setInt(2, cID);//set  cId for sql query
                    return pst2.executeUpdate();
                }
            } else {
                return -1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    /**
     * Function to getMaxCustomer
     *
     * @return
     */
    public int getMaxCustomer() {
        try {
            DBConnection db = new DBConnection();//new Connection
            String sql = "Select max(cID) as cID from customer";//declare sql query

            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();//excute query
            if (rs.next()) {
                return rs.getInt("cID");//return max customer
            }

        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    public void closeConn(){
        try {
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
