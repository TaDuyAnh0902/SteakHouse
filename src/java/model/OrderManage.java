/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author kitai
 */
public class OrderManage {
    private int id;
    private String dateOrder;
    private OrderLine oid;
    private double totalmoney;

    public OrderManage() {
    }

    public OrderManage(int id, String dateOrder, OrderLine oid, double totalmoney) {
        this.id = id;
        this.dateOrder = dateOrder;
        this.oid = oid;
        this.totalmoney = totalmoney;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDateOrder() {
        return dateOrder;
    }

    public void setDateOrder(String dateOrder) {
        this.dateOrder = dateOrder;
    }

    public OrderLine getOid() {
        return oid;
    }

    public void setOid(OrderLine oid) {
        this.oid = oid;
    }

    public double getTotalmoney() {
        return totalmoney;
    }

    public void setTotalmoney(double totalmoney) {
        this.totalmoney = totalmoney;
    }
}
