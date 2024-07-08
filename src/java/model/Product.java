/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Product {
    private String id, name;
    private int quantity;
    private double price;
    private String dateproduct;
    private String describe, image;
    private Category category;
    private Status sid;
    private int quantityWaitting;
    public Product() {
    }

    public Product(String id, String name, int quantity, double price, String dateproduct, String describe, String image, Category category, Status sid, int quantityWaitting) {
        this.id = id;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.dateproduct = dateproduct;
        this.describe = describe;
        this.image = image;
        this.category = category;
        this.sid = sid;
        this.quantityWaitting = quantityWaitting;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDateproduct() {
        return dateproduct;
    }

    public void setDateproduct(String dateproduct) {
        this.dateproduct = dateproduct;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Status getSid() {
        return sid;
    }

    public void setSid(Status sid) {
        this.sid = sid;
    }

    public int getQuantityWaitting() {
        return quantityWaitting;
    }

    public void setQuantityWaitting(int quantityWaitting) {
        this.quantityWaitting = quantityWaitting;
    }
}
