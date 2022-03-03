package com.app.onlineshoppingapp;

public class pgallery {

    int productgalleryid;
    String caption;
    String proimage;
    int productid;

    public pgallery() {
    }

    public pgallery(int productgalleryid, String caption, String proimage, int productid) {
        this.productgalleryid = productgalleryid;
        this.caption = caption;
        this.proimage = proimage;
        this.productid = productid;
    }

    public int getProductgalleryid() {
        return productgalleryid;
    }

    public void setProductgalleryid(int productgalleryid) {
        this.productgalleryid = productgalleryid;
    }

    public String getCaption() {
        return caption;
    }

    public void setCaption(String caption) {
        this.caption = caption;
    }

    public String getProimage() {
        return proimage;
    }

    public void setProimage(String proimage) {
        this.proimage = proimage;
    }

    public int getProductid() {
        return productid;
    }

    public void setProductid(int productid) {
        this.productid = productid;
    }
}
