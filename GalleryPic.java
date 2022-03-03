package com.app.onlineshoppingapp;

import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.DisplayMetrics;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import com.squareup.picasso.Picasso;

public class GalleryPic extends AppCompatActivity {

    ImageView imvgallerypic;
    TextView captiontv;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        DisplayMetrics metrics = getResources().getDisplayMetrics();
        int screenWidth = (int) (metrics.widthPixels * 0.80);
        int screenHeight = (int) (metrics.heightPixels * 0.80);
        setContentView(R.layout.activity_gallery_pic);

        captiontv = findViewById(R.id.captiontv);
        getWindow().setLayout(screenWidth, ActionBar.LayoutParams.WRAP_CONTENT);

        String path = getIntent().getStringExtra("path");
        String caption = getIntent().getStringExtra("caption");

        imvgallerypic = findViewById(R.id.imvgallerypic);
        Picasso.get().load(GlobalData.serverip + path).into(imvgallerypic);

        captiontv.setText(caption + "");
    }


    public void closeactivity(View view) {
        finish();
    }
}
