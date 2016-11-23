/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess.Orders;

import Entities.OrderProduct;
import Entities.Orders;
import Entities.*;
import java.util.List;

/**
 *
 * @author Usuario
 */
public interface IOrderRepository {
    public List<OrderProduct> GetMakisOfOrders();
    public List<OrderProduct> GetDrinksOfOrders();
    public List<OrderProduct> GetComplementsOfOrders();
    public void AddOrder(Orders objOrder, List<Productsbyorder> listProducts);
    public Orders GetNoSendedOrderByTable(int tableId);
    public void SetSendedToOrder(int orderId);
    
}
