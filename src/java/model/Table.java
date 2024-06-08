/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Table {

    private int id;
    private String nameTable;
    private Status sid;

    public Table() {
    }

    public Table(int id, String nameTable, Status sid) {
        this.id = id;
        this.nameTable = nameTable;
        this.sid = sid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameTable() {
        return nameTable;
    }

    public void setNameTable(String nameTable) {
        this.nameTable = nameTable;
    }

    public Status getSid() {
        return sid;
    }

    public void setSid(Status sid) {
        this.sid = sid;
    }

}
