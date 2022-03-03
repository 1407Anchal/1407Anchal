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
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.GridView;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
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

public class ViewSubcategories extends AppCompatActivity {


    List<subcategories> al;
    myadapter myad;
    GridView gridcategroies;
    String categoryname;
    subcategories obj;
    TextView textCartItemCount;
    int mCartItemCount = 10;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_view_subcategories);

        al = new ArrayList<>();
        myad = new myadapter();
        gridcategroies = findViewById(R.id.gridsubcategories);

        gridcategroies.setAdapter(myad);
        categoryname=getIntent().getStringExtra("categoryname");
        fetchSubCategories();

        gridcategroies.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {

                String subcategoryname = al.get(i).getSubcategoryname();
                Intent intent = new Intent(getApplicationContext(), showproducts.class);
                intent.putExtra("subcategoryname", subcategoryname);
                startActivity(intent);

            }
        });

    }


    public void fetchSubCategories() {

        String url = GlobalData.serverip +  "getsubbycat?categoryname="+categoryname;

        StringRequest request1 = new StringRequest(Request.Method.GET, url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response)
            {
                String res = response.trim();
                Log.d("MYMSG",res+" -->");

                JsonObject mainobj = JsonParser.parseString(res).getAsJsonObject();
                JsonArray arr = mainobj.get("ans").getAsJsonArray();

                Gson gson = new Gson();

                al = Arrays.asList(gson.fromJson(arr.toString(), subcategories[].class));

                myad.notifyDataSetChanged();
                Log.d("MYMSG",al.size()+" -->");

            }


        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Log.d("MYMSG",error+" -->");

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
        public View getView(int i, View customView, ViewGroup parent) {
            // Load Single Row Design, Fill Data and return its View

            // STEP 1  , inflate single row design
            LayoutInflater inflater = LayoutInflater.from(parent.getContext());
            customView = inflater.inflate(R.layout.categorysinglerow, parent, false);

            // STEP 2 ,  get ith object from ArrayList
            obj = al.get(i);

            // STEP 3, fill data from obj to singlerow (customview)
            TextView cnametv = customView.findViewById(R.id.cnametv);

            ImageView cimv = customView.findViewById(R.id.cimv);

            cnametv.setText(obj.getSubcategoryname() + "");

            Log.d("MYMSG",GlobalData.serverip+obj.getImage()+" -->");

            Picasso.get().load(GlobalData.serverip+obj.getImage()).into(cimv);

            return customView;
        }

    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.userhome, menu);

        final MenuItem menuItem = menu.findItem(R.id.action_cart);

        View actionView = menuItem.getActionView();
    //    textCartItemCount = (TextView) actionView.findViewById(R.id.cart_badge);

        setupBadge();

        actionView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                onOptionsItemSelected(menuItem);
            }
        });
        return true;
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

    @Override
    protected void onResume() {
        super.onResume();
        setupBadge();
    }

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {

        int id = item.getItemId();

        if (id == R.id.action_changepassword) {

            startActivity(new Intent(getApplicationContext(), ChangePassword.class));


        } else if (id == R.id.action_logout) {
            SharedPreferences pref = getApplicationContext().getSharedPreferences("MYPREF", MODE_PRIVATE);
            pref.edit().remove("username").commit();
            finish();
            Intent intent=new Intent(getApplicationContext(), UserLogin.class);
            intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
            startActivity(intent);

        } else if (id == R.id.action_cart) {

            startActivity(new Intent(getApplicationContext(), viewcart.class));

        } else if (id == R.id.nav_orders) {
            startActivity(new Intent(getApplicationContext(), ViewOrders.class));
        }

        return super.onOptionsItemSelected(item);

    }

}
