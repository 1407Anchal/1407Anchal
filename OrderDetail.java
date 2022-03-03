package com.app.onlineshoppingapp;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
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

public class OrderDetail extends AppCompatActivity {




    FirebaseDatabase firebaseDatabase;
    DatabaseReference mainref;

    List<orderdetails> al;
    myadapter myad;
    ListView orderdetaillv;
    String order_id;
    TextView totaltv,deliverytv;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_order_detail);
        androidx.appcompat.app.ActionBar actionBar = getSupportActionBar();
        actionBar.setTitle("Order Details");

        al = new ArrayList<>();
        myad = new myadapter();
        orderdetaillv = findViewById(R.id.orderdetaillv);
        deliverytv=findViewById(R.id.deliverytv);
        deliverytv.setText("Delievery Charges - \u20B9 150 ");
        totaltv=findViewById(R.id.totaltv);

        orderdetaillv.setAdapter(myad);

        firebaseDatabase = FirebaseDatabase.getInstance();
        mainref = firebaseDatabase.getReference("ordersdetails");

        order_id=getIntent().getStringExtra("order_id").toString();
        System.out.println( "order_id*************************"+order_id);


        fetchOrderDetail();
    }
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.order_menu, menu);

        final MenuItem menuItem = menu.findItem(R.id.action_cart);

        View actionView = menuItem.getActionView();
        //  textCartItemCount = (TextView) actionView.findViewById(R.id.cart_badge);
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
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {

        int id = item.getItemId();

        if (id == R.id.action_changepassword) {

            startActivity(new Intent(getApplicationContext(), ChangePassword.class));

        } else if (id == R.id.action_logout) {
            SharedPreferences pref = getApplicationContext().getSharedPreferences("MYPREF", MODE_PRIVATE);
            pref.edit().remove("email").commit();
            finish();
            Intent intent = new Intent(getApplicationContext(), UserLogin.class);
            intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
            startActivity(intent);

        }
        else if (id == R.id.action_contact) {

            startActivity(new Intent(getApplicationContext(), contact.class));

        }
        else if (id == R.id.action_orders) {

            startActivity(new Intent(getApplicationContext(), userhome.class));

        }
        else if (id == R.id.action_cart) {

            startActivity(new Intent(getApplicationContext(), viewcart.class));

        }



        return super.onOptionsItemSelected(item);

    }
    public void fetchTotalPrice() {
        String status="placed";


        SharedPreferences totalPricePref = getApplicationContext().getSharedPreferences("MYPREF", MODE_PRIVATE);
        SharedPreferences pref = getApplicationContext().getSharedPreferences("MYPREF", MODE_PRIVATE);
        String email = pref.getString("email", null);
        System.out.println(email+"*********************************************************************");


        String url = GlobalData.serverip + "gettotalprice?email=" + email + "&order_id=" + order_id  + "&status=" + status;

        final StringRequest request1 = new StringRequest(Request.Method.GET, url, new Response.Listener<String>() {
            //   System.out.println("hello");
            @Override
            public void onResponse(String response) {
                System.out.println("*************************************hello");
                String res = response.trim();
                Log.d("MYMSG", res + " -->");

                JsonObject mainobj = JsonParser.parseString(res).getAsJsonObject();
                JsonArray arr = mainobj.get("ans").getAsJsonArray();
                // System.out.println(arr.size()+"*********************************size*****************");

                String help=arr.toString();
                // String total=totaltv.getText().toString();
                String t1=help.substring(11,help.length()-3);
                int t=Integer.parseInt(t1);
                int gt=t+150;
                totaltv.setText("Grand Total- \u20B9 "+gt);
                //totaltv.setText(arr.toString());

                Gson gson = new Gson();

               // myal = Arrays.asList(gson.fromJson(arr.toString(), totalprice[].class));
                // Toast.makeText(viewcart.this, res, Toast.LENGTH_SHORT).show();

            }


        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Log.d("MYMSG", error + " -->");

                Toast.makeText(OrderDetail.this, error.toString(), Toast.LENGTH_SHORT).show();
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


    }



    public void fetchOrderDetail() {
       // String isAndroid="true";
        String status="placed";
       Intent incoming=getIntent();
      //  int order_id=incoming.getIntExtra("order_id",0);



        SharedPreferences pref = getApplicationContext().getSharedPreferences("MYPREF", MODE_PRIVATE);
        String email=pref.getString("email",null);



//        String order_id=pref.getString("order_id",null);




        String url = GlobalData.serverip +  "fetchcart?order_id="+order_id + "&email=" + email  + "&status=" + status ;
        // Toast.makeText(viewserviceproviders.this, url, Toast.LENGTH_SHORT).show();
        // Log.d("MSG",url);

        StringRequest request1 = new StringRequest(Request.Method.GET, url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response)
            {
                String res = response.trim();
                JsonObject mainobj = JsonParser.parseString(res).getAsJsonObject();
                JsonArray arr = mainobj.get("ans").getAsJsonArray();

                Gson gson = new Gson();

                al = Arrays.asList(gson.fromJson(arr.toString(), orderdetails[].class));

                myad.notifyDataSetChanged();



            }


        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(getApplicationContext(), error.toString(), Toast.LENGTH_SHORT).show();
            }
        });

        Volley.newRequestQueue(this).add(request1);
        fetchTotalPrice();

    }


    /// Inner Class ///
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

            // STEP 1  , inflate single row design
            LayoutInflater inflater = LayoutInflater.from(parent.getContext());
            customView = inflater.inflate(R.layout.orderdetailsinglerow, parent, false);

            // STEP 2 ,  get ith object from ArrayList
            final orderdetails obj = al.get(i);

            // STEP 3, fill data from obj to singlerow (customview)
            TextView productnametv = customView.findViewById(R.id.productnametv);
            TextView productpricetv = customView.findViewById(R.id.productpricetv);
            TextView qtytv = customView.findViewById(R.id.qtytv);
            TextView totalpricetv = customView.findViewById(R.id.totalpricetv);

            ImageView pimv = customView.findViewById(R.id.productphotoimv);

            productnametv.setText("\n"+obj.getProduct_name() + "");
            productpricetv.setText("\n\u20B9"+obj.getPrice() + "");
            qtytv.setText("qty\n"+obj.getQty() + "");
            totalpricetv.setText("Total\n\u20B9"+obj.getTotal_price() + "");

            Picasso.get().load(GlobalData.serverip+obj.getProduct_image()).into(pimv);

            return customView;
        }

    }

}
