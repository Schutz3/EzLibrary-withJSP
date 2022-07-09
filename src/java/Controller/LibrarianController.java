/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Query.LibrarianQuery;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;
/**
 *
 * @author Farhan
 */
public class LibrarianController extends BaseController {
    LibrarianQuery query = new LibrarianQuery();
    
    public ResultSet getByUsername(String username) {
        String sql = this.query.getByUsername;
        
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, username);
        
        return this.getWithParameter(map, sql);
    }
}
