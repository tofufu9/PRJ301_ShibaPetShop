/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.entity;

/**
 *
 * @author Nhan
 */
public class Supplier {

    private int supID;//declare supplier ID
    private String supName;//declare supplier name
    private String phone;//declare phone number
    private String address;//declare address
    private String email;//declare email

    /**
     *
     */
    public Supplier() {
    }

    /**
     * Constructor for Supplier
     *
     * @param supID
     * @param supName
     * @param phone
     * @param address
     * @param email
     */
    public Supplier(int supID, String supName, String phone, String address, String email) {
        this.supID = supID;
        this.supName = supName;
        this.phone = phone;
        this.address = address;
        this.email = email;
    }

    /**
     * getSupID
     *
     * @return
     */
    public int getSupID() {
        return supID;
    }

    /**
     * setSupID
     *
     * @param supID
     */
    public void setSupID(int supID) {
        this.supID = supID;
    }

    /**
     * getSupName
     *
     * @return
     */
    public String getSupName() {
        return supName;
    }

    /**
     * setSupName
     *
     * @param supName
     */
    public void setSupName(String supName) {
        this.supName = supName;
    }

    /**
     * getPhone
     *
     * @return
     */
    public String getPhone() {
        return phone;
    }

    /**
     * setPhone
     *
     * @param phone
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * getAddress
     *
     * @return
     */
    public String getAddress() {
        return address;
    }

    /**
     * setAddress
     *
     * @param address
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * getEmail
     *
     * @return
     */
    public String getEmail() {
        return email;
    }

    /**
     * setEmail
     *
     * @param email
     */
    public void setEmail(String email) {
        this.email = email;
    }

}
