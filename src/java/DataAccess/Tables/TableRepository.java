/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess.Tables;

import Hibernate.MakisBarHibernateUtil;
import Entities.Tables;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Usuario
 */
public class TableRepository implements ITableRepository{

    @Override
    public void InsertTable(Tables objTable) {
        Session session = MakisBarHibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(objTable);
        session.getTransaction().commit();
        session.close(); 
    }

    @Override
    public void DeleteTable(List<Integer> tableIds) {
        Session session = MakisBarHibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        for (int i=0;i<tableIds.size();i++)
        {
            Tables table = new Tables();
            table = (Tables) session.get(Tables.class,tableIds.get(i));
            //En caso de Inconsistencia, utilizar el Attended
            table.setAttended(true);
            session.update(table);
        }
        
        session.getTransaction().commit();
        session.close();
    }

    

    @Override
    public Tables GetTableByUsername(String username) {
       Session session = MakisBarHibernateUtil.getSessionFactory().openSession();
       session.beginTransaction();
       Criteria criteria = session.createCriteria(Tables.class);
       Tables table = (Tables) criteria.add(Restrictions.eq("username",username)).uniqueResult();
       session.close();
       return table;
    }

    @Override
    public List<Tables> GetUsersTablesByRestaurant(int restId) {
        //Capturar objetos que llaman a objetos?????
       Session session = MakisBarHibernateUtil.getSessionFactory().openSession();
       session.beginTransaction();
       List<Tables> tables = null;
       tables = (List<Tables>) session.createQuery("FROM Tables t WHERE t.typetables.idTypeTable = 1 and t.attended = false and t.restaurants.idRestaurant =" + String.valueOf(restId)).list();
       session.close();
       return tables; 
    }

  

    
}
