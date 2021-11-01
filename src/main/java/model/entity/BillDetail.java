/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.entity;

/**
 *
 * @author Duc
 */
public class BillDetail {

    private int bID;//declare bill ID
    private int pID;//declare product ID
    private double price;//declare price
    private int quantity;//declare quantity

    /**
     *
     */
    public BillDetail() {
    }

    /**
     * Constructor for BIll Detail
     *
     * @param bID
     * @param pID
     * @param price
     * @param quantity
     */
    public BillDetail(int bID, int pID, double price, int quantity) {

        this.bID = bID;
        this.pID = pID;
        this.price = price;
        this.quantity = quantity;
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

}
