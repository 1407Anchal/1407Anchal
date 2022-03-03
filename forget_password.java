package com.app.onlineshoppingapp;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

public class forget_password extends AppCompatActivity {
    LinearLayout ll1,ll2,ll3;
    EditText emailet,otpet,newpasswordet,confirmpasswordet;
    String email,otp,new_password,confirm_password,gotp;
    Button bemail,botp,bpassword;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_forget_password);
        androidx.appcompat.app.ActionBar actionBar = getSupportActionBar();
        actionBar.setTitle("FORGET PASSWORD");
        ll1=findViewById(R.id.ll1);
        ll2=findViewById(R.id.ll2);
        ll3=findViewById(R.id.ll3);
        emailet=findViewById(R.id.emailet);
        otpet=findViewById(R.id.otpet);
        newpasswordet=findViewById(R.id.newpasswordet);
        confirmpasswordet=findViewById(R.id.confirmpasswordet);
        bemail=findViewById(R.id.bemail);
        botp=findViewById(R.id.botp);
        bpassword=findViewById(R.id.bpassword);

    }

    public void submit_email(View view) {
        email=emailet.getText().toString();
        if(email.equals("") || (!(email.indexOf("@") != - 1 && email.indexOf(".") != - 1)))
        {
            Toast.makeText(this, "Please Fill a Valid E-Mail ID", Toast.LENGTH_SHORT).show();
        }
        else
        {
            String requestURL = GlobalData.serverip + "forgetpassword?email=" + email;
           // String url=global.host+"forgetpassword?"+querystring;
            StringRequest request=new StringRequest(Request.Method.GET, requestURL, new Response.Listener<String>() {
                @Override
                public void onResponse(String response) {
                    response=response.trim();
                    Toast.makeText(forget_password.this,"Otp is sent on your email", Toast.LENGTH_SHORT).show();
                    if(response.equals("fail"))
                    {
                        Toast.makeText(forget_password.this, "Incorrect E-Mail ID", Toast.LENGTH_SHORT).show();
                    }
                    else
                    {
                        gotp=response;
                        emailet.setEnabled(false);
                        bemail.setEnabled(false);
                        otpet.setEnabled(true);
                        botp.setEnabled(true);

                        //ll2.setVisibility(View.VISIBLE);
                    }
                }
            }, new Response.ErrorListener() {
                @Override
                public void onErrorResponse(VolleyError error) {
                    Toast.makeText(forget_password.this,  "error: "+error.toString(), Toast.LENGTH_LONG).show();
                }
            });

            Volley.newRequestQueue(this).add(request);
        }
    }



    public void submit_otp(View view) {
      //  Toast.makeText(this, "********OTP"+gotp, Toast.LENGTH_SHORT).show();

        otp=otpet.getText().toString();
        if(otp.isEmpty()){
            Toast.makeText(this, "Please Fill OTP", Toast.LENGTH_SHORT).show();
        }
        else if(otp.equals(gotp)){
            Toast.makeText(this, "Now you can enter Your new Password", Toast.LENGTH_SHORT).show();
            otpet.setEnabled(false);
            botp.setEnabled(false);
            newpasswordet.setEnabled(true);
            confirmpasswordet.setEnabled(true);
            bpassword.setEnabled(true);
        }
        else{
            Toast.makeText(this, "InValid OTP", Toast.LENGTH_SHORT).show();

        }

    }

    public void submit_password(View view) {
        new_password=newpasswordet.getText().toString();
        confirm_password=confirmpasswordet.getText().toString();

        if (new_password .isEmpty() || confirm_password.isEmpty())
        {
            Toast.makeText(this, "Please Fill All Values", Toast.LENGTH_SHORT).show();

        }
        else if(!new_password.equals(confirm_password)){
            Toast.makeText(this, "New Password and Confirm Password must be same ", Toast.LENGTH_SHORT).show();

        }
        else{

            String requestURL = GlobalData.serverip + "forgetpassword1?email=" + email + "&new_password=" + new_password;
            // String url=global.host+"forgetpassword?"+querystring;
            StringRequest request=new StringRequest(Request.Method.GET, requestURL, new Response.Listener<String>() {
                @Override
                public void onResponse(String response) {
                    response=response.trim();
                   // Toast.makeText(forget_password.this,"Response = "+ response, Toast.LENGTH_SHORT).show();
                    if(response.equals("success"))
                    {
                        Toast.makeText(forget_password.this, "Password Changed Successfully", Toast.LENGTH_SHORT).show();
                        startActivity(new Intent(getApplicationContext(), UserLogin.class));

                    }
                    else
                    {
                        Toast.makeText(forget_password.this, "Invalid Email", Toast.LENGTH_SHORT).show();

                    }
                }
            }, new Response.ErrorListener() {
                @Override
                public void onErrorResponse(VolleyError error) {
                    Toast.makeText(forget_password.this,  "error: "+error.toString(), Toast.LENGTH_LONG).show();
                }
            });

            Volley.newRequestQueue(this).add(request);

        }

    }
}