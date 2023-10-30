/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ma.school.service;

import java.util.List;
import ma.school.beans.Reference;
import ma.school.dao.IDao;
import ma.school.util.HibernateUtil;
import org.hibernate.Session;

/**
 *
 * @author a
 */
public class ReferenceService implements IDao<Reference>{

    @Override
    public void create(Reference o) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.getTransaction().begin();
        session.save(o);
        session.getTransaction().commit();
        session.close();                
    }

    @Override
    public void update(Reference o) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.getTransaction().begin();
        session.update(o);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public void delete(Reference o) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.getTransaction().begin();
        session.delete(o);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public List<Reference> findAll() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.getTransaction().begin();
        List<Reference> etds = session.createQuery("from Reference").list();
        session.getTransaction().commit();
        session.close();
        return etds;

    }

    @Override
    public Reference findById(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.getTransaction().begin();
        Reference e = (Reference) session.get(Reference.class, id);
        session.getTransaction().commit();
        session.close();
        return e;
    }
    
    public Reference findByLibelle(String libelle) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.getTransaction().begin();
        Reference e = (Reference) session.get(Reference.class, libelle);
        session.getTransaction().commit();
        session.close();
        return e;
    }
    
}

