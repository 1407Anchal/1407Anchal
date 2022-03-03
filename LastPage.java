package com.app.onlineshoppingapp;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Handler;
import android.widget.TextView;

public class LastPage extends AppCompatActivity {
    private  static  int TIME_OUT=4000;
    TextView order_id1,thankyou;
    SharedPreferences pref;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_last_page);
        order_id1=findViewById(R.id.order_id);
        thankyou=findViewById(R.id.thankyou);
        pref = getApplicationContext().getSharedPreferences("MYPREF", MODE_PRIVATE);
        String order_id=pref.getString("order_id",null);
        order_id1.setText("Your Order Id - "+order_id);
        pref = getApplicationContext().getSharedPreferences("MYPREF", MODE_PRIVATE);
        SharedPreferences.Editor editor = pref.edit();
        editor.remove("order_id");
        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                Intent i=new Intent(LastPage.this,userhome.class);
                startActivity(i);
            }
        },TIME_OUT);
    }
}