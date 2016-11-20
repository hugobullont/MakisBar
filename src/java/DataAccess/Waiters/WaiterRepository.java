/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess.Waiters;

import Entities.Tables;
import Entities.Waiter;
import Hibernate.MakisBarHibernateUtil;
import java.util.List;
import org.hibernate.Session;

/**
 *
 * @author Usuario
 */
public class WaiterRepository implements IWaiterRepository {

    @Override
    public Waiter GetWaiterFromTable(int tableid) {
        Tables table = new Tables();
        Session session = MakisBarHibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        table = (Tables) session.get(Tables.class, tableid);
        session.close();
        Waiter waiter = table.getWaiter();
        return waiter;
    }

    @Override
    public void InsertWaiter(Waiter objWaiter) {
        Session session = MakisBarHibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(objWaiter);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public void DeleteWaiter(List<Integer> waiterIds) {
        Session session = MakisBarHibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        for (int i=0;i<waiterIds.size();i++)
        {
            Waiter waiter = (Waiter) session.get(Waiter.class, waiterIds.get(i));
            waiter.setActive(Byte.valueOf("0"));
            session.update(waiter);
        }
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public List<Waiter> GetWaitersFromRestaurants(int restId) {
        Session session = MakisBarHibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        List<Waiter> waiters = null;
        waiters = session.createQuery("FROM Waiter w WHERE w.active = 1 and w.restaurants.idRestaurant =" + String.valueOf(restId)).list();
        session.close();
        return waiters;
    }
    
}
