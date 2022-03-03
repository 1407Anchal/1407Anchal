package com.app.onlineshoppingapp;

public class Categories {

    String catname;
    String photo;
    String shopname;
    public Categories()
    {

    }
    public Categories(String catname, String photo,String shopname) {
        this.catname = catname;
        this.photo = photo;
        this.shopname = shopname;
    }

    public String getCatname() {
        return catname;
    }

    public void setCatname(String catname) {
        this.catname = catname;
    }

    public String getShopname() {
        return shopname;
    }

    public void setShopname(String shopname) {
        this.shopname = shopname;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }





}
