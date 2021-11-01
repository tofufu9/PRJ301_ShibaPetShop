/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.entity;

import java.sql.Date;

/**
 *
 * @author Nhan
 */
public class Comment {

    private int cmtID;//declare comment ID
    private int pID;//declare product ID
    private int cID;//declare customer ID
    private String cmtMessage;//declare message
    private Date datetime;//declare datetime of comment
    private int status;//declare status of comment

    /**
     * Constructor for Comment
     *
     * @param cmtID
     * @param pID
     * @param cID
     * @param cmtMessage
     * @param datetime
     * @param status
     */
    public Comment(int cmtID, int pID, int cID, String cmtMessage, Date datetime, int status) {
        this.cmtID = cmtID;
        this.pID = pID;
        this.cID = cID;
        this.cmtMessage = cmtMessage;
        this.datetime = datetime;
        this.status = status;
    }

    /**
     *
     */
    public Comment() {
    }

    /**
     * getCmtID
     *
     * @return
     */
    public int getCmtID() {
        return cmtID;
    }

    /**
     * setCmtID
     *
     * @param cmtID
     */
    public void setCmtID(int cmtID) {
        this.cmtID = cmtID;
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
     * getCmtMessage
     *
     * @return
     */
    public String getCmtMessage() {
        return cmtMessage;
    }

    /**
     * setCmtMessage
     *
     * @param cmtMessage
     */
    public void setCmtMessage(String cmtMessage) {
        this.cmtMessage = cmtMessage;
    }

    /**
     * getDatetime
     *
     * @return
     */
    public Date getDatetime() {
        return datetime;
    }

    /**
     * setDatetime
     *
     * @param datetime
     */
    public void setDatetime(Date datetime) {
        this.datetime = datetime;
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
