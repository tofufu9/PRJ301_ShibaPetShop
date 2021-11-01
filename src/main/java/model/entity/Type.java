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
public class Type {

    private int tID;//declare type ID
    private String tName;//declare Type Name

    /**
     *
     */
    public Type() {
    }

    /**
     * Constructor for Type
     *
     * @param tID
     * @param tName
     */
    public Type(int tID, String tName) {
        this.tID = tID;
        this.tName = tName;
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
     * gettName
     *
     * @return
     */
    public String gettName() {
        return tName;
    }

    /**
     * settName
     *
     * @param tName
     */
    public void settName(String tName) {
        this.tName = tName;
    }

}
