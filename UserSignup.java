package com.app.onlineshoppingapp;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Bundle;
import android.provider.MediaStore;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.Toast;

import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;
import com.google.firebase.storage.FirebaseStorage;
import com.google.firebase.storage.StorageReference;
import com.google.firebase.storage.UploadTask;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.util.List;

public class UserSignup extends AppCompatActivity {


    Uri GalleryUri;
    EditText usernameet, passwordet, emailet, phonenoet,addresset;

    ImageView photoimv;
    RadioButton male,female;



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
        setContentView(R.layout.activity_user_signup);

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
        pd = new ProgressDialog(UserSignup.this);
        pd.setMessage("Please wait");
        pd.setCancelable(false);



    }











    public void picphotofromgallery(View view) {

        Intent in = new Intent(Intent.ACTION_PICK);
        in.setType("image/*");
        startActivityForResult(in, 101);

    }

    public void signuplogic(View view) {

        username = usernameet.getText().toString();
        password = passwordet.getText().toString();
        email = emailet.getText().toString();
        phoneno = phonenoet.getText().toString();


        if (username.isEmpty() || password.isEmpty() || email.isEmpty() || phoneno.isEmpty()||address.isEmpty()|| gender.isEmpty()) {
            Toast.makeText(getApplicationContext(), "Please Enter Values", Toast.LENGTH_SHORT).show();
        } else if (GalleryUri == null) {
            Toast.makeText(getApplicationContext(), "Please Choose Photo", Toast.LENGTH_SHORT).show();
        } else {
            mainref.child(username).addListenerForSingleValueEvent(new ValueEventListener() {
                @Override
                public void onDataChange(@NonNull DataSnapshot dataSnapshot) {

                    if (dataSnapshot.exists()) {
                        Toast.makeText(getApplicationContext(), "Username Already Exist", Toast.LENGTH_SHORT).show();

                    } else {


                        Thread t = new Thread(new Job1());
                        t.start();

                    }

                }

                @Override
                public void onCancelled(@NonNull DatabaseError databaseError) {

                }
            });
        }


    }




    class Job1 implements Runnable
    {
        public void run()
        {


            runOnUiThread(new Runnable() {
                @Override
                public void run() {
                    pd.show();

                }
            });
            String charset = "UTF-8";
            File uploadFile1 = new File(getPath(GalleryUri));

            Log.d("hello", "photo path : " + uploadFile1.getPath());
            String requestURL = GlobalData.serverip + "signup";
            try {
                MultipartUtility multipart = new MultipartUtility(requestURL, charset);

                multipart.addFormField("username", username);
                multipart.addFormField("password", password);
                multipart.addFormField("email", email);
                multipart.addFormField("phoneno",phoneno);
                multipart.addFormField("gender",gender);

                multipart.addFilePart("photo", uploadFile1);
                multipart.addFormField("address",address);
                List<String> response = multipart.finish();
                Log.d("hello", "SERVER REPLIED:");
                for (String line : response) {
                    final String p = line;
                    Log.d("hello", "response" + response.toString());

                    runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            if (p.equals("Success")) {
                                Toast.makeText(getApplicationContext(), "Successfully Registered..!!", Toast.LENGTH_SHORT).show();
                                SharedPreferences sharedPreferences = getSharedPreferences("mypref", MODE_PRIVATE);
                                SharedPreferences.Editor editor = sharedPreferences.edit();
                                editor.putString("email", email);
                                editor.commit();

                                finish();
                                startActivity(new Intent(getApplicationContext(),UserLogin.class));

                            } else if (p.equals("Username Already Exists")) {
                                Toast.makeText(getApplicationContext(), "Email already registered", Toast.LENGTH_SHORT).show();
                            } else {
                                Toast.makeText(getApplicationContext(), "Signup Failed!!!", Toast.LENGTH_SHORT).show();
                            }

                            runOnUiThread(new Runnable() {
                                @Override
                                public void run() {
                                    pd.show();

                                }
                            });
                        }
                    });
                }


            }
            catch (IOException ex)
            {
                ex.printStackTrace();
                Log.d("hello", ex.getMessage());
            }
        }
    }

    public String getPath(Uri uri) {
        String[] projection = {MediaStore.Images.Media.DATA};
        Cursor cursor = getContentResolver().query(uri, projection, null, null, null);
        if (cursor == null) return null;
        int column_index = cursor.getColumnIndexOrThrow(MediaStore.Images.Media.DATA);
        cursor.moveToFirst();
        String s = cursor.getString(column_index);
        cursor.close();
        Log.d("hello", "s : " + s);
        return s;
    }
    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent backdata) {
        super.onActivityResult(requestCode, resultCode, backdata);

        if (requestCode == 101) {
            if (resultCode == Activity.RESULT_OK) {
                Uri uri = backdata.getData();
                GalleryUri = backdata.getData();
                photoimv.setImageURI(uri);
            }
        }
    }

}
