/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class OrderLine {
    private int id;
    private Product pid;
    private int quantity;
    private Account aid;
    private String dateOrderline;
    private Table tid;
    private Status sid;
    public OrderLine() {
    }

    public OrderLine(int id, Product pid, int quantity, Account aid, String dateOrderline, Table tid, Status sid) {
        this.id = id;
        this.pid = pid;
        this.quantity = quantity;
        this.aid = aid;
        this.dateOrderline = dateOrderline;
        this.tid = tid;
        this.sid = sid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Product getPid() {
        return pid;
    }

    public void setPid(Product pid) {
        this.pid = pid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Account getAid() {
        return aid;
    }

    public void setAid(Account aid) {
        this.aid = aid;
    }

    public String getDateOrderline() {
        return dateOrderline;
    }

    public void setDateOrderline(String dateOrderline) {
        this.dateOrderline = dateOrderline;
    }

    public Table getTid() {
        return tid;
    }

    public void setTid(Table tid) {
        this.tid = tid;
    }

    public Status getSid() {
        return sid;
    }

    public void setSid(Status sid) {
        this.sid = sid;
    }

    
    
    
}