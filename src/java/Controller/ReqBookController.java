/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;
import Query.ReqBookQuery;
import java.sql.ResultSet;
import java.text.ParseException;
import qModel.RequestBook;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Farhan
 */
public class ReqBookController extends BaseController {
    ReqBookQuery query = new ReqBookQuery();
    
    public ResultSet get() {
        String sql = this.query.get;
        return this.get(sql);
    }
    
        public boolean create(RequestBook model) throws ParseException {
        
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, model.getName());
        map.put(2, model.getEmail());
        map.put(3, model.getBookReq());

        
        String sql = this.query.create;
        
        return this.preparedStatement(map, sql);
    }
    public boolean delete(String id) throws ParseException {
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, id);
        String sql = this.query.delete;
        return this.preparedStatement(map, sql);
    }
    
    
}
