package com.dmart.model;

public class Product {
    private int id;
    private String name;
    private double mrp;
    private double dmartPrice;
    private double discount;
    private String imageUrl;
    private String unit;

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public double getMrp() { return mrp; }
    public void setMrp(double mrp) { this.mrp = mrp; }

    public double getDmartPrice() { return dmartPrice; }
    public void setDmartPrice(double dmartPrice) { this.dmartPrice = dmartPrice; }

    public double getDiscount() { return discount; }
    public void setDiscount(double discount) { this.discount = discount; }

    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }

    public String getUnit() { return unit; }
    public void setUnit(String unit) { this.unit = unit; }
}
