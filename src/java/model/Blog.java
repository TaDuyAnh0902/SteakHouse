/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Blog {
    private int id;
    private String title, image, source, date;
    private Account aid;

    public Blog() {
    }

    public Blog(int id, String title, String image, String source, String date, Account aid) {
        this.id = id;
        this.title = title;
        this.image = image;
        this.source = source;
        this.date = date;
        this.aid = aid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Account getAid() {
        return aid;
    }

    public void setAid(Account aid) {
        this.aid = aid;
    }

    
    
}