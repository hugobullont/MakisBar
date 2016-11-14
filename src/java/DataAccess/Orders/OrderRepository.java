/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess.Orders;

import Entities.OrderProduct;
import Entities.Orders;
import Entities.Tables;
import Hibernate.MakisBarHibernateUtil;
import java.util.List;
import org.hibernate.Session;

/**
 *
 * @author Usuario
 */
public class OrderRepository implements IOrderRepository{

    @Override
    public List<OrderProduct> GetMakisOfOrders() {
        Session session = MakisBarHibernateUtil.getSessionFactory().openSession();
       session.beginTransaction();
       List<OrderProduct> orders = null;
       String query = "select new Entities.OrderProduct(m.name, p.productType, p.quantity, p.orders.idOrder)from Makis as m, Productsbyorder as p where m.idMaki = p.productId";
       orders = (List<OrderProduct>) session.createQuery(query).list();
       session.close();
       return orders;
    }

    @Override
    public void AddOrder(Orders objOrder) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void DeleteOrder(int orderId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Orders GetNoSendedOrderByTable(int tableId) {
        Session session = MakisBarHibernateUtil.getSessionFactory().openSession();
       session.beginTransaction();
       Orders order = new Orders();
       String query="from Orders as o where o.tables.idTable = "+tableId +" and o.sended = 0";
       order = (Orders) session.createQuery(query);
       session.close();
       return order;
    }

    
}
