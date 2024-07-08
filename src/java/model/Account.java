/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Account {

    private String name, username, email, passWord, phoneNumber, code;
    private int role;
    private Status sid;

    public Account() {
    }

    public Account(String name, String username, String email, String passWord, String phoneNumber, String code, int role, Status sid) {
        this.name = name;
        this.username = username;
        this.email = email;
        this.passWord = passWord;
        this.phoneNumber = phoneNumber;
        this.code = code;
        this.role = role;
        this.sid = sid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public Status getSid() {
        return sid;
    }

    public void setSid(Status sid) {
        this.sid = sid;
    }
}
