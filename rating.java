package com.app.onlineshoppingapp;

public class rating {

    String reviewid;
    String review;
    int rating;
    String product_id;
    String username;

    public rating() {
    }

    public rating(String reviewid, String review, int rating, String product_id, String username) {
        this.reviewid = reviewid;
        this.review = review;
        this.rating = rating;
        this.product_id = product_id;
        this.username = username;
    }

    public String getReviewid() {
        return reviewid;
    }

    public void setReviewid(String reviewid) {
        this.reviewid = reviewid;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
