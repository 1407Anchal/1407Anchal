package com.app.onlineshoppingapp;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.app.onlineshoppingapp.R;
import com.app.onlineshoppingapp.UserLogin;
import com.app.onlineshoppingapp.Users;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

public class ChangePassword extends AppCompatActivity {

    EditText usernameet,oldpasswordet,newpasswordet,confirmpasswordet;
    String email,old_password,new_password,confirmpassword;

    FirebaseDatabase firebaseDatabase;
    DatabaseReference dbref;
    SharedPreferences pref;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_change_password);
        androidx.appcompat.app.ActionBar actionBar = getSupportActionBar();
        actionBar.setTitle("CHANGE PASSWORD");
        usernameet=findViewById(R.id.usernameet);
        oldpasswordet=findViewById(R.id.oldpasswordet);
        newpasswordet=findViewById(R.id.newpasswordet);
        confirmpasswordet=findViewById(R.id.confirmpasswordet);

        pref = getApplicationContext().getSharedPreferences("MYPREF", MODE_PRIVATE);
        String email=pref.getString("email",null);
        usernameet.setText(email);
        usernameet.setEnabled(false);

        firebaseDatabase=FirebaseDatabase.getInstance();
        dbref=firebaseDatabase.getReference("users");

    }

    public void changepasswordlogic(View view) {

       email=usernameet.getText().toString();
        old_password=oldpasswordet.getText().toString();
        new_password=newpasswordet.getText().toString();
        confirmpassword=confirmpasswordet.getText().toString();

        if(old_password.isEmpty()||new_password.isEmpty()||confirmpassword.isEmpty())
        {
            Toast.makeText(getApplicationContext(),"Please enter values",Toast.LENGTH_SHORT).show();
        }
        else if(!new_password.equals(confirmpassword))
        {
            Toast.makeText(getApplicationContext(),"New password must be equal to confirm password",Toast.LENGTH_SHORT).show();
        }
        else
        {
            String requestURL = GlobalData.serverip + "changepassword?email=" + email + "&new_password=" + new_password + "&old_password=" + old_password ;
            StringRequest request1 = new StringRequest(Request.Method.GET, requestURL, new Response.Listener<String>() {
                @Override
                public void onResponse(String response) {
                    String res = response.trim();
                    if (res.equals("Fail")) {
                        Toast.makeText(getApplicationContext(), "Invalid Username/Password", Toast.LENGTH_SHORT).show();
                    } else if (res.equals("success")) {

                        Toast.makeText(getApplicationContext(), "change Successful", Toast.LENGTH_SHORT).show();

                        pref = getApplicationContext().getSharedPreferences("MYPREF", MODE_PRIVATE);
                        SharedPreferences.Editor editor = pref.edit();
                        editor.remove("email");
//
                        editor.commit();

                        finish();

                        startActivity(new Intent(getApplicationContext(), UserLogin.class));
                    } else {
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





//            System.out.println("*********************************obj****************** "+dbref);
//            dbref.child(email).addListenerForSingleValueEvent(new ValueEventListener() {
//                @Override
//                public void onDataChange(@NonNull DataSnapshot dataSnapshot) {
//                    System.out.println("******"+dataSnapshot);
//                    if(dataSnapshot.exists())
//                    {
//                        Users obj=dataSnapshot.getValue(Users.class);
//                        System.out.println("obj****************** "+obj);
//                        if(obj.getPassword().equals(oldpassword))
//                        {
//
//                            dbref.child(email).child("password").setValue(newpassword);
//                            Toast.makeText(getApplicationContext(),"Password Changes Successfully",Toast.LENGTH_SHORT).show();
//                            SharedPreferences pref = getApplicationContext().getSharedPreferences("MYPREF", MODE_PRIVATE);
//                            pref.edit().remove("email");
//                            finish();
//                            startActivity(new Intent(getApplicationContext(), UserLogin.class));
//                        }
//                        else
//                        {
//                            Toast.makeText(getApplicationContext(),"Wrong Old password",Toast.LENGTH_SHORT).show();
//
//                        }
//
//                    }
                }

//                @Override
//                public void onCancelled(@NonNull DatabaseError databaseError) {
//
//                }
//            });


        }


    }

