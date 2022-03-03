package com.app.onlineshoppingapp;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

public class contact extends AppCompatActivity {
    TextView feedback;
    EditText nameet, emailet, msget;
    String username, email, msg;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_contact);
        feedback = findViewById(R.id.feedback_textview);
        androidx.appcompat.app.ActionBar actionBar = getSupportActionBar();
        actionBar.setTitle("FEEDBACK");
        nameet = findViewById(R.id.name);
        emailet = findViewById(R.id.email);
        msget = findViewById(R.id.msg);
    }

    public void givemessage(View view) {

        username = nameet.getText().toString();
        email = emailet.getText().toString();
        msg = msget.getText().toString();
        if (email.isEmpty() || username.isEmpty() || msg.isEmpty()) {
            Toast.makeText(getApplicationContext(), "Please Fill All values", Toast.LENGTH_LONG).show();
        } else {
            String requestURL = GlobalData.serverip + "contact?username=" + username + "&email=" + email + "&msg=" + msg;

            StringRequest request1 = new StringRequest(Request.Method.POST, requestURL, new Response.Listener<String>() {
                @Override
                public void onResponse(String response) {

                    String res = response.trim();

                    if (res.equals("success")) {


                        Toast.makeText(getApplicationContext(), "Thankyou for your Feedback!!!!!", Toast.LENGTH_SHORT).show();

                        //startActivity(new Intent(getApplicationContext(), UserLogin.class));
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
}