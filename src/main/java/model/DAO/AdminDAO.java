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
public class AdminDAO {

    Connection conn;//declare Connection

    /**
     * Constructor AdminDAO
     */
    public AdminDAO() {
        DBConnection dbConnect = new DBConnection();//new Connection
        this.conn = dbConnect.getDBConnection();//get Connection
    }

    /**
     * Function use to login for admin
     *
     * @param user
     * @param pass
     * @return
     */
    public int login(String user, String pass) {
        try {
            String sql = "SELECT * FROM `admin` WHERE `aUsername`=? AND `aPassword`=MD5(?)";//Declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, user);//set aUsername for sql query
            pst.setString(2, pass);//set aPassword for sql query
            ResultSet rs = pst.executeQuery();//ResultSet use to store data
            if (rs.next()) {
                return rs.getInt(1);//return username
            } else {
                return -1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
    public void closeConn(){
        try {
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
