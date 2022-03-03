package com.app.onlineshoppingapp;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.drawerlayout.widget.DrawerLayout;
import androidx.navigation.NavController;
import androidx.navigation.Navigation;
import androidx.navigation.ui.AppBarConfiguration;
import androidx.navigation.ui.NavigationUI;

import android.Manifest;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.google.android.material.navigation.NavigationView;
import com.google.firebase.FirebaseApp;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

public class UserLogin extends AppCompatActivity {

    EditText usernameet, passwordet;
    FirebaseDatabase firebaseDatabase;
    DatabaseReference dbref;
    TextView forgetpassword;


        final int MY_PERMISSIONS_REQUEST_READ_CONTACTS=999;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_user_login);
        androidx.appcompat.app.ActionBar actionBar = getSupportActionBar();
        actionBar.setTitle("QuickMart");

        usernameet = findViewById(R.id.usernameet);
        passwordet = findViewById(R.id.passwordet);
        forgetpassword=findViewById(R.id.forgetpassword);

        firebaseDatabase = FirebaseDatabase.getInstance();
        dbref = firebaseDatabase.getReference("users");

        askPermission();
        forgetpassword.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(getApplicationContext(), forget_password.class));
            }
        });


    }
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater menuInflater = new MenuInflater(this);
        menuInflater.inflate(R.menu.login_menu, menu);
        return super.onCreateOptionsMenu(menu);
    }
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();
        switch (id) {
            case R.id.item_catname:
                startActivity(new Intent(getApplicationContext(), userhome.class));
                break;

            case R.id.item_contactus:
                startActivity(new Intent(getApplicationContext(), contact.class));
                break;

            default:
                return super.onOptionsItemSelected(item);
        }
        return true;
    }

    public void askPermission()
    {

        if (checkSelfPermission(Manifest.permission.WRITE_EXTERNAL_STORAGE)
                != PackageManager.PERMISSION_GRANTED) {
            requestPermissions(new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE},
                    MY_PERMISSIONS_REQUEST_READ_CONTACTS);

            // MY_PERMISSIONS_REQUEST_READ_CONTACTS is an
            // app-defined int constant

            return;
        }
        else
        {
            SharedPreferences pref = getApplicationContext().getSharedPreferences("MYPREF", MODE_PRIVATE);
            System.out.println(pref.getString("email",null)+"..............................loginpage");
            if (pref.getString("email", null) != null) {
                finish();
                startActivity(new Intent(getApplicationContext(), userhome.class));
            }
        }
    }

    @Override
    public void onRequestPermissionsResult(int requestCode,
                                           String permissions[], int[] grantResults) {
        switch (requestCode) {
            case MY_PERMISSIONS_REQUEST_READ_CONTACTS: {
                if (grantResults[0] == PackageManager.PERMISSION_GRANTED) {

                    // permission was granted, yay! do the
                    // calendar task you need to do.

                    SharedPreferences pref = getApplicationContext().getSharedPreferences("MYPREF", MODE_PRIVATE);
                    if (pref.getString("email", null) != null) {
                        finish();
                        startActivity(new Intent(getApplicationContext(), userhome.class));
                    }

                } else {

                    // permission denied, boo! Disable the
                    // functionality that depends on this permission.

                    askPermission();
                }
                return;
            }

            // other 'switch' lines to check for other
            // permissions this app might request
        }
    }

    public void loginlogic(View view) {
        final String email = usernameet.getText().toString();
        final String password = passwordet.getText().toString();
        String role="user";
        if (email.isEmpty() || password.isEmpty()) {
            Toast.makeText(getApplicationContext(), "Please Fill values", Toast.LENGTH_LONG).show();
        } else {


//code
            String requestURL = GlobalData.serverip + "login?email=" + email + "&password=" + password + "&role=" + role;
            StringRequest request1 = new StringRequest(Request.Method.GET, requestURL, new Response.Listener<String>() {
                @Override
                public void onResponse(String response) {
                    String res = response.trim();
                    if (res.equals("Fail")) {
                        Toast.makeText(getApplicationContext(), "Invalid Username/Password", Toast.LENGTH_SHORT).show();
                    } else if (res.equals("success")) {

                        Toast.makeText(getApplicationContext(), "Login Successful", Toast.LENGTH_SHORT).show();

                        SharedPreferences pref = getApplicationContext().getSharedPreferences("MYPREF", MODE_PRIVATE);
                        SharedPreferences.Editor editor = pref.edit();
                        editor.putString("email", email);
                        editor.commit();

                        finish();

                        startActivity(new Intent(getApplicationContext(), userhome.class));
                    } else {
                        Toast.makeText(getApplicationContext(), res+"hello", Toast.LENGTH_SHORT).show();
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

    public void gotosignup(View view) {
        startActivity(new Intent(getApplicationContext(), user_signup.class));

    }




}

