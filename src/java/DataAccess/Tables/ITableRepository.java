/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess.Tables;

import Entities.Tables;
import java.util.List;

/**
 *
 * @author Usuario
 */
public interface ITableRepository {
    void InsertTable (Tables objTable);
    void DeleteTable (List<Integer> tableIds);
    List<Tables> GetUsersTablesByRestaurant (int restId);
    Tables GetTableByUsername(String username);
}
