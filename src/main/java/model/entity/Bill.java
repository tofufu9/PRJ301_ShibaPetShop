/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.entity;

import java.sql.Date;

/**
 *
 * @author Duc
 */
public class Bill {

    private int bID;//declare bill ID
    private int cID;//declare customer ID
    private String bStatus;//declare status of bill
    private String customerName;//declare customer name
    private Date date;//declare date of bill
    private String address;//declare address
    private String phone;//declare phone
    private String note;//declare note
    private double total;////declare total of bill

    /**
     *
     */
    public Bill() {
    }

    /**
     * Constructor for Bill
     *
     * @param bID
     * @param cID
     * @param bStatus
     * @param customerName
     * @param date
     * @param address
     * @param phone
     * @param note
     * @param total
     */
    public Bill(int bID, int cID, String bStatus, String customerName, Date date, String address, String phone, String note, double total) {
        this.bID = bID;
        this.cID = cID;
        this.bStatus = bStatus;
        this.customerName = customerName;
        this.date = date;
        this.address = address;
        this.phone = phone;
        this.note = note;
        this.total = total;
    }

    /**
     * getbID
     *
     * @return
     */
    public int getbID() {
        return bID;
    }

    /**
     * setbID
     *
     * @param bID
     */
    public void setbID(int bID) {
        this.bID = bID;
    }

    /**
     * getcID
     *
     * @return
     */
    public int getcID() {
        return cID;
    }

    /**
     * setcID
     *
     * @param cID
     */
    public void setcID(int cID) {
        this.cID = cID;
    }

    /**
     * getbStatus
     *
     * @return
     */
    public String getbStatus() {
        return bStatus;
    }

    /**
     * setbStatus
     *
     * @param bStatus
     */
    public void setbStatus(String bStatus) {
        this.bStatus = bStatus;
    }

    /**
     * getCustomerName
     *
     * @return
     */
    public String getCustomerName() {
        return customerName;
    }

    /**
     * setCustomerName
     *
     * @param customerName
     */
    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    /**
     * getDate
     *
     * @return
     */
    public Date getDate() {
        return date;
    }

    /**
     * setDate
     *
     * @param date
     */
    public void setDate(Date date) {
        this.date = date;
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
     * getNote
     *
     * @return
     */
    public String getNote() {
        return note;
    }

    /**
     * setNote
     *
     * @param note
     */
    public void setNote(String note) {
        this.note = note;
    }

    /**
     * getTotal
     *
     * @return
     */
    public double getTotal() {
        return total;
    }

    /**
     * setTotal
     *
     * @param total
     */
    public void setTotal(double total) {
        this.total = total;
    }

}
