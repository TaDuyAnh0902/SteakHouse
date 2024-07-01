/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ASUS
 */
public class ClientRequest {
    private int id;
    private String content;
    private Table tid;

    public ClientRequest() {
    }

    public ClientRequest(int id, String content, Table tid) {
        this.id = id;
        this.content = content;
        this.tid = tid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Table getTid() {
        return tid;
    }

    public void setTid(Table tid) {
        this.tid = tid;
    }
}
