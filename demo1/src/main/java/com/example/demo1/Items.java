package com.example.demo1;

import com.gargoylesoftware.htmlunit.html.HtmlElement;
import com.gargoylesoftware.htmlunit.html.HtmlImage;

import java.sql.Date;
import java.time.LocalDate;

public class Items {
    private String img;
    private String price;
    private String name;
    private String url;
    private Date date;


    public Items(String img, String price, String name, String url, Date date) {
        this.img = img;
        this.price = price;
        this.name = name;
        this.url = url;
        this.date = date;
    }
    public Items(String img, String price, String name) {
        this.img = img;
        this.price = price;
        this.name = name;
    }
    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
