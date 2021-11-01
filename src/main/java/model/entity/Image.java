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
public class Image {

    private int imgID;//declare image ID
    private int pID;//declare product ID
    private String imageName;//declare image path

    /**
     *
     */
    public Image() {
    }

    /**
     * Constructor for Image
     *
     * @param imgID
     * @param pID
     * @param imageName
     */
    public Image(int imgID, int pID, String imageName) {
        this.imgID = imgID;
        this.pID = pID;
        this.imageName = imageName;
    }

    /**
     * getImgID
     *
     * @return
     */
    public int getImgID() {
        return imgID;
    }

    /**
     * setImgID
     *
     * @param imgID
     */
    public void setImgID(int imgID) {
        this.imgID = imgID;
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
     * getImageName
     *
     * @return
     */
    public String getImageName() {
        return imageName;
    }

    /**
     * setImageName
     *
     * @param imageName
     */
    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

}
