package com.app.onlineshoppingapp;

public class order {

    int order_id;
    String date_time;
    String firstname;
    String lastname;
    String phoneno;
    String price;


    public order() {
    }

    public order(int order_id, String date_time, String firstname, String lastname, String phoneno, String price) {
        this.order_id = order_id;
        this.date_time = date_time;
        this.firstname = firstname;
        this.lastname = lastname;
        this.phoneno = phoneno;
        this.price = price;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public String getDate_time() {
        return date_time;
    }

    public void setDate_time(String date_time) {
        this.date_time = date_time;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getPhoneno() {
        return phoneno;
    }

    public void setPhoneno(String phoneno) {
        this.phoneno = phoneno;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }
}
