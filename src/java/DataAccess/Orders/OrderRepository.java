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
       String query = "select new Entities.OrderProduct (m.name, p.productType, p.quantity, p.orders) from Makis as m, Productsbyorder as p where m.idMaki = p.productId and p.productType='Makis'";
       List<OrderProduct> orders = (List<OrderProduct>)session.createQuery(query).list();
       session.close();
       return orders;
    }

    @Override
    public void AddOrder(Orders objOrder) {
        throw new UnsupportedOperationException("Not supported yet."); 
    }

    @Override
    public void DeleteOrder(int orderId) {
        throw new UnsupportedOperationException("Not supported yet."); 
        
    }

    @Override
    public Orders GetNoSendedOrderByTable(int tableId) {
        Session session = MakisBarHibernateUtil.getSessionFactory().openSession();
       session.beginTransaction();
       String query="from Orders as o where o.tables.idTable = "+tableId +" and o.sended = 0";
       Orders order = (Orders) session.createQuery(query).uniqueResult();
       session.close();
       return order;
    }

    @Override
    public void SetSendedToOrder(int orderId) {
        Session session = MakisBarHibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        Orders order = (Orders) session.get(Orders.class, orderId);
        order.setSended(Byte.valueOf("1"));
        session.update(order);
        session.getTransaction().commit();
        session.close();
    }

    
}
