package com.app.onlineshoppingapp;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.google.android.gms.common.util.JsonUtils;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;
import com.squareup.picasso.Picasso;

import org.json.JSONArray;
import org.json.JSONObject;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

public class viewcart extends AppCompatActivity {

    FirebaseDatabase firebaseDatabase;
    DatabaseReference mainref;
    List<cart> al;
    myadapter myad;
    ListView cartlistview;
    SharedPreferences pref;
    SharedPreferences totalPricePref;
    SharedPreferences.Editor editor;
    TextView totaltv, noitemstv, deliverytv;
    LinearLayout ll1;
    String product_id;
    ImageView imv1;
    Integer tp = 0;
    List<totalprice> myal;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_viewcart);
        androidx.appcompat.app.ActionBar actionBar = getSupportActionBar();
        actionBar.setTitle("YOUR CART");
        al = new ArrayList<>();
        myad = new myadapter();
        cartlistview = findViewById(R.id.cartlistview);
        imv1=findViewById(R.id.imv1);
        totaltv = findViewById(R.id.totaltv);
        deliverytv=findViewById(R.id.deliverytv);
        deliverytv.setText("Delievery Charges - \u20B9 150 ");
    noitemstv = findViewById(R.id.noitemstv);
        cartlistview.setAdapter(myad);
       ll1 = findViewById(R.id.ll1);
        product_id = getIntent().getStringExtra("product_id");

        firebaseDatabase = FirebaseDatabase.getInstance();
        mainref = firebaseDatabase.getReference("products");
        removeoos();
        fetchcartdata();

        System.out.println("totalprice "+myal);

    }
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater menuInflater = new MenuInflater(this);
        menuInflater.inflate(R.menu.cart_menu, menu);
        return super.onCreateOptionsMenu(menu);
    }
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();
        switch (id) {
            case R.id.item_catname:
                startActivity(new Intent(getApplicationContext(), userhome.class));
                break;
            case R.id.item_password:
                startActivity(new Intent(getApplicationContext(), ChangePassword.class));
                break;

            case R.id.item_contactus:
                startActivity(new Intent(getApplicationContext(), contact.class));
                break;
            case R.id.item_logout:
                SharedPreferences pref = getApplicationContext().getSharedPreferences("MYPREF", MODE_PRIVATE);
                pref.edit().remove("email").commit();
                finish();
                startActivity(new Intent(getApplicationContext(), UserLogin.class));
                break;
            case R.id.item_orders:
                startActivity(new Intent(getApplicationContext(), ViewOrders.class));
                break;

            default:
                return super.onOptionsItemSelected(item);
        }
        return true;
    }


    public void fetchcartdata() {
        pref = getApplicationContext().getSharedPreferences("MYPREF", MODE_PRIVATE);
       String email = pref.getString("email", null);
       String status="pending";
        System.out.println(email+"*********************************************************************");


        String url = GlobalData.serverip + "fetchcart?email=" + email  + "&status=" + status;

        StringRequest request1 = new StringRequest(Request.Method.GET, url, new Response.Listener<String>() {
         //   System.out.println("hello");
            @Override
            public void onResponse(String response) {

                String res = response.trim();
                Log.d("MYMSG", res + " -->");

                JsonObject mainobj = JsonParser.parseString(res).getAsJsonObject();
                JsonArray arr = mainobj.get("ans").getAsJsonArray();

                Gson gson = new Gson();

                al = Arrays.asList(gson.fromJson(arr.toString(), cart[].class));

                if(al.isEmpty()) {

                    buttoncheck();
                }
               myad.notifyDataSetChanged();
            }


        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Log.d("MYMSG", error + " -->");

                Toast.makeText(viewcart.this, error.toString(), Toast.LENGTH_SHORT).show();
            }
        });

        Volley.newRequestQueue(this).add(request1);
        fetchTotalPrice();
    }

    public void removeoos() {

        String isAndroid="true";
        SharedPreferences removePref = getApplicationContext().getSharedPreferences("MYPREF", MODE_PRIVATE);
        String email = removePref.getString("email", null);
        String url = GlobalData.serverip + "removeoositem?isAndroid=" + isAndroid + "&email=" + email ;
        StringRequest request1 = new StringRequest(Request.Method.GET, url, new Response.Listener<String>() {
            //   System.out.println("hello");
            @Override
            public void onResponse(String response) {

                /*String res = response.trim();
                Log.d("MYMSG", res + " -->");

                JsonObject mainobj = JsonParser.parseString(res).getAsJsonObject();
                JsonArray arr = mainobj.get("ans").getAsJsonArray();

                Gson gson = new Gson();*/

               /* al = Arrays.asList(gson.fromJson(arr.toString(), cart[].class));

                if(al.isEmpty()) {

                    buttoncheck();
                }
                myad.notifyDataSetChanged();*/
            }


        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Log.d("MYMSG", error + " -->");

                Toast.makeText(viewcart.this, error.toString(), Toast.LENGTH_SHORT).show();
            }
        });

        Volley.newRequestQueue(this).add(request1);

    }




    public void fetchTotalPrice() {

        totalPricePref = getApplicationContext().getSharedPreferences("MYPREF", MODE_PRIVATE);
        String email = pref.getString("email", null);
        String status="pending";
        System.out.println(email+"*********************************************************************");


        String url = GlobalData.serverip + "gettotalprice?email=" + email  + "&status=" + status;

        final StringRequest request1 = new StringRequest(Request.Method.GET, url, new Response.Listener<String>() {
            //   System.out.println("hello");
            @Override
            public void onResponse(String response) {
                System.out.println("*************************************hello");
                String res = response.trim();
                Log.d("MYMSG", res + " -->");

                JsonObject mainobj = JsonParser.parseString(res).getAsJsonObject();
                JsonArray arr = mainobj.get("ans").getAsJsonArray();
                System.out.println("arr.size() "+arr.size());
                if(arr.size() > 0) {

                    String help = arr.toString();
                    String total = totaltv.getText().toString();
                    String t1 = help.substring(11, help.length() - 3);
                    int t = Integer.parseInt(t1);
                    int gt = t + 150;
                    String fgt = String.valueOf(gt);
                    totaltv.setText("Grand Total- \u20B9 " + gt);
                    SharedPreferences pref = getApplicationContext().getSharedPreferences("MYPREF", MODE_PRIVATE);
                    SharedPreferences.Editor editor = pref.edit();
                    editor.putString("fgt", fgt);
                    editor.commit();
                    //totaltv.setText(arr.toString());

                    Gson gson = new Gson();

                    myal = Arrays.asList(gson.fromJson(arr.toString(), totalprice[].class));
                    // Toast.makeText(viewcart.this, res, Toast.LENGTH_SHORT).show();
                }
            }


        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Log.d("MYMSG", error + " -->");

                Toast.makeText(viewcart.this, error.toString(), Toast.LENGTH_SHORT).show();
            }
        });

        Volley.newRequestQueue(this).add(request1);

    }




    public void buttoncheck() {
        if (al.size() > 0) {
            ll1.setVisibility(View.VISIBLE);
            noitemstv.setVisibility(View.GONE);
            imv1.setVisibility(View.GONE);

        } else {
            noitemstv.setVisibility(View.VISIBLE);
           ll1.setVisibility(View.GONE);
            imv1.setVisibility(View.VISIBLE);

        }
    }





    public void proceed(View view) {
        removeoos();
        startActivity(new Intent(getApplicationContext(), address.class));

    }

    // Inner Class
    class myadapter extends BaseAdapter {

        @Override
        public int getCount() {
            return al.size();
        }

        @Override
        public Object getItem(int i) {
            return al.get(i);
        }

        @Override
        public long getItemId(int i) {
            return i * 100;
        }

        @Override
        public View getView(final int i, View customView, ViewGroup parent) {
            // Load Single Row Design, Fill Data and return its View

            //  STEP 1  , inflate single row design
            LayoutInflater inflater = LayoutInflater.from(parent.getContext());
            customView = inflater.inflate(R.layout.cartsinglerow, parent, false);

            // STEP 2 ,  get ith object from ArrayList
            final cart obj = al.get(i);

            // STEP 3, fill data from obj to singlerow (customview)
            TextView productnametv = customView.findViewById(R.id.productnametv);
            TextView productpricetv = customView.findViewById(R.id.productpricetv);
            TextView qtytv = customView.findViewById(R.id.qtytv);
            TextView totalpricetv = customView.findViewById(R.id.totalpricetv);

            ImageView pimv = customView.findViewById(R.id.productphotoimv);

            ImageView decqtyimv = customView.findViewById(R.id.decqtyimv);
            ImageView incqtyimv = customView.findViewById(R.id.incqtyimv);
            //ImageView delimv = customView.findViewById(R.id.delimv);


            decqtyimv.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {

                    SharedPreferences pref = getApplicationContext().getSharedPreferences("MYPREF", MODE_PRIVATE);
                    String email = pref.getString("email", null);
                    String isandroid = "true";

                    System.out.println("*********************************************");
                    System.out.println(email + "----------------------------------------");
                    String requestURL = GlobalData.serverip + "removefromcart?product_id=" + obj.product_id + "&email=" + email + "&isandroid=" + isandroid;
                    StringRequest request1 = new StringRequest(Request.Method.GET, requestURL, new Response.Listener<String>() {
                        @Override
                        public void onResponse(String response) {
                            String res = response.trim();
                            if (res.equals("notlogin")) {
                                System.out.println("************not login if****************");
                                Toast.makeText(getApplicationContext(), "Please Login First", Toast.LENGTH_SHORT).show();
                                startActivity(new Intent(getApplicationContext(), UserLogin.class));
                            } else if (res.equals("success")) {
                                System.out.println("********************success else if...................");
                                // Toast.makeText(getApplicationContext(), "Item Added to Cart", Toast.LENGTH_SHORT).show();


                            } else {
                                System.out.println("*************************else********************");
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

                    Volley.newRequestQueue(viewcart.this).add(request1);

                    ProgressDialog dialog = new ProgressDialog(viewcart.this); // this = YourActivity
                    dialog.setProgressStyle(ProgressDialog.STYLE_SPINNER);
                    dialog.setTitle("Loading");
                    dialog.show();
                   // myad.notifyDataSetChanged();
                  //  dialog.dismiss();
                   Intent i=new Intent(viewcart.this,viewcart.class);
                   startActivity(i);
                 finish();
                  //  Toast.makeText(viewcart.this, "Minus", Toast.LENGTH_SHORT).show();

                }
            });

            incqtyimv.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    SharedPreferences pref = getApplicationContext().getSharedPreferences("MYPREF", MODE_PRIVATE);
                    String email = pref.getString("email", null);
                    String isandroid = "true";

                    System.out.println("*********************************************");
                    System.out.println(email + "----------------------------------------");
                    String requestURL = GlobalData.serverip + "addtocart?product_id=" + obj.product_id + "&email=" + email + "&isandroid=" + isandroid;
                    StringRequest request1 = new StringRequest(Request.Method.GET, requestURL, new Response.Listener<String>() {
                        @Override
                        public void onResponse(String response) {
                            String res = response.trim();
                            if (res.equals("notlogin")) {
                                System.out.println("************not login if****************");
                                Toast.makeText(getApplicationContext(), "Please Login First", Toast.LENGTH_SHORT).show();
                                startActivity(new Intent(getApplicationContext(), UserLogin.class));
                            } else if (res.equals("success")) {
                                System.out.println("********************success else if...................");
                               // Toast.makeText(getApplicationContext(), "Item Added to Cart", Toast.LENGTH_SHORT).show();


                            }
                            else if (res.equals("Out of Stock")) {
                                System.out.println("********************success else if...................");
                               Toast.makeText(getApplicationContext(), "You have selected Maximum Available Quantities", Toast.LENGTH_SHORT).show();


                            }




                            else {
                                System.out.println("*************************else********************");
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

                    Volley.newRequestQueue(viewcart.this).add(request1);

                   ProgressDialog dialog = new ProgressDialog(viewcart.this); // this = YourActivity
                    dialog.setProgressStyle(ProgressDialog.STYLE_SPINNER);
                   dialog.setTitle("Loading");

                    dialog.show();

                 //   dialog.dismiss();
                   Intent i=new Intent(viewcart.this,viewcart.class);
                   startActivity(i);
                 finish();



                }
            });

     productnametv.setText(obj.getProduct_name() + "");
            productpricetv.setText("\u20B9" + obj.getPrice() + "");
            qtytv.setText(obj.getQty() + "");
            totalpricetv.setText("\u20B9" + (obj.getTotal_price() + ""));


            Picasso.get().load(GlobalData.serverip + obj.getProduct_image()).into(pimv);

            return customView;

        }

    }


}




