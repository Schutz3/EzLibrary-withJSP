/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package qModel;

/**
 *
 * @author Farhan
 */
public class Book {
    private int id;
    private String img;
    private String judul;
    private String penulis;
    private String genre;
    private String link;
    
    public void setIdBook(int id) {
        this.id = id;
    }

    public int getIdBook() {
        return id;
    }
    
    public void setImg(String img) {
        this.img = img;
    }

    public String getImg() {
        return img;
    }
    
    public void setJudul(String judul) {
        this.judul = judul;
    }

    public String getJudul() {
        return judul;
    }
    
    public void setPenulis(String penulis) {
        this.penulis = penulis;
    }

    public String getPenulis() {
        return penulis;
    }
    
    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getGenre() {
        return genre;
    }
    
    public void setLink(String link) {
        this.link = link;
    }

    public String getLink() {
        return link;
    }
    
    
}
