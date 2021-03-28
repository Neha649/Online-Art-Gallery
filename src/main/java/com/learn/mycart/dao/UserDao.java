
package com.learn.mycart.dao;

import com.learn.mycart.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

/**
 *
 * @author Neha
 */
public class UserDao {
    
    private SessionFactory factory;
    public UserDao(SessionFactory factory)
    {
        this.factory=factory;
        
        //get user 
    }
    public User getUserByEmailAndPassword(String email,String password)
    {
        User user=null;
        try {
            String query="from User where userEmail=: e and userPassword=: p";
            Session session=this.factory.openSession();
            Query q = session.createQuery(query);
            q.setParameter("e", email);
            q.setParameter("p", password);
            user=(User)q.uniqueResult();
            session.close();
        } catch (Exception e) {
        }
        return user;
    }
    
}