/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ASUS
 */
public class PaymentRequest {
    private int id;
    private int type;
    private Table tid;

    public PaymentRequest() {
    }

    public PaymentRequest(int id, int type, Table tid) {
        this.id = id;
        this.type = type;
        this.tid = tid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public Table getTid() {
        return tid;
    }

    public void setTid(Table tid) {
        this.tid = tid;
    }
}
