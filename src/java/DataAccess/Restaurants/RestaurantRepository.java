/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess.Restaurants;

import Hibernate.MakisBarHibernateUtil;
import Entities.Restaurants;
import java.util.List;
import org.hibernate.Session;

/**
 *
 * @author Usuario
 */
public class RestaurantRepository implements IRestaurantRepository{

    @Override
    public List<Restaurants> GetAllRestaurants() {
        Session session = MakisBarHibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        List<Restaurants> restaurants = null;
        restaurants = (List<Restaurants>) session.createQuery("FROM Restaurants").list();
        session.close();
        return restaurants;
    }
    
}
