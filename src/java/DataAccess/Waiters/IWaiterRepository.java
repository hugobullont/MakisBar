/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess.Waiters;

import Entities.Waiter;
import java.util.List;

/**
 *
 * @author Usuario
 */
public interface IWaiterRepository {
    Waiter GetWaiterFromTable (int tableid);
    void InsertWaiter (Waiter objWaiter);
    void DeleteWaiter (List<Integer> waiterIds);
    List<Waiter> GetWaitersFromRestaurants(int restId);
}
