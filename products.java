package com.app.onlineshoppingapp;

public class products {

    int product_id;
    String product_name;
    String product_description;

    String price;
    String brand;
    String product_image;
    String catname;
   String merchant_id;

    public products() {
    }

    public products(int product_id, String product_name, String product_description, String price, String brand, String product_image, String catname, String merchant_id) {
        this.product_id = product_id;
        this.product_name = product_name;
        this.product_description = product_description;
        this.price = price;
        this.brand = brand;
        this.product_image = product_image;
        this.catname = catname;
        this.merchant_id = merchant_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getProduct_description() {
        return product_description;
    }

    public void setProduct_description(String product_description) {
        this.product_description = product_description;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getProduct_image() {
        return product_image;
    }

    public void setProduct_image(String product_image) {
        this.product_image = product_image;
    }

    public String getCatname() {
        return catname;
    }

    public void setCatname(String catname) {
        this.catname = catname;
    }

    public String getMerchant_id() {
        return merchant_id;
    }

    public void setMerchant_id(String merchant_id) {
        this.merchant_id = merchant_id;
    }
}
