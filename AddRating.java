package com.app.onlineshoppingapp;

import androidx.appcompat.app.AppCompatActivity;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

public class AddRating extends AppCompatActivity {

    ImageView starimv1, starimv2, starimv3, starimv4, starimv5;
    EditText commentet;
    int n = 0;
    String pid;

    FirebaseDatabase firebaseDatabase;
    DatabaseReference mainref;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_rating);
        starimv1 = findViewById(R.id.starimv1);
        starimv2 = findViewById(R.id.starimv2);
        starimv3 = findViewById(R.id.starimv3);
        starimv4 = findViewById(R.id.starimv4);
        starimv5 = findViewById(R.id.starimv5);
        commentet = findViewById(R.id.commentet);

        pid = getIntent().getStringExtra("product_id");

        starimv1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                starimv1.setImageResource(R.drawable.ic_star_black_24dp);
                starimv2.setImageResource(R.drawable.ic_star_border_black_24dp);
                starimv3.setImageResource(R.drawable.ic_star_border_black_24dp);
                starimv4.setImageResource(R.drawable.ic_star_border_black_24dp);
                starimv5.setImageResource(R.drawable.ic_star_border_black_24dp);
                n = 1;

            }
        });
        starimv2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                starimv1.setImageResource(R.drawable.ic_star_black_24dp);
                starimv2.setImageResource(R.drawable.ic_star_black_24dp);

                starimv3.setImageResource(R.drawable.ic_star_border_black_24dp);
                starimv4.setImageResource(R.drawable.ic_star_border_black_24dp);
                starimv5.setImageResource(R.drawable.ic_star_border_black_24dp);
                n = 2;

            }
        });

        starimv3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                starimv1.setImageResource(R.drawable.ic_star_black_24dp);
                starimv2.setImageResource(R.drawable.ic_star_black_24dp);
                starimv3.setImageResource(R.drawable.ic_star_black_24dp);
                starimv4.setImageResource(R.drawable.ic_star_border_black_24dp);
                starimv5.setImageResource(R.drawable.ic_star_border_black_24dp);
                n = 3;

            }
        });
        starimv4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                starimv1.setImageResource(R.drawable.ic_star_black_24dp);
                starimv2.setImageResource(R.drawable.ic_star_black_24dp);
                starimv3.setImageResource(R.drawable.ic_star_black_24dp);
                starimv4.setImageResource(R.drawable.ic_star_black_24dp);
                starimv5.setImageResource(R.drawable.ic_star_border_black_24dp);
                n = 4;
            }
        });

        starimv5.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                starimv1.setImageResource(R.drawable.ic_star_black_24dp);
                starimv2.setImageResource(R.drawable.ic_star_black_24dp);
                starimv3.setImageResource(R.drawable.ic_star_black_24dp);
                starimv4.setImageResource(R.drawable.ic_star_black_24dp);
                starimv5.setImageResource(R.drawable.ic_star_black_24dp);

                n = 5;
            }
        });

        firebaseDatabase = FirebaseDatabase.getInstance();
        mainref = firebaseDatabase.getReference("ratings");

    }


    public void addratinglogic(View view) {

        String comment = commentet.getText().toString();

        if (comment.isEmpty()) {
            Toast.makeText(getApplicationContext(), "Please Add comment", Toast.LENGTH_SHORT).show();
        } else if (n == 0) {
            Toast.makeText(getApplicationContext(), "Please select rating", Toast.LENGTH_SHORT).show();
        } else {
            SharedPreferences sharedPreferences = getSharedPreferences("MYPREF", MODE_PRIVATE);
            SharedPreferences.Editor editor = sharedPreferences.edit();

            String username = sharedPreferences.getString("username", "");
            String requestURL = GlobalData.serverip + "addratingandroid?username=" + username + "&pid=" + pid + "&rating=" + n + "&comment=" + comment;
            StringRequest request1 = new StringRequest(Request.Method.GET, requestURL, new Response.Listener<String>() {
                @Override
                public void onResponse(String response) {
                    String res = response.trim();
                    if (res.equals("failed")) {
                        Toast.makeText(getApplicationContext(), "something went wrong", Toast.LENGTH_SHORT).show();
                    } else if (res.equals("success")) {

                        finish();
                        Toast.makeText(getApplicationContext(), "Ratings Added successfuly", Toast.LENGTH_SHORT).show();
                    } else {
//                        Toast.makeText(AddRating.this, res, Toast.LENGTH_SHORT).show();
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
}
