package com.app.onlineshoppingapp;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.app.ProgressDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;

import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.text.method.ScrollingMovementMethod;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.google.android.material.navigation.NavigationView;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;
import com.squareup.picasso.Picasso;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ProductDetail extends AppCompatActivity {

    TextView productnametv, productpricetv, productbrandtv, productcategorytv, productdestv;
    ImageView productimageimv;
    //SharedPreferences pref;
    ScrollView scroll;
    String product_id;

    FirebaseDatabase firebaseDatabase;
    DatabaseReference mainref, mainref1;

    products obj;
    List<rating> mylist;
    List<pgallery> plist;

    MyRecyclerViewAdapter adapter;

    TextView textCartItemCount;
    int mCartItemCount = 10;

    //String email;
    LinearLayout gsec;
    RecyclerView recyclerView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_product_detail);
        androidx.appcompat.app.ActionBar actionBar = getSupportActionBar();
        actionBar.setTitle("PRODUCT DETAILS");
        mylist = new ArrayList<>();
        plist = new ArrayList<>();




        productnametv = findViewById(R.id.productnametv);
        productpricetv = findViewById(R.id.productpricetv);
        productbrandtv = findViewById(R.id.productbrandtv);
      //  productcategorytv = findViewById(R.id.productcategorytv);
        productdestv = findViewById(R.id.productdestv);
        scroll=findViewById(R.id.scroll);

        productdestv.setMovementMethod(new ScrollingMovementMethod());
        productimageimv = findViewById(R.id.productimageimv);

        product_id = getIntent().getStringExtra("product_id");

        firebaseDatabase = FirebaseDatabase.getInstance();
        mainref = firebaseDatabase.getReference("products");
       // mainref1 = firebaseDatabase.getReference("ratings");




        fetchproductdetail();


    }
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.userhome, menu);

        final MenuItem menuItem = menu.findItem(R.id.action_cart);

        View actionView = menuItem.getActionView();
  //   textCartItemCount = (TextView) actionView.findViewById(R.id.cart_badge);
        setupBadge();

        actionView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                onOptionsItemSelected(menuItem);
            }
        });
        return true;
    }
    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item)  {

        int id = item.getItemId();

        if (id == R.id.action_changepassword) {

            startActivity(new Intent(getApplicationContext(), ChangePassword.class));

        }
        else if (id == R.id.action_logout) {
            SharedPreferences pref = getApplicationContext().getSharedPreferences("MYPREF", MODE_PRIVATE);
            pref.edit().remove("email").commit();
            finish();
            Intent intent = new Intent(getApplicationContext(), UserLogin.class);
            intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
            startActivity(intent);

        } else if (id == R.id.action_cart) {

            startActivity(new Intent(getApplicationContext(), viewcart.class));

        }
        else if (id == R.id.action_orders) {

            Intent intent = new Intent(getApplicationContext(), ViewOrders.class);
            startActivity(intent);

        }


        return super.onOptionsItemSelected(item);

    }
    public void fetchproductdetail() {



        String url = GlobalData.serverip + "getproductdetails?product_id=" + product_id ;

        Log.d("MSG", url);

        StringRequest request1 = new StringRequest(Request.Method.GET, url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                String res = response.trim();
                JsonObject mainobj = JsonParser.parseString(res).getAsJsonObject();
                JsonArray arr = mainobj.get("ans").getAsJsonArray();

                Gson gson = new Gson();

                List<products> plist = Arrays.asList(gson.fromJson(arr.toString(), products[].class));

                obj = plist.get(0);
                productnametv.setText(obj.getProduct_name() + "");
                productdestv.setText(obj.getProduct_description() + "");
              // scroll.addView(productdestv);
                productpricetv.setText("\u20B9" + obj.getPrice() + "");

                productbrandtv.setText("Brand: " + obj.getBrand() + "");
                //productcategorytv.setText("Sub Catgeory: " + obj.getSubcategoryname() + "");

                Picasso.get().load(GlobalData.serverip + obj.getProduct_image()).into(productimageimv);
               // fetchratings();


            }


        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(getApplicationContext(), error.toString(), Toast.LENGTH_SHORT).show();
            }
        });

        Volley.newRequestQueue(this).add(request1);


    }


            public void addtocartlogic(View view){
               SharedPreferences pref = getApplicationContext().getSharedPreferences("MYPREF", MODE_PRIVATE);
                String email=pref.getString("email",null);
                String isandroid="true";
               //String email=pref.getString("email",null);
                System.out.println("*********************************************");
               System.out.println(email+"----------------------------------------");
                String requestURL = GlobalData.serverip + "addtocart?product_id=" + product_id  + "&email=" + email + "&isandroid=" + isandroid ;
                StringRequest request1 = new StringRequest(Request.Method.GET, requestURL, new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        String res = response.trim();
                        if (res.equals("notlogin")) {
                            System.out.println("************not login if****************");
                            ProgressDialog dialog = new ProgressDialog(ProductDetail.this); // this = YourActivity
                            dialog.setProgressStyle(ProgressDialog.STYLE_SPINNER);
                            dialog.setTitle("Loading");
                            dialog.show();
                            Toast.makeText(getApplicationContext(), "Please Login First", Toast.LENGTH_SHORT).show();
                            startActivity(new Intent(getApplicationContext(), UserLogin.class));
                        } else if (res.equals("success")) {
                            System.out.println("********************success else if...................");
                            ProgressDialog dialog = new ProgressDialog(ProductDetail.this); // this = YourActivity
                            dialog.setProgressStyle(ProgressDialog.STYLE_SPINNER);
                            dialog.setTitle("Loading");
                            dialog.show();
                            Toast.makeText(getApplicationContext(), "Item Added to Cart", Toast.LENGTH_SHORT).show();
                            dialog.dismiss();


                        }
                        else if (res.equals("Out of Stock")) {
                            System.out.println("********************success else if...................");
                            ProgressDialog dialog = new ProgressDialog(ProductDetail.this); // this = YourActivity
                            dialog.setProgressStyle(ProgressDialog.STYLE_SPINNER);
                            dialog.setTitle("Loading");
                            dialog.show();
                            Toast.makeText(getApplicationContext(), "Item is Out of Stock", Toast.LENGTH_SHORT).show();
                            dialog.dismiss();


                        }






                        else {
                            System.out.println("*************************else********************");

                            Toast.makeText(getApplicationContext(), " Something Went Wrong", Toast.LENGTH_SHORT).show();
                           // startActivity(new Intent(getApplicationContext(), UserLogin.class));
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
    private void setupBadge() {


        SharedPreferences pref = getApplicationContext().getSharedPreferences("MYPREF", MODE_PRIVATE);
        SharedPreferences.Editor editor = pref.edit();
        Gson gson = new Gson();
        String json = pref.getString("cart", "");
        Type type = new TypeToken<List<cart>>() {
        }.getType();

        ArrayList<cart> al = gson.fromJson(json, type);
        if(al!=null) {
            mCartItemCount = al.size();
            if (textCartItemCount != null) {
                if (mCartItemCount == 0) {
                    if (textCartItemCount.getVisibility() != View.GONE) {
                        textCartItemCount.setVisibility(View.GONE);
                    }
                } else {
                    textCartItemCount.setText(mCartItemCount + "");
                    if (textCartItemCount.getVisibility() != View.VISIBLE) {
                        textCartItemCount.setVisibility(View.VISIBLE);
                    }
                }
            }
        }
        else
        {
            if (textCartItemCount != null) {

                textCartItemCount.setVisibility(View.GONE);
            }
        }
    }

}





