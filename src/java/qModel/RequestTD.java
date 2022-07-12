/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package qModel;

/**
 *
 * @author Farhan
 */
public class RequestTD {
    private int id;
    private String name;
    private String email;
    private String booktdreq;
    
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
    
    public void setBookReqTD(String booktdreq) {
        this.booktdreq = booktdreq;
    }

    public String getBookReqTD() {
        return booktdreq;
    }
    
}
