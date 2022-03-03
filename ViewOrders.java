package com.app.onlineshoppingapp;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
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
import com.app.onlineshoppingapp.R;
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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class ViewOrders extends AppCompatActivity {


    FirebaseDatabase firebaseDatabase;
    DatabaseReference mainref;

    List<order> al;
    myadapter myad;
    ListView orderslv;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_view_orders);
        androidx.appcompat.app.ActionBar actionBar = getSupportActionBar();
        actionBar.setTitle("Order History");
        al = new ArrayList<>();
        myad = new myadapter();
        orderslv = findViewById(R.id.orderslv);

        orderslv.setAdapter(myad);

        firebaseDatabase = FirebaseDatabase.getInstance();
        mainref = firebaseDatabase.getReference("orders");


        fetchOrders();
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
    private void setupBadge() {


        SharedPreferences pref = getApplicationContext().getSharedPreferences("MYPREF", MODE_PRIVATE);
        SharedPreferences.Editor editor = pref.edit();
        Gson gson = new Gson();
        String json = pref.getString("cart", "");
        Type type = new TypeToken<List<cart>>() {
        }.getType();

        ArrayList<cart> al = gson.fromJson(json, type);


    }

//    @Override
//    protected void onResume() {
//        super.onResume();
//        setupBadge();
//
//
//    }



    public void fetchOrders() {

        SharedPreferences pref = getApplicationContext().getSharedPreferences("MYPREF", MODE_PRIVATE);
        String email = pref.getString("email", null);


        String url = GlobalData.serverip +  "fetchHistory?email="+email;
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

                al = Arrays.asList(gson.fromJson(arr.toString(), order[].class));

                myad.notifyDataSetChanged();



            }


        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(getApplicationContext(), error.toString(), Toast.LENGTH_SHORT).show();
            }
        });

        Volley.newRequestQueue(this).add(request1);

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
            customView = inflater.inflate(R.layout.orderusersinglerow, parent, false);

            // STEP 2 ,  get ith object from ArrayList
            final order obj = al.get(i);

            // STEP 3, fill data from obj to singlerow (customview)
            TextView orderidtv = customView.findViewById(R.id.orderidtv);
            TextView orderdatetv = customView.findViewById(R.id.orderdatetv);
            TextView ordertimetv = customView.findViewById(R.id.ordertimetv);
            TextView totalpricetv = customView.findViewById(R.id.totalpricetv);
            TextView addresstv = customView.findViewById(R.id.addresstv);
            TextView citytv = customView.findViewById(R.id.citytv);


            Button orderdetialbtn = customView.findViewById(R.id.orderdetailbtn);

            String date=obj.getDate_time();
            SimpleDateFormat spf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            Date newDate= null;
            try {
                newDate = spf.parse(date);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            SimpleDateFormat spf1= new SimpleDateFormat("dd MMM yyyy");
            SimpleDateFormat spf2= new SimpleDateFormat("HH:mm");

            date = spf1.format(newDate);
            String time = spf2.format(newDate);

            System.out.println(date);

            orderidtv.setText("ID: "+obj.getOrder_id() + "");
            orderdatetv.setText("Date: "+date + "");
            ordertimetv.setText("Time: "+time + "");
            totalpricetv.setText("TOTAL: \u20B9"+obj.getPrice() + "");
//            SharedPreferences pref = getApplicationContext().getSharedPreferences("MYPREF", MODE_PRIVATE);
//            SharedPreferences.Editor editor = pref.edit();
//            editor.putString("order_id", obj.getOrder_id()+"");
//            editor.commit();
//            addresstv.setText(obj.getAddress() + "");
//            citytv.setText(obj.getCity() + "");

            orderdetialbtn.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {

                    Intent intent = new Intent(getApplicationContext(), OrderDetail.class);
                    intent.putExtra("order_id", obj.getOrder_id()+"");
                    startActivity(intent);
                    System.out.println("*************************"+obj.getOrder_id());

                }
            });




            return customView;
        }

    }

}
