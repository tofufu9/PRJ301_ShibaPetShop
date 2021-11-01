/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.entity;

/**
 *
 * @author Long
 */
public class Brand {

    private int brID;//declare brand ID
    private int brName;//declare brand name

    /**
     * Constructor for Brand
     *
     * @param brID
     * @param brName
     */
    public Brand(int brID, int brName) {
        this.brID = brID;
        this.brName = brName;
    }

    /**
     *
     */
    public Brand() {
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
     * getBrName
     *
     * @return
     */
    public int getBrName() {
        return brName;
    }

    /**
     * setBrName
     *
     * @param brName
     */
    public void setBrName(int brName) {
        this.brName = brName;
    }

}
