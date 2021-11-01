package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Duc
 */
public class DBConnection {

    private Connection conn;//Declare Connection

    /**
     * Connection to connect with database
     */
    public DBConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");//Declare Driver
            conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/petshop", "root", "");//Declare url database
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Function to get Connection
     *
     * @return
     */
    public Connection getDBConnection() {
        return this.conn;
    }
}
