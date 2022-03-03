package com.app.onlineshoppingapp;

import androidx.appcompat.app.AppCompatActivity;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.razorpay.Checkout;
import com.razorpay.PaymentResultListener;

import org.json.JSONObject;

public class address extends AppCompatActivity implements PaymentResultListener {
 TextView shipping_textview;
 EditText firstnameet,lastnameet,addresset,emailet,phonenoet;
 String order_id,firstname,lastname,address,email,isAndroid,addressEmail,phoneno;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_address);
        androidx.appcompat.app.ActionBar actionBar = getSupportActionBar();
        actionBar.setTitle("SHIPPING DETAILS");
        shipping_textview=findViewById(R.id.shipping_textview);
        firstnameet=findViewById(R.id.firstname);
        lastnameet=findViewById(R.id.lastname);
        addresset=findViewById(R.id.address);
        emailet=findViewById(R.id.email);
        phonenoet=findViewById(R.id.phone);


    }

    public void placeorder(View view) {
        saveAddressAndPlaced();
    }

    public void saveAddressAndPlaced() {

        firstname = firstnameet.getText().toString();
        lastname = lastnameet.getText().toString();
        address = addresset.getText().toString();
        addressEmail = emailet.getText().toString();
        phoneno = phonenoet.getText().toString();
        isAndroid = "true";
        SharedPreferences pref = getApplicationContext().getSharedPreferences("MYPREF", MODE_PRIVATE);
        email=pref.getString("email",null);

        if (addressEmail.isEmpty() || firstname.isEmpty() || lastname.isEmpty() || address.isEmpty() || phoneno.isEmpty()) {
            Toast.makeText(getApplicationContext(), "Please Fill All values", Toast.LENGTH_LONG).show();
        }

        else if(phoneno.length()!=10){

            Toast.makeText(this, "Invalid Phone Number", Toast.LENGTH_SHORT).show();
        }
        else if(addressEmail.indexOf('@')== -1){
            Toast.makeText(this, "Invalid Email Id", Toast.LENGTH_SHORT).show();

        }
        else if(addressEmail.indexOf('.')== -1){
            Toast.makeText(this, "Invalid Email Id", Toast.LENGTH_SHORT).show();

        }
        else {
            String requestURL = GlobalData.serverip + "address?firstname=" + firstname + "&lastname=" + lastname + "&address=" + address + "&addressEmail=" + addressEmail + "&phoneno=" + phoneno + "&email=" + email + "&isAndroid=" + isAndroid;
            StringRequest request1 = new StringRequest(Request.Method.POST, requestURL, new Response.Listener<String>() {
                @Override
                public void onResponse(String response) {
                    String res = response.trim();
                    String suc=res.substring(0,7);
                    String res1=res.substring(7);

                    if (suc.equals("success")) {

                        Toast.makeText(getApplicationContext(), "Address add successful", Toast.LENGTH_SHORT).show();
                        String order_id=res1;
                        SharedPreferences pref = getApplicationContext().getSharedPreferences("MYPREF", MODE_PRIVATE);
                        SharedPreferences.Editor editor = pref.edit();
                        editor.putString("order_id", order_id);
                        editor.commit();
                        startActivity(new Intent(getApplicationContext(), LastPage.class));
                        firstnameet.setText("");
                        lastnameet.setText("");
                        emailet.setText("");
                        addresset.setText("");
                        phonenoet.setText("");
                    }



                    else {
                        Toast.makeText(getApplicationContext(), " Something Went Wrong", Toast.LENGTH_SHORT).show();
                    }
                }
            },
                    new Response.ErrorListener() {
                        @Override
                        public void onErrorResponse(VolleyError error) {
                            Toast.makeText(getApplicationContext(), error.toString(), Toast.LENGTH_SHORT).show();

                        }

                    });

            Volley.newRequestQueue(this).add(request1);


        }
    }

    public void placeonline(View view) {

        firstname = firstnameet.getText().toString();
        lastname = lastnameet.getText().toString();
        address = addresset.getText().toString();
        addressEmail = emailet.getText().toString();
        phoneno = phonenoet.getText().toString();
        isAndroid = "true";


        if (addressEmail.isEmpty() || firstname.isEmpty() || lastname.isEmpty() || address.isEmpty() || phoneno.isEmpty()) {
            Toast.makeText(getApplicationContext(), "Please Fill All values", Toast.LENGTH_LONG).show();
        }

        else if(phoneno.length() != 10) {
            Toast.makeText(this, "Invalid Phone Number", Toast.LENGTH_SHORT).show();

        }
        else if(addressEmail.indexOf('@') == -1) {
            Toast.makeText(this, "Invalid Email Id", Toast.LENGTH_SHORT).show();

        }
        else if(addressEmail.indexOf('.') == -1) {
            Toast.makeText(this, "Invalid Email Id", Toast.LENGTH_SHORT).show();
        }
        else {

            startPayment();
        }

        }



    public void startPayment() {

        final Activity activity = this;
        final Checkout co = new Checkout();
        SharedPreferences prefpay = getApplicationContext().getSharedPreferences("MYPREF", MODE_PRIVATE);
        String fgt=prefpay.getString("fgt",null);
        int tf=Integer.parseInt(fgt);

        try {
            JSONObject options = new JSONObject();
            options.put("name", "Online Shopping");
            options.put("description", "");
            //You can omit the image option to fetch the image from dashboard
            options.put("image", "https://s3.amazonaws.com/rzp-mobile/images/rzp.png");
            options.put("currency", "INR");
            options.put("amount", tf * 100);

            JSONObject preFill = new JSONObject();
            preFill.put("email", "");
            preFill.put("contact", "");

            options.put("prefill", preFill);

            co.open(activity, options);
        } catch (Exception e) {
            Toast.makeText(activity, "Error in payment: " + e.getMessage(), Toast.LENGTH_SHORT)
                    .show();
            e.printStackTrace();
        }
    }


    @Override
    public void onPaymentSuccess(String s) {
        saveAddressAndPlaced();
    }

    @Override
    public void onPaymentError(int i, String s) {
        try {
            Toast.makeText(this, "Payment failed: " + i + " " + s, Toast.LENGTH_SHORT).show();
        } catch (Exception e) {
            Log.e("MYMSG", "Exception in onPaymentError", e);
        }
    }
}