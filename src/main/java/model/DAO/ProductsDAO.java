/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

import DB.DBConnection;
import model.entity.Products;
import model.unit.Sort;

/**
 *
 * @author Long
 */
public class ProductsDAO {

    private Connection conn;//Declare Connection

    /**
     * Constructor Product
     */
    public ProductsDAO() {
        DBConnection db = new DBConnection();//new Connection
        this.conn = db.getDBConnection();//get Connection
    }

    /**
     * Function to get all product
     *
     * @return
     */
    public ResultSet getAll() {
        try {
            String sql = "select * from products where status  = 1";//declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();//excute query
            return rs;//return products
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /**
     * Function to get products by id
     *
     * @param id
     * @return
     */
    public Products getProduct(int id) {
        String sql = "Select * from products where pId=? ";//declare sql query
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);//set pId for sql query
            ResultSet rs = pst.executeQuery();//excute query
            if (rs.next()) {
                Products p = new Products(id, rs.getInt("status"), rs.getInt("brID"), rs.getInt("tID"), rs.getInt("supID"), rs.getString("pName"), rs.getDouble("sellingPrice"), rs.getDouble("price"), rs.getString("describle"), rs.getDate("pDate"), rs.getInt("quantity"), rs.getFloat("discount"), rs.getString("pettype"), rs.getInt("aID"));
                return p;//return products
            }
        } catch (SQLException ex) {
        }
        return null;
    }

    /**
     * Function to insert new product
     *
     * @param p
     * @return
     */
    public boolean insert(Products p) {
        try {
            String sql = "INSERT INTO `products`(`status`, `brID`, `tID`, `supID`, `pName`, `sellingPrice`, `price`, `describle`, `pDate`, `quantity`, `discount`, `pettype`, `aID`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";//declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, p.getSpID());//set spID for sql query
            pst.setInt(2, p.getBrID());//set brID for sql query
            pst.setInt(3, p.gettID());//set tID for sql query
            pst.setInt(4, p.getSupID());//set SupID for sql query
            pst.setString(5, p.getpName());//set pName for sql query
            pst.setDouble(6, p.getSellingPrice());//set sellingPrice for sql query
            pst.setDouble(7, p.getPrice());//set price for sql query
            pst.setString(8, p.getDescrible());//set describe for sql query
            pst.setDate(9, (Date) p.getpDate());//set Date for sql query
            pst.setInt(10, p.getQuantity());//set quantity for sql query
            pst.setFloat(11, p.getDiscount());//set discount for sql query
            pst.setString(12,p.getPetType());//set pettype for sql query
            pst.setInt(13, p.getaID());//set aID for sql query

            return pst.execute();//excute query
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    /**
     * Function to update product
     *
     * @param p
     * @return
     */
    public int update(Products p) {
        try {
            String sql = "update products set brID=?, tID=?, supID=?, pName=?, sellingPrice=?, price=?, describle=?, pDate=?, quantity = ?, discount=?, pettype=?, aID=? where pID=?";//Declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, p.getBrID());//set brID for sql query
            pst.setInt(2, p.gettID());//set tID for sql query
            pst.setInt(3, p.getSupID());//set SupID for sql query
            pst.setString(4, p.getpName());//set pName for sql query
            pst.setDouble(5, p.getSellingPrice());//set sellingprice for sql query
            pst.setDouble(6, p.getPrice());//set price for sql query
            pst.setString(7, p.getDescrible());//set describe for sql query
            pst.setDate(8, (Date) p.getpDate());//set date for sql query
            pst.setInt(9, p.getQuantity());//set quantity for sql query
            pst.setFloat(10, p.getDiscount());//set discount for sql query
            pst.setString(11,p.getPetType());//set pettype for sql query
            pst.setInt(12, p.getaID());//set aID for sql query
            pst.setInt(13, p.getpID());//set pID for sql query
            return pst.executeUpdate();//excute query
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    /**
     * Function to delete Products
     *
     * @param id
     * @return
     */
    public int delete(int id) {
        try {
            String sql = "delete from products where pID=?";//declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);//set pID for sql query
            return pst.executeUpdate();//excute query
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    /**
     * Function to get quantity
     *
     * @param pID
     * @return
     */
    public int getQuantity(int pID) {
        try {
            String sql = "Select quantity from products where pID = ?";//declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, pID);//set pID for sql query
            ResultSet rs = pst.executeQuery();//excute query
            if (rs.next()) {
                return rs.getInt("quantity");//return quantity
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    /**
     * Function to update quantity
     *
     * @param pID
     * @param quantity
     */
    public void updateQuantity(int pID, int quantity) {
        int nowQuantity = this.getQuantity(pID);//get quantity now
        if (nowQuantity > 0) {
            String sql = "Update products set quantity=? where pID=?";//declare sql query
            try {
                PreparedStatement st = conn.prepareStatement(sql);
                st.setInt(1, nowQuantity - quantity);//set quantity for sql query
                st.setInt(2, pID);//set pID for sql query
                st.executeUpdate();//excute query
            } catch (SQLException ex) {
                Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    /**
     * Function to change status
     *
     * @param id
     * @param status
     * @return
     */
    public int ChangeStatus(int id, int status) {
        try {
            String sql = "UPDATE `products` SET `status`=? WHERE  `pID`=?";//Declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, status);//set status for sql query
            pst.setInt(2, id);//set pID for sql query
            return pst.executeUpdate();//excute query
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    /**
     * Function to get Product by Type
     *
     * @param id
     * @return
     */
    public ResultSet getProductByType(int id) {

        try {
            String sql = "Select * from products where tID = ?";//declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);//set tID for sql query
            return pst.executeQuery();//excute query
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /**
     * Function to get Product by Status
     *
     * @param status
     * @return
     */
    public ResultSet getProductByStatus(int status) {
        try {
            String sql = "select * from products where status=?";//declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, status);//set status for sql query
            ResultSet rs = pst.executeQuery();//rs to store date
            if (rs.next()) {
                return rs;//return products
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /**
     * Function to get Product when quantity > 0
     *
     * @return
     */
    public ResultSet getProductConHang() {
        try {
            String sql = "select * from product where quantity > 0";//declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();//excute query
            if (rs.next()) {
                return rs;//return Products
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /**
     * Function to get Product when quantity = 0
     *
     * @return
     */
    public ResultSet getProductHetHang() {
        try {
            String sql = "select * from product where quantity = 0";//declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();//excute query
            if (rs.next()) {
                return rs;//return Product
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /**
     * Function to get Max products
     *
     * @return
     */
    public int getMax() {
        try {

            String sql = "Select max(pID) as pID from products";//declare sql query
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();//excute query
            if (rs.next()) {
                return rs.getInt("pID");//return max product
            }

        } catch (SQLException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    /**
     * Function to get product by price
     *
     * @param startPrice
     * @param endPrice
     * @return
     */
    public ResultSet getProductbyPrice(double startPrice, double endPrice) {
        try {
            String sql = "SELECT * FROM `products` WHERE price > ? and price < ?";//declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setDouble(1, startPrice);//set startPrice for sql query
            pst.setDouble(2, endPrice);//set endPrice for sql query
            ResultSet rs = pst.executeQuery();//excute query
            if (rs.next()) {
                return rs;//return Products
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /**
     * Function to get Product by Supplier
     *
     * @param supID
     * @return
     */
    public ResultSet getProductBySupplier(int supID) {
        try {
            String sql = "select * from products where supID=?";//declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, supID);//set supID for sql query
            ResultSet rs = pst.executeQuery();//excute
            if (rs.next()) {
                return rs;//return Products
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /**
     * Function to get Product by brand
     *
     * @param brID
     * @return
     */
    public ResultSet getProductByBrand(int brID) {
        try {
            String sql = "select * from products where brID=?";//declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, brID);//set brID for sql query
            ResultSet rs = pst.executeQuery();//excute query
            if (rs.next()) {
                return rs;//return Products
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    /**
     * search products
     *
     * @param word
     * @return
     */
    public ResultSet search(String word) {
        try {
            String sql = "SELECT * FROM  products WHERE status =1 and pName like '%" + word + "%' "
                    + " ORDER BY pID ASC";
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();//excute query
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }
    public HashMap<Integer,Integer> getTop10() {
        HashMap<Integer, Integer> products = new HashMap<>();

        try {
            BillDetailDAO bdDao = new BillDetailDAO();
            ResultSet rs = bdDao.getBillDetail();

            while(rs.next()) {
                int key = rs.getInt("pID");
                int quantity = rs.getInt("quantity");

                if(products.get(key) == null) {
                    products.put(key, quantity);
                } else {
                    quantity += products.get(key);
                    products.put(key, quantity);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        Sort sort = new Sort();
        HashMap<Integer, Integer> newList = sort.sortHashMapByValues(products);
        return newList;
    }
    public void closeConn(){
        try {
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet getProductwithST(String type, int id) {
        try {
            String sql = null;
            if (type.equals("type")) {
                sql = "select * from products where tID=? and status =1 ";
            } else if (type.equals("supplier")) {
                sql = "select * from products where supID=?  and status =1";
            } else if (type.equals("brand")) {
                sql = "select * from products where brID=? and status =1";
            } else if (type.equals("status")) {
                sql = "select * from products where status=?  and status =1";
            }
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public ResultSet getDelete() {
        try {
            String sql = "select * from products where status =0 ";//declare sql query
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();//excute query
            return rs;//return products
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ResultSet getProductByPetType(String pettype) {
        try {
            String sql = "select * from products where pettype=?  and status =1";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, pettype);
            ResultSet rs = pst.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
