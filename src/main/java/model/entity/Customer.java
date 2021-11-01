/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.entity;

import java.util.Date;

/**
 *
 * @author Duc
 */
public class Customer {

    private int cID;//declare customer ID
    private String cUsername;//declare username
    private String cPassword;//declare password
    private String cName;//declare name of customer
    private String phonenumber;//declare phone number
    private String address;//declare address
    private Date birthday;//declare birthday
    private String email;//declare email
    private int status;//declare status
    private String gender;//declare gender

    /**
     *
     */
    public Customer() {
    }

    /**
     * Constructor for Customer
     *
     * @param cID
     * @param cUsername
     * @param cPassword
     * @param cName
     * @param phonenumber
     * @param address
     * @param birthday
     * @param email
     * @param status
     * @param gender
     */
    public Customer(int cID, String cUsername, String cPassword, String cName, String phonenumber, String address, Date birthday, String email, int status, String gender) {
        this.cID = cID;
        this.cUsername = cUsername;
        this.cPassword = cPassword;
        this.cName = cName;
        this.phonenumber = phonenumber;
        this.address = address;
        this.birthday = birthday;
        this.email = email;
        this.status = status;
        this.gender = gender;
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
     * getcUsername
     *
     * @return
     */
    public String getcUsername() {
        return cUsername;
    }

    /**
     * setcUsername
     *
     * @param cUsername
     */
    public void setcUsername(String cUsername) {
        this.cUsername = cUsername;
    }

    /**
     * getcPassword
     *
     * @return
     */
    public String getcPassword() {
        return cPassword;
    }

    /**
     * setcPassword
     *
     * @param cPassword
     */
    public void setcPassword(String cPassword) {
        this.cPassword = cPassword;
    }

    /**
     * getcName
     *
     * @return
     */
    public String getcName() {
        return cName;
    }

    /**
     * setcName
     *
     * @param cName
     */
    public void setcName(String cName) {
        this.cName = cName;
    }

    /**
     * getPhonenumber
     *
     * @return
     */
    public String getPhonenumber() {
        return phonenumber;
    }

    /**
     * setPhonenumber
     *
     * @param phonenumber
     */
    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
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
     * getBirthday
     *
     * @return
     */
    public Date getBirthday() {
        return birthday;
    }

    /**
     * setBirthday
     *
     * @param birthday
     */
    public void setBirthday(Date birthday) {
        this.birthday = birthday;
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
     * getGender
     *
     * @return
     */
    public String getGender() {
        return gender;
    }

    /**
     * setGender
     *
     * @param gender
     */
    public void setGender(String gender) {
        this.gender = gender;
    }

}
