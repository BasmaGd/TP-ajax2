/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ma.school.service;

import java.util.List;
import ma.school.beans.Marque;
import ma.school.dao.IDao;
import ma.school.util.HibernateUtil;
import org.hibernate.Session;

/**
 *
 * @author a
 */
public class MarqueService implements IDao<Marque>{

    @Override
    public void create(Marque o) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.getTransaction().begin();
        session.save(o);
        session.getTransaction().commit();
        session.close();                
    }

    @Override
    public void update(Marque o) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.getTransaction().begin();
        session.update(o);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public void delete(Marque o) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.getTransaction().begin();
        session.delete(o);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public List<Marque> findAll() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.getTransaction().begin();
        List<Marque> etds = session.createQuery("from Marque").list();
        session.getTransaction().commit();
        session.close();
        return etds;

    }

    @Override
    public Marque findById(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.getTransaction().begin();
        Marque e = (Marque) session.get(Marque.class, id);
        session.getTransaction().commit();
        session.close();
        return e;
    }
    
}
