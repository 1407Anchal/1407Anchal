package com.app.onlineshoppingapp;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.provider.MediaStore;
import android.util.Log;
import android.view.View;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.RadioButton;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.storage.FirebaseStorage;
import com.google.firebase.storage.StorageReference;

import java.io.File;
import java.io.IOException;
import java.util.List;

public class user_signup extends AppCompatActivity {

    Uri GalleryUri;
    EditText usernameet, passwordet, emailet, phonenoet,addresset;

    ImageView photoimv;
    RadioButton male,female;

TextView usersignup;

    ProgressDialog pd;


    FirebaseStorage firebaseStorage;
    StorageReference mainref_storage;
    FirebaseDatabase firebaseDatabase;
    DatabaseReference mainref;

    String username, password, email, phoneno,address;
    String gender;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_user_signup2);
        usersignup=findViewById(R.id.usersignup);

        usernameet = findViewById(R.id.usernameet);
        passwordet = findViewById(R.id.passwordet);

        emailet = findViewById(R.id.emailet);
        phonenoet = findViewById(R.id.phonenoet);
        addresset=findViewById(R.id.address);
        male=findViewById(R.id.rb1);
        female=findViewById(R.id.rb2);
        male.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton compoundButton, boolean isChecked) {
                if(isChecked){
                    gender="male";
                }
            }
        });
        female.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton compoundButton, boolean isChecked) {
                if(isChecked){
                    gender="female";
                }
            }
        });

        photoimv = findViewById(R.id.photoimv);






        firebaseStorage = FirebaseStorage.getInstance();
        mainref_storage = firebaseStorage.getReference("users");

        firebaseDatabase = FirebaseDatabase.getInstance();
        mainref = firebaseDatabase.getReference("users");
        pd = new ProgressDialog(user_signup.this);
        pd.setMessage("Please wait");
        pd.setCancelable(false);



    }




    public void signup(View view) {
        username=usernameet.getText().toString();
        password=passwordet.getText().toString();
        email=emailet.getText().toString();
        address=addresset.getText().toString();
        phoneno=phonenoet.getText().toString();

        if (username.isEmpty() || password.isEmpty() || email.isEmpty() || phoneno.isEmpty() || address.isEmpty() || gender.isEmpty()) {
            Toast.makeText(getApplicationContext(), "Please Enter Values", Toast.LENGTH_SHORT).show();
       } //else if (GalleryUri == null) {
//            Toast.makeText(getApplicationContext(), "Please Choose Photo", Toast.LENGTH_SHORT).show();
//      }
         else {


            String requestURL = GlobalData.serverip + "signup?email=" + email + "&phoneno=" + phoneno + "&gender=" + gender + "&username=" + username + "&password=" + password + "&address=" + address;
            StringRequest request1 = new StringRequest(Request.Method.POST, requestURL, new Response.Listener<String>() {
                @Override
                public void onResponse(String response) {
                    String res = response.trim();
                    if (res.equals("Fail")) {
                        Toast.makeText(getApplicationContext(), "Invalid Username/Password", Toast.LENGTH_SHORT).show();
                    } else if (res.equals("success")) {

                        Toast.makeText(getApplicationContext(), "SignUp Successful", Toast.LENGTH_SHORT).show();



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
        }












    }
//        else{
//            String charset = "UTF-8";
//            File uploadFile1 = new File(getPath(GalleryUri));
//
//            Log.d("hello", "photo path : " + uploadFile1.getPath());
//            String requestURL = GlobalData.serverip + "signup";
//            try {
//                MultipartUtility multipart = new MultipartUtility(requestURL, charset);
//
//                multipart.addFormField("username", username);
//                multipart.addFormField("password", password);
//                multipart.addFormField("email", email);
//                multipart.addFormField("phoneno",phoneno);
//
//                multipart.addFilePart("photo", uploadFile1);
//                multipart.addFormField("address",address);
//                List<String> response = multipart.finish();
//                Log.d("hello", "SERVER REPLIED:");
//                for (String line : response) {
//                    final String p = line;
//                    Log.d("hello", "response" + response.toString());
//
//                    runOnUiThread(new Runnable() {
//                        @Override
//                        public void run() {
//                            if (p.equals("Success")) {
//                                Toast.makeText(getApplicationContext(), "Successfully Registered..!!", Toast.LENGTH_SHORT).show();
//                                SharedPreferences sharedPreferences = getSharedPreferences("mypref", MODE_PRIVATE);
//                                SharedPreferences.Editor editor = sharedPreferences.edit();
//                                editor.putString("email", email);
//                                editor.commit();
//
//                                finish();
//                                startActivity(new Intent(getApplicationContext(),UserLogin.class));
//
//                            } else if (p.equals("Username Already Exists")) {
//                                Toast.makeText(getApplicationContext(), "Email already registered", Toast.LENGTH_SHORT).show();
//                            } else {
//                                Toast.makeText(getApplicationContext(), "Signup Failed!!!", Toast.LENGTH_SHORT).show();
//                            }
//
//                            runOnUiThread(new Runnable() {
//                                @Override
//                                public void run() {
//                                    pd.show();
//
//                                }
//                            });
//                        }
//                    });
//                }
//
//
//            }
//            catch (IOException ex)
//            {
//                ex.printStackTrace();
//                Log.d("hello", ex.getMessage());
//            }
//        }

//    public String getPath(Uri uri) {
//        String[] projection = {MediaStore.Images.Media.DATA};
//        Cursor cursor = getContentResolver().query(uri, projection, null, null, null);
//        if (cursor == null) return null;
//        int column_index = cursor.getColumnIndexOrThrow(MediaStore.Images.Media.DATA);
//        cursor.moveToFirst();
//        String s = cursor.getString(column_index);
//        cursor.close();
//        Log.d("hello", "s : " + s);
//        return s;
//    }
    //method of button which helps to choose the photo from mobile
//    public void picphotofromgallery(View view) {
//
//        Intent in = new Intent(Intent.ACTION_PICK);
//        in.setType("image/*");
//        startActivityForResult(in, 101);
//
//    }
    // helps to display image on imageview
//    @Override
//    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent backdata) {
//        super.onActivityResult(requestCode, resultCode, backdata);
//
//        if (requestCode == 101) {
//            if (resultCode == Activity.RESULT_OK) {
//                Uri uri = backdata.getData();
//                GalleryUri = backdata.getData();
//                photoimv.setImageURI(uri);
//            }
//        }
//    }
}