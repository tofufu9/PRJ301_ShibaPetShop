/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.entity;

import java.util.Date;

/**
 * @author Duc
 */
public class Products {

    private int pID;//declare product ID
    private int status;//declare status of product
    private int brID;//declare banrd ID
    private int tID;//declare type ID
    private int supID;//declare supplier ID
    private String pName;//declare product name
    private double sellingPrice;//declare selling price
    private double price;//declare price
    private String describle;//declare describe
    private Date pDate;//declare date
    private int quantity;//declare qantity
    private float discount;//declare discount
    private String pettype;
    private int aID;//declare admin ID

    /**
     *
     */
    public Products() {
    }

    /**
     * Constructor for Products
     *
     * @param pID
     * @param status
     * @param brID
     * @param tID
     * @param supID
     * @param pName
     * @param sellingPrice
     * @param price
     * @param describle
     * @param pDate
     * @param quantity
     * @param discount
     * @param pettype
     * @param aID
     */
    public Products(int pID, int status, int brID, int tID, int supID, String pName, double sellingPrice, double price, String describle, Date pDate, int quantity, float discount, String pettype, int aID) {
        this.pID = pID;
        this.status = status;
        this.brID = brID;
        this.tID = tID;
        this.supID = supID;
        this.pName = pName;
        this.sellingPrice = sellingPrice;
        this.price = price;
        this.describle = describle;
        this.pDate = pDate;
        this.quantity = quantity;
        this.discount = discount;
        this.pettype = pettype;
        this.aID = aID;
    }

    /**
     * getpID
     *
     * @return
     */
    public int getpID() {
        return pID;
    }

    /**
     * setpID
     *
     * @param pID
     */
    public void setpID(int pID) {
        this.pID = pID;
    }

    /**
     * getSpID
     *
     * @return
     */
    public int getSpID() {
        return status;
    }

    /**
     * setSpID
     *
     * @param status
     */
    public void setSpID(int status) {
        this.status = status;
    }

    /**
     * getBrID
     *
     * @return
     */
    public int getBrID() {
        return brID;
    }

    /**
     * setBrID
     *
     * @param brID
     */
    public void setBrID(int brID) {
        this.brID = brID;
    }

    /**
     * gettID
     *
     * @return
     */
    public int gettID() {
        return tID;
    }

    /**
     * settID
     *
     * @param tID
     */
    public void settID(int tID) {
        this.tID = tID;
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
     * getpName
     *
     * @return
     */
    public String getpName() {
        return pName;
    }

    /**
     * setpName
     *
     * @param pName
     */
    public void setpName(String pName) {
        this.pName = pName;
    }

    /**
     * getSellingPrice
     *
     * @return
     */
    public double getSellingPrice() {
        return sellingPrice;
    }

    /**
     * setSellingPrice
     *
     * @param sellingPrice
     */
    public void setSellingPrice(double sellingPrice) {
        this.sellingPrice = sellingPrice;
    }

    /**
     * getPrice
     *
     * @return
     */
    public double getPrice() {
        return price;
    }

    /**
     * setPrice
     *
     * @param price
     */
    public void setPrice(double price) {
        this.price = price;
    }

    /**
     * getDescrible
     *
     * @return
     */
    public String getDescrible() {
        return describle;
    }

    /**
     * setDescrible
     *
     * @param describle
     */
    public void setDescrible(String describle) {
        this.describle = describle;
    }

    /**
     * getpDate
     *
     * @return
     */
    public Date getpDate() {
        return pDate;
    }

    /**
     * setpDate
     *
     * @param pDate
     */
    public void setpDate(Date pDate) {
        this.pDate = pDate;
    }


    /**
     * getQuantity
     *
     * @return
     */
    public int getQuantity() {
        return quantity;
    }

    /**
     * setQuantity
     *
     * @param quantity
     */
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    /**
     * getDiscount
     *
     * @return
     */
    public float getDiscount() {
        return discount;
    }

    /**
     * setDiscount
     *
     * @param discount
     */
    public void setDiscount(float discount) {
        this.discount = discount;
    }

    /**
     * getPetType
     *
     * @return
     */
    public String getPetType() {
        return pettype;
    }

    /**
     * setPettype
     *
     * @param pettype
     */
    public void setPetType(String pettype) {
        this.pettype = pettype;
    }

    /**
     * getStatus
     *
     * @return
     */
    public int getStatus() {
        return status;
    }

    /**
     * setStatus
     *
     * @param status
     */
    public void setStatus(int status) {
        this.status = status;
    }

    /**
     * getaID
     *
     * @return
     */
    public int getaID() {
        return aID;
    }

    /**
     * setaID
     *
     * @param aID
     */
    public void setaID(int aID) {
        this.aID = aID;
    }
}
