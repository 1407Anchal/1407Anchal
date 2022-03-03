package com.app.onlineshoppingapp;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

    }


    public void gotosignup(View view) {

        startActivity(new Intent(getApplicationContext(),UserSignup.class));
    }

    public void gotologin(View view) {
        startActivity(new Intent(getApplicationContext(),UserLogin.class));

    }
}
