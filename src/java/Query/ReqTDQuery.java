/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Query;

/**
 *
 * @author Farhan
 */
public class ReqTDQuery {
    public String get = "SELECT * FROM reqtd";
    
    public String create = "INSERT INTO reqtd (name, email, " + 
            "booktdreq) VALUES (?, ?, ?)";
    
    public String delete = "DELETE FROM reqtd WHERE id = ?";
}
