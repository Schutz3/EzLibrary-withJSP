/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Query.BookQuery;
import java.sql.ResultSet;
import Helper.StringHelper;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;
import qModel.Book;
/**
 *
 * @author Farhan
 */
public class BookController extends BaseController {
    
    BookQuery query = new BookQuery();
    
    
    public ResultSet get() {
        String sql = this.query.get;
        return this.get(sql);
    }
    
    public ResultSet sortAz() {
        String sql = this.query.sortAz;
        return this.get(sql);
    }
    
    public ResultSet sortZa() {
        String sql = this.query.sortZa;
        return this.get(sql);
    }
    
    public ResultSet sortLn() {
        String sql = this.query.sortLn;
        return this.get(sql);
    }
    
    public ResultSet sortNl() {
        String sql = this.query.sortNl;
        return this.get(sql);
    }
    
    public ResultSet getByName(String book) {
        String sql = this.query.getByName;
        
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, StringHelper.parseLikeQuery(book));
        
        return this.getWithParameter(map, sql);
    }
    
    public boolean delete(String id) throws ParseException {
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, id);
        String sql = this.query.delete;
        return this.preparedStatement(map, sql);
    }
    
     public boolean create(Book model) throws ParseException {
        
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, model.getImg());
        map.put(2, model.getJudul());
        map.put(3, model.getPenulis());
        map.put(4, model.getGenre());
        map.put(5, model.getLink());

        
        String sql = this.query.create;
        
        return this.preparedStatement(map, sql);
    }
     
     public ResultSet getById(String id) {
        String sql = this.query.getById;
        
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, id);
        
        return this.getWithParameter(map, sql);
    }
     public boolean update(String id, Book model) throws ParseException {
        
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, model.getImg());
        map.put(2, model.getJudul());
        map.put(3, model.getPenulis());
        map.put(4, model.getGenre());
        map.put(5, model.getLink());
        map.put(6, id);
        
        String sql = this.query.update;
        
        return this.preparedStatement(map, sql);
    }
     
     
      
}
