/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package qModel;

/**
 *
 * @author Farhan
 */
public class RequestBook {
    private int id;
    private String name;
    private String email;
    private String bookreq;
    
    public void setIdReqBook(int id) {
        this.id = id;
    }

    public int getIdReqBook() {
        return id;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }
    
    public void setBookReq(String bookreq) {
        this.bookreq = bookreq;
    }

    public String getBookReq() {
        return bookreq;
    }
    
}
