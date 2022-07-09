/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Query;

/**
 *
 * @author Farhan
 */
public class ReqBookQuery {
    public String get = "SELECT * FROM reqbook";
    
    public String create = "INSERT INTO reqbook (name, email, " + 
            "bookreq) VALUES (?, ?, ?)";
    
    public String delete = "DELETE FROM reqbook WHERE id = ?";
}
