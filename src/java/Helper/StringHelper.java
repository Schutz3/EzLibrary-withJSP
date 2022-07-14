/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Helper;

import java.util.ArrayList;

/**
 *
 * @author Farhan
 */
public class StringHelper {
    public static String parseLikeQuery(String query) {
        return '%' + query + '%';
    }
    
    public String validateReqTD(String name, String email){
     ArrayList<String> errList = new ArrayList<>();
     String alert = "";
            
            if(!name.matches("[a-z A-Z,.'-]+")){
            errList.add("(-) Invalid Name");
            }
            if (!email.matches("[a-zA-Z0-9.@-]+")){
            errList.add("(-) Invalid Email");
            }
            
           if (!errList.isEmpty()) {
                for (String msg : errList) {
                alert += ("<h2 style='color:yellow;'>" +msg+ " </h2>");
            }
           }  
           return alert;
    }
    public String validateReqB(String name, String email, String book){
     ArrayList<String> errList = new ArrayList<>();
     String alert = "";
            
            if(!name.matches("[a-z A-Z,.'-]+")){
            errList.add("(-) Invalid Name");
            }
            if (!email.matches("[a-zA-Z0-9.@-]+")){
            errList.add("(-) Invalid Email");
            }
            if (!book.matches("[a-z A-Z 0-9 -]+")){
            errList.add("(-) Invalid Book");
            }
            
           if (!errList.isEmpty()) {
                for (String msg : errList) {
                alert += ("<h2 style='color:yellow;'>" +msg+ " </h2>");
            }
           }  
           return alert;
    }
    public String validateEditB(String imglink, String judul, String penulis, String booklink){
     ArrayList<String> errList = new ArrayList<>();
     String alert = "";
            
            if(!judul.matches("[^<>{}]+")){
            errList.add("(-) Invalid Book Title");
            }
            if (!penulis.matches("[^<>{}]+")){
            errList.add("(-) Invalid Writer Name");
            }
            if (!imglink.matches("https:\\/\\/drive\\.google\\.com\\/file\\/d\\/(.*?)\\/view\\?usp\\=sharing")){
            errList.add("(-) Invalid Image Link (Must Google Drive)");
            }
            if (!booklink.matches("https:\\/\\/drive\\.google\\.com\\/file\\/d\\/(.*?)\\/view\\?usp\\=sharing")){
            errList.add("(-) Invalid Book Link (Must Google Drive)");
            }
            
           if (!errList.isEmpty()) {
                for (String msg : errList) {
                alert += ("<h2 style='color:yellow;'>" +msg+ " </h2>");
            }
           }  
           return alert;
    }
    public String validateAddB(String imglink, String judul, String penulis, String booklink){
     ArrayList<String> errList = new ArrayList<>();
     String alert = "";
            
            if(!judul.matches("[^<>{}]+")){
            errList.add("(-) Invalid Book Title");
            }
            if (!penulis.matches("[^<>{}]+")){
            errList.add("(-) Invalid Writer Name");
            }
            if (!imglink.matches("https:\\/\\/drive\\.google\\.com\\/file\\/d\\/(.*?)\\/view\\?usp\\=sharing")){
            errList.add("(-) Invalid Image Link (Must Google Drive)");
            }
            if (!booklink.matches("https:\\/\\/drive\\.google\\.com\\/file\\/d\\/(.*?)\\/view\\?usp\\=sharing")){
            errList.add("(-) Invalid Book Link (Must Google Drive)");
            }
            
           if (!errList.isEmpty()) {
                for (String msg : errList) {
                alert += ("<h2 style='color:yellow;'>" +msg+ " </h2>");
            }
           }  
           return alert;
    }
}
