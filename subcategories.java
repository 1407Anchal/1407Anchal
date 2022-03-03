package com.app.onlineshoppingapp;

public class subcategories {

    String subcategoryname;
    String categoryname;
    String image;

    public subcategories() {
    }

    public subcategories(String subcategoryname, String categoryname, String image) {
        this.subcategoryname = subcategoryname;
        this.categoryname = categoryname;
        this.image = image;
    }

    public String getSubcategoryname() {
        return subcategoryname;
    }

    public void setSubcategoryname(String subcategoryname) {
        this.subcategoryname = subcategoryname;
    }

    public String getCategoryname() {
        return categoryname;
    }

    public void setCategoryname(String categoryname) {
        this.categoryname = categoryname;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
