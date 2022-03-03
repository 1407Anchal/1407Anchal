package com.app.onlineshoppingapp;

import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;


import android.content.Intent;
import android.os.Bundle;
import android.util.DisplayMetrics;
import android.view.View;

public class AboutUs extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        DisplayMetrics metrics = getResources().getDisplayMetrics();
        int screenWidth = (int) (metrics.widthPixels * 0.80);
        int screenHeight = (int) (metrics.heightPixels * 0.80);

        setContentView(R.layout.activity_about_us);


        getWindow().setLayout(screenWidth, ActionBar.LayoutParams.WRAP_CONTENT);


    }

    public void closeactivity(View view)
    {
        finish();
    }
}
