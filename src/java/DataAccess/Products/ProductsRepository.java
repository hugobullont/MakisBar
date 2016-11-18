/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess.Products;

import Entities.Makis;
import Entities.RelRestMak;
import Entities.Restaurants;
import Hibernate.MakisBarHibernateUtil;
import java.util.List;
import org.hibernate.Session;

/**
 *
 * @author Usuario
 */
public class ProductsRepository implements IProductsRepository{

    @Override
    public List<RelRestMak> GetMakisByRestaurant(int idRest) {
        Session session = MakisBarHibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        List<RelRestMak> makis = null;
        makis = (List<RelRestMak>) session.createQuery("FROM RelRestMak as rel where rel.restaurants.idRestaurant ="+ idRest).list();
        session.close();
        return makis;
    }
    
}
