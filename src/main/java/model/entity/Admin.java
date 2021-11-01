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
public class Admin {

    private int aID;//declare admin ID
    private int rID;//declare role ID
    private String aPassword;//declare Password
    private String aUsername;//declare Username
    private String aName;//declare Name
    private String aPhonenumber;//declare Phonenumber
    private String aAddress;//declare Address
    private Date aBirthday;//declare Birthday
    private String aEmail;//declare Email
    private int status;//declare status

    /**
     *
     */
    public Admin() {

    }

    /**
     * Constructor for Admin
     *
     * @param aID
     * @param rID
     * @param aPassword
     * @param aUsername
     * @param aName
     * @param aPhonenumber
     * @param aAddress
     * @param aBirthday
     * @param aEmail
     * @param status
     */
    public Admin(int aID, int rID, String aPassword, String aUsername, String aName, String aPhonenumber, String aAddress, Date aBirthday, String aEmail, int status) {
        this.aID = aID;
        this.rID = rID;
        this.aPassword = aPassword;
        this.aUsername = aUsername;
        this.aName = aName;
        this.aPhonenumber = aPhonenumber;
        this.aAddress = aAddress;
        this.aBirthday = aBirthday;
        this.aEmail = aEmail;
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

    /**
     * getrID
     *
     * @return
     */
    public int getrID() {
        return rID;
    }

    /**
     * setrID
     *
     * @param rID
     */
    public void setrID(int rID) {
        this.rID = rID;
    }

    /**
     * getaPassword
     *
     * @return
     */
    public String getaPassword() {
        return aPassword;
    }

    /**
     * setaPassword
     *
     * @param aPassword
     */
    public void setaPassword(String aPassword) {
        this.aPassword = aPassword;
    }

    /**
     * getaUsername
     *
     * @return
     */
    public String getaUsername() {
        return aUsername;
    }

    /**
     * setaUsername
     *
     * @param aUsername
     */
    public void setaUsername(String aUsername) {
        this.aUsername = aUsername;
    }

    /**
     * getaName
     *
     * @return
     */
    public String getaName() {
        return aName;
    }

    /**
     * setaName
     *
     * @param aName
     */
    public void setaName(String aName) {
        this.aName = aName;
    }

    /**
     * getaPhonenumber
     *
     * @return
     */
    public String getaPhonenumber() {
        return aPhonenumber;
    }

    /**
     * setaPhonenumber
     *
     * @param aPhonenumber
     */
    public void setaPhonenumber(String aPhonenumber) {
        this.aPhonenumber = aPhonenumber;
    }

    /**
     * getaAddress
     *
     * @return
     */
    public String getaAddress() {
        return aAddress;
    }

    /**
     * setaAddress
     *
     * @param aAddress
     */
    public void setaAddress(String aAddress) {
        this.aAddress = aAddress;
    }

    /**
     * getaBirthday
     *
     * @return
     */
    public Date getaBirthday() {
        return aBirthday;
    }

    /**
     * setaBirthday
     *
     * @param aBirthday
     */
    public void setaBirthday(Date aBirthday) {
        this.aBirthday = aBirthday;
    }

    /**
     * getaEmail
     *
     * @return
     */
    public String getaEmail() {
        return aEmail;
    }

    /**
     * setaEmail
     *
     * @param aEmail
     */
    public void setaEmail(String aEmail) {
        this.aEmail = aEmail;
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

}
