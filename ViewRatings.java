package com.app.onlineshoppingapp;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
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

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ViewRatings extends AppCompatActivity {


    List<rating> mylist;
    myadapter myad;
    ListView lv1;

    FirebaseDatabase firebaseDatabase;
    DatabaseReference mainref;
    TextView tvnorating;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_view_ratings);
        Intent incomingintent = getIntent();

        String pid=incomingintent.getStringExtra("pid");

        tvnorating=findViewById(R.id.tvnorating);


        mylist = new ArrayList<>();
        myad = new myadapter();

        lv1 = findViewById(R.id.lv1);
        lv1.setAdapter(myad);

        firebaseDatabase = FirebaseDatabase.getInstance();
        mainref = firebaseDatabase.getReference("ratings");
        tvnorating.setVisibility(View.GONE);
        String url = GlobalData.serverip +  "fetchratings?product_id="+pid;
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

                mylist = Arrays.asList(gson.fromJson(arr.toString(), rating[].class));

                myad.notifyDataSetChanged();

                if(mylist.size()==0)
                {
                    tvnorating.setVisibility(View.VISIBLE);
                }
            }


        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(getApplicationContext(), error.toString(), Toast.LENGTH_SHORT).show();
            }
        });

        Volley.newRequestQueue(this).add(request1);


    }

    // Inner Class //
    class myadapter extends BaseAdapter
    {
        @Override
        public int getCount() {
            return mylist.size();
        }

        @Override
        public Object getItem(int i) {
            return mylist.get(i);
        }

        @Override
        public long getItemId(int i) {
            return i*100;
        }

        @Override
        public View getView(int i, View customview, ViewGroup parent)
        {
            LayoutInflater inflater = LayoutInflater.from(parent.getContext());
            customview = inflater.inflate(R.layout.ratingsinglerow, parent, false);


            TextView tvcomment,tvusername;
            ImageView starimv1,starimv2,starimv3,starimv4,starimv5;

            Button btnviewdetail;
            starimv1 = customview.findViewById(R.id.starimv1);
            starimv2 = customview.findViewById(R.id.starimv2);
            starimv3 = customview.findViewById(R.id.starimv3);
            starimv4 = customview.findViewById(R.id.starimv4);
            starimv5 = customview.findViewById(R.id.starimv5);
            tvcomment = customview.findViewById(R.id.tvcomment);
            tvusername = customview.findViewById(R.id.tvusername);


            rating ratingobj = mylist.get(i);


            tvcomment.setText(ratingobj.getReview());
            tvusername.setText("Commented By: "+ratingobj.getUsername());

            int rating=ratingobj.getRating();

            if(rating==1)
            {
                starimv1.setImageResource(R.drawable.ic_star_black_24dp);
                starimv2.setImageResource(R.drawable.ic_star_border_black_24dp);
                starimv3.setImageResource(R.drawable.ic_star_border_black_24dp);
                starimv4.setImageResource(R.drawable.ic_star_border_black_24dp);
                starimv5.setImageResource(R.drawable.ic_star_border_black_24dp);
            }
            else if(rating==2)
            {
                starimv1.setImageResource(R.drawable.ic_star_black_24dp);
                starimv2.setImageResource(R.drawable.ic_star_black_24dp);

                starimv3.setImageResource(R.drawable.ic_star_border_black_24dp);
                starimv4.setImageResource(R.drawable.ic_star_border_black_24dp);
                starimv5.setImageResource(R.drawable.ic_star_border_black_24dp);
            }
            else if(rating==3)
            {
                starimv1.setImageResource(R.drawable.ic_star_black_24dp);
                starimv2.setImageResource(R.drawable.ic_star_black_24dp);
                starimv3.setImageResource(R.drawable.ic_star_black_24dp);
                starimv4.setImageResource(R.drawable.ic_star_border_black_24dp);
                starimv5.setImageResource(R.drawable.ic_star_border_black_24dp);
            }
            else if(rating==4)
            {
                starimv1.setImageResource(R.drawable.ic_star_black_24dp);
                starimv2.setImageResource(R.drawable.ic_star_black_24dp);
                starimv3.setImageResource(R.drawable.ic_star_black_24dp);
                starimv4.setImageResource(R.drawable.ic_star_black_24dp);
                starimv5.setImageResource(R.drawable.ic_star_border_black_24dp);
            }
            else
            {
                starimv1.setImageResource(R.drawable.ic_star_black_24dp);
                starimv2.setImageResource(R.drawable.ic_star_black_24dp);
                starimv3.setImageResource(R.drawable.ic_star_black_24dp);
                starimv4.setImageResource(R.drawable.ic_star_black_24dp);
                starimv5.setImageResource(R.drawable.ic_star_black_24dp);
            }



            return customview;

        }
    }


}
