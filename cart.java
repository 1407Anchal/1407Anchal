package com.app.onlineshoppingapp;

public class cart {



    String product_name;
    String product_image;
    int qty;
    String price;
    String total_price;
    int product_id;



    //int p1=Integer.parseInt(price);



    public cart() {

    }

    public cart(String price, int qty, String product_name, String product_image, String total_price,int product_id) {

        this.price = price;
        this.qty = qty;
        this.product_name = product_name;
        this.product_image = product_image;
        this.total_price=total_price;
        this.product_id=product_id;
    }



    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getProduct_image() {
        return product_image;
    }

    public void setProduct_image(String product_image) {
        this.product_image = product_image;
    }

    public String getTotal_price() {
        return total_price;
    }

    public void setTotal_price(String total_price) {
        this.total_price = total_price;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }
}
