/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess.Orders;

import DataAccess.Products.IProductsRepository;
import DataAccess.Products.ProductsRepository;
import Entities.OrderProduct;
import Entities.Orders;
import Entities.Tables;
import Entities.Productsbyorder;
import Entities.RelRestCmp;
import Entities.RelRestDrk;
import Entities.RelRestMak;
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
    public void AddOrder(Orders objOrder, List<Productsbyorder> listProducts) {
        IProductsRepository productRepo = new ProductsRepository();
        Session session = MakisBarHibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(objOrder);
        session.getTransaction().commit();
        session.close(); 
        for(Productsbyorder product : listProducts)
        {
            Session session2 = MakisBarHibernateUtil.getSessionFactory().openSession();
            session2.beginTransaction();
            switch(product.getProductType())
            {
                case "Makis": 
                    RelRestMak maki = productRepo.GetRelMakiByRestaurantMakiId(objOrder.getTables().getRestaurants().getIdRestaurant(), product.getProductId());
                    int stockM = maki.getStock();
                    stockM = stockM - product.getQuantity();
                    maki.setStock(stockM);
                    session2.update(maki);
                    break;
                case "Drinks": 
                    RelRestDrk drink = productRepo.GetRelDrinkByRestaurantDrinkId(objOrder.getTables().getRestaurants().getIdRestaurant(), product.getProductId());
                    int stockD = drink.getStock();
                    stockD = stockD - product.getQuantity();
                    drink.setStock(stockD);
                    session2.update(drink);
                    break;
                case "Complements":
                    RelRestCmp cmp = productRepo.GetRelCmpByRestaurantCompId(objOrder.getTables().getRestaurants().getIdRestaurant(), product.getProductId());
                    int stockC = cmp.getStock();
                    stockC = stockC - product.getQuantity();
                    cmp.setStock(stockC);
                    session2.update(cmp);
                    break;
            }
            product.setOrders(objOrder);
            session2.save(product);
            session2.getTransaction().commit();
            session2.close();
        }
        
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

    @Override
    public List<OrderProduct> GetDrinksOfOrders() {
       Session session = MakisBarHibernateUtil.getSessionFactory().openSession();
       session.beginTransaction();
       String query = "select new Entities.OrderProduct (d.name, p.productType, p.quantity, p.orders) from Drinks as d, Productsbyorder as p where d.idDrink = p.productId and p.productType='Drinks'";
       List<OrderProduct> orders = (List<OrderProduct>)session.createQuery(query).list();
       session.close();
       return orders;
    }

    @Override
    public List<OrderProduct> GetComplementsOfOrders() {
        Session session = MakisBarHibernateUtil.getSessionFactory().openSession();
       session.beginTransaction();
       String query = "select new Entities.OrderProduct (c.name, p.productType, p.quantity, p.orders) from Complements as c, Productsbyorder as p where c.idComplement = p.productId and p.productType='Complements'";
       List<OrderProduct> orders = (List<OrderProduct>)session.createQuery(query).list();
       session.close();
       return orders;
    }

    
}
