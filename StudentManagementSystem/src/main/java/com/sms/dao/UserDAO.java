package com.sms.dao;

import com.sms.entity.User;
import com.sms.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

public class UserDAO {

    /**
     * Validates login credentials against the users table.
     * Returns the matched User object, or null if invalid.
     */
    public User validateLogin(String username, String password) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<User> query = session.createQuery(
                    "FROM User WHERE username = :username AND password = :password", User.class);
            query.setParameter("username", username);
            query.setParameter("password", password);
            List<User> results = query.list();
            if (!results.isEmpty()) {
                return results.get(0);
            }
            return null;
        }
    }

    public void addUser(User user) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            session.beginTransaction();
            session.save(user);
            session.getTransaction().commit();
        }
    }
}
