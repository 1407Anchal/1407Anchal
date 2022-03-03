package com.app.onlineshoppingapp;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.Menu;
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
import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.snackbar.Snackbar;
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

import androidx.annotation.NonNull;
import androidx.navigation.NavController;
import androidx.navigation.Navigation;
import androidx.navigation.ui.AppBarConfiguration;
import androidx.drawerlayout.widget.DrawerLayout;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.navigation.ui.NavigationUI;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class userhome extends AppCompatActivity implements NavigationView.OnNavigationItemSelectedListener {

    private AppBarConfiguration mAppBarConfiguration;
    FirebaseDatabase firebaseDatabase;
    DatabaseReference mainref, mainref1;
    List<Categories> al;
    myadapter myad;
    GridView gridcategroies;

    TextView textCartItemCount;
    int mCartItemCount = 10;
    DrawerLayout drawer;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_userhome);
        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);


        drawer = findViewById(R.id.drawer_layout);
        NavigationView navigationView = findViewById(R.id.nav_view);
        // Passing each menu ID as a set of Ids because each
        // menu should be considered as top level destinations.
        mAppBarConfiguration = new AppBarConfiguration.Builder(
                R.id.nav_home, R.id.nav_gallery, R.id.nav_slideshow)
                .setDrawerLayout(drawer)
                .build();

        mAppBarConfiguration = new AppBarConfiguration.Builder(
                R.id.nav_home, R.id.nav_gallery, R.id.nav_slideshow)
                .setDrawerLayout(drawer)
                .build();

        SharedPreferences pref = getApplicationContext().getSharedPreferences("MYPREF", MODE_PRIVATE);


        NavController navController = Navigation.findNavController(this, R.id.nav_host_fragment);
        NavigationUI.setupActionBarWithNavController(this, navController, mAppBarConfiguration);
        NavigationUI.setupWithNavController(navigationView, navController);


        navigationView.setNavigationItemSelectedListener(this);

        al = new ArrayList<>();
        myad = new myadapter();
        gridcategroies = findViewById(R.id.gridcategories);

        gridcategroies.setAdapter(myad);

        firebaseDatabase = FirebaseDatabase.getInstance();
        mainref = firebaseDatabase.getReference("categories");
        mainref1 = firebaseDatabase.getReference("users");

        fetchCategories();

        gridcategroies.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {

                String catname = al.get(i).getCatname();
               // String catname = al.get(i).getShopname();
                Intent intent = new Intent(getApplicationContext(), showproducts.class);
                intent.putExtra("catname", catname);
                startActivity(intent);

            }
        });



        final String email = pref.getString("email", null);


        View header = navigationView.getHeaderView(0);
        TextView usernametv = (TextView) header.findViewById(R.id.usernametv);
        final ImageView usernameimv = (ImageView) header.findViewById(R.id.usernameimv);

        usernametv.setText(email + "");


//        mainref1.child(username).addValueEventListener(new ValueEventListener() {
//            @Override
//            public void onDataChange(@NonNull DataSnapshot dataSnapshot) {
//
//                Users user=dataSnapshot.getValue(Users.class);
//                Picasso.get().load(user.getPhoto()).into(usernameimv);
//
//            }
//
//            @Override
//            public void onCancelled(@NonNull DatabaseError databaseError) {
//
//            }
//        });
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.userhome, menu);

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

        } else if (id == R.id.action_cart) {

            startActivity(new Intent(getApplicationContext(), viewcart.class));

        }
        else if (id == R.id.nav_orders) {
            startActivity(new Intent(getApplicationContext(), ViewOrders.class));
        }
        else if (id == R.id.action_orders) {
            startActivity(new Intent(getApplicationContext(), ViewOrders.class));
        }


        return super.onOptionsItemSelected(item);

    }


//    @Override
//    public boolean onSupportNavigateUp() {
//        NavController navController = Navigation.findNavController(this, R.id.nav_host_fragment);
//        return NavigationUI.navigateUp(navController, mAppBarConfiguration)
//                || super.onSupportNavigateUp();
//    }


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


    public void fetchCategories() {

        String url = GlobalData.serverip +  "getcategories";

        StringRequest request1 = new StringRequest(Request.Method.GET, url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response)
            {
                String res = response.trim();
                Log.d("MYMSG",res+" -->");

                JsonObject mainobj = JsonParser.parseString(res).getAsJsonObject();
                JsonArray arr = mainobj.get("ans").getAsJsonArray();

                Gson gson = new Gson();

                al = Arrays.asList(gson.fromJson(arr.toString(), Categories[].class));

                myad.notifyDataSetChanged();
            }


        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Log.d("MYMSG",error+" -->");

                Toast.makeText(userhome.this, error.toString(), Toast.LENGTH_SHORT).show();
            }
        });

        Volley.newRequestQueue(this).add(request1);

    }

    @Override
    public boolean onNavigationItemSelected(@NonNull MenuItem item) {

        int selectid = item.getItemId();

        if (selectid == R.id.nav_orders) {
            startActivity(new Intent(getApplicationContext(), ViewOrders.class));
            drawer.closeDrawers();

        }
        else if (selectid == R.id.nav_logout) {
            SharedPreferences pref = getApplicationContext().getSharedPreferences("MYPREF", MODE_PRIVATE);
            pref.edit().remove("email").commit();
            finish();
            Intent intent = new Intent(getApplicationContext(), UserLogin.class);
            intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
            startActivity(intent);
        }
        else if (selectid == R.id.nav_aboutus) {
            startActivity(new Intent(getApplicationContext(), contact.class));
            drawer.closeDrawers();
        }
        else
        {
            drawer.closeDrawers();

        }

        return false;
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
            Categories obj = al.get(i);

            // STEP 3, fill data from obj to singlerow (customview)
            TextView cnametv = customView.findViewById(R.id.cnametv);

            ImageView cimv = customView.findViewById(R.id.cimv);

            cnametv.setText(obj.getShopname() + "");

            Log.d("MYMSG",GlobalData.serverip+obj.getPhoto()+" -->");

            Picasso.get().load(GlobalData.serverip+obj.getPhoto()).into(cimv);

            return customView;
        }

    }


    @Override
    public boolean onSupportNavigateUp() {
        NavController navController = Navigation.findNavController(this, R.id.nav_host_fragment);
        return NavigationUI.navigateUp(navController, mAppBarConfiguration)
                || super.onSupportNavigateUp();
    }
}
