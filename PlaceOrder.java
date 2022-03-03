//package com.app.onlineshoppingapp;
//
//import androidx.appcompat.app.AlertDialog;
//import androidx.appcompat.app.AppCompatActivity;
//
//import android.app.Activity;
//import android.content.DialogInterface;
//import android.content.Intent;
//import android.content.SharedPreferences;
//import android.os.Bundle;
//import android.util.Log;
//import android.view.View;
//import android.widget.ArrayAdapter;
//import android.widget.EditText;
//import android.widget.Spinner;
//import android.widget.TextView;
//import android.widget.Toast;
//
//import com.android.volley.Request;
//import com.android.volley.Response;
//import com.android.volley.VolleyError;
//import com.android.volley.toolbox.StringRequest;
//import com.android.volley.toolbox.Volley;
//import com.app.onlineshoppingapp.R;
//import com.app.onlineshoppingapp.cart;
//import com.app.onlineshoppingapp.order;
//import com.app.onlineshoppingapp.orderdetails;
//import com.google.firebase.database.DatabaseReference;
//import com.google.firebase.database.FirebaseDatabase;
//import com.google.gson.Gson;
//import com.google.gson.reflect.TypeToken;
//import com.razorpay.Checkout;
//import com.razorpay.PaymentResultListener;
//
//import org.json.JSONArray;
//import org.json.JSONObject;
//
//import java.lang.reflect.Type;
//import java.text.DateFormat;
//import java.text.SimpleDateFormat;
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.List;
//
//public class PlaceOrder extends AppCompatActivity{
//        implements PaymentResultListener {
//
//    EditText addresset;
//    Spinner citysp;
//
//    ArrayList<cart> al;
//
//
//    SharedPreferences pref;
//    SharedPreferences.Editor editor;
//    FirebaseDatabase firebaseDatabase;
//    DatabaseReference mainref, detref;
//    TextView totaltv, usernametv;
//    String username;
//
//    String cities[] = {"Delhi", "Amritsar", "Jalandhar", "Chandigrah"};
//
//    @Override
//    protected void onCreate(Bundle savedInstanceState) {
//        super.onCreate(savedInstanceState);
//        setContentView(R.layout.activity_place_order);
//
//        addresset = findViewById(R.id.addresstet);
//        citysp = findViewById(R.id.citysp);
//
//        ArrayAdapter<String> ad = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, cities);
//        citysp.setAdapter(ad);
//
//        firebaseDatabase = FirebaseDatabase.getInstance();
//        mainref = firebaseDatabase.getReference("orders");
//        detref = firebaseDatabase.getReference("ordersdetails");
//
//        totaltv = findViewById(R.id.totaltv);
//        usernametv = findViewById(R.id.usernametv);
//
//
//        pref = getApplicationContext().getSharedPreferences("MYPREF", MODE_PRIVATE);
//        editor = pref.edit();
//
//        Gson gson = new Gson();
//        String json = pref.getString("cart", "");
//        Type type = new TypeToken<List<cart>>() {
//        }.getType();
//        al = gson.fromJson(json, type);
//
//        username = pref.getString("username", null);
//
//        totaltv.setText("Total: " + calculateTotal());
//        usernametv.setText("Username: " + username);
//
//    }
//
//    public void placeorderlogic(View view) {
//
//        placeorderlogicfn();
//
//    }
//
//    public void placeorderlogicfn() {
//
//        String address = addresset.getText().toString();
//        String city = citysp.getSelectedItem().toString();
//
//
//        if (address.isEmpty() || city.isEmpty()) {
//            Toast.makeText(getApplicationContext(), "Please enter values", Toast.LENGTH_SHORT).show();
//        } else {
//            try {
//
//                JSONArray cartarr = new JSONArray();
//
//                for (cart c : al) {
//                    JSONObject obj = new JSONObject();
//                    //obj.put("productid", c.getProduct_id());
//                    obj.put("price", c.getPrice());
//                    obj.put("qty", c.getQty());
//                    obj.put("offerprice", c.getPrice());
//                    cartarr.put(obj);
//                }
//
//                SharedPreferences sharedPreferences = getSharedPreferences("MYPREF", MODE_PRIVATE);
//                final SharedPreferences.Editor editor = sharedPreferences.edit();
//
//                String username = sharedPreferences.getString("username", "");
//                String requestURL = GlobalData.serverip + "orderresponseandroid?username=" + username + "&address=" + address + "&city=" + city + "&actualamt=" + calculateTotal() + "&discount=0&amttopay=" + calculateTotal() + "&cart=" + cartarr.toString();
//                StringRequest request1 = new StringRequest(Request.Method.GET, requestURL, new Response.Listener<String>() {
//                    @Override
//                    public void onResponse(String response) {
//                        String res = response.trim();
//                        if (res.equals("failed")) {
//                            Toast.makeText(getApplicationContext(), "something went wrong", Toast.LENGTH_SHORT).show();
//                        } else if (res.equals("success")) {
//
//
//
//                            editor.putString("cart", null);
//                            editor.commit();
//
//                            AlertDialog.Builder builder = new AlertDialog.Builder(PlaceOrder.this);
//
//                            builder.setTitle("Order confirmation !");
//                            builder.setMessage("Order Placed Successfully.");
////                                                        builder.setIcon(R.drawable.icon1);
//                            builder.setCancelable(false);
//                            builder.setPositiveButton("OK", new DialogInterface.OnClickListener() {
//                                @Override
//                                public void onClick(DialogInterface dialog, int which) {
//                                    finish();
//
//                                    Intent intent=new Intent(getApplicationContext(), userhome.class);
//                                    intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
//                                    startActivity(intent);
//                                }
//                            });
//                            AlertDialog ad = builder.create();
//
//                            ad.show();
//
//                        } else {
//                            Toast.makeText(getApplicationContext(), res, Toast.LENGTH_SHORT).show();
//                        }
//                    }
//                },
//                        new Response.ErrorListener() {
//                            @Override
//                            public void onErrorResponse(VolleyError error) {
//                                Toast.makeText(getApplicationContext(), error.toString(), Toast.LENGTH_SHORT).show();
//                            }
//
//
//                        });
//
//                Volley.newRequestQueue(this).add(request1);
//
//
//            } catch (Exception ae) {
//                ae.printStackTrace();
//            }
//
//
//        }
//
//    }
//
//
//    public int calculateTotal() {
//        int total = 0;
//        for (cart c : al) {
//            total += c.getP1() * c.getQty();
//        }
//        return total;
//
//    }
//
//    public void placeorderlogicpay(View view) {
//
//        startPayment();
//    }
//
//
//    public void startPayment() {
//        /*
//          You need to pass current activity in order to let Razorpay create CheckoutActivity
//         */
//        final Activity activity = this;
//
//        final Checkout co = new Checkout();
//
//        try {
//            JSONObject options = new JSONObject();
//            options.put("name", "Online Shopping");
//            options.put("description", "");
//            //You can omit the image option to fetch the image from dashboard
//            options.put("image", "https://s3.amazonaws.com/rzp-mobile/images/rzp.png");
//            options.put("currency", "INR");
//          //  options.put("amount", calculateTotal() * 100);
//
//            JSONObject preFill = new JSONObject();
//            preFill.put("email", "");
//            preFill.put("contact", "");
//
//            options.put("prefill", preFill);
//
//            co.open(activity, options);
//        } catch (Exception e) {
//            Toast.makeText(activity, "Error in payment: " + e.getMessage(), Toast.LENGTH_SHORT)
//                    .show();
//            e.printStackTrace();
//        }
//    }
//
//    @Override
//    public void onPaymentSuccess(String razorpayPaymentID) {
//
//        placeorderlogicfn();
//    }
//
//    @Override
//    public void onPaymentError(int code, String response) {
//        try {
//            Toast.makeText(this, "Payment failed: " + code + " " + response, Toast.LENGTH_SHORT).show();
//        } catch (Exception e) {
//            Log.e("MYMSG", "Exception in onPaymentError", e);
//        }
//    }
//
//}
