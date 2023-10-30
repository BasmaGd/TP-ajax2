
package ma.school.service;

import java.util.List;
import ma.school.beans.Etudiant;
import ma.school.dao.IDao;
import ma.school.util.HibernateUtil;
import org.hibernate.Session;


public class EtudiantService implements IDao<Etudiant>{

    @Override
    public void create(Etudiant o) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.getTransaction().begin();
        session.save(o);
        session.getTransaction().commit();
        session.close();                
    }

    @Override
    public void update(Etudiant o) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.getTransaction().begin();
        session.update(o);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public void delete(Etudiant o) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.getTransaction().begin();
        session.delete(o);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public List<Etudiant> findAll() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.getTransaction().begin();
        List<Etudiant> etds = session.createQuery("from Etudiant").list();
        session.getTransaction().commit();
        session.close();
        return etds;

    }

    @Override
    public Etudiant findById(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.getTransaction().begin();
        Etudiant e = (Etudiant) session.get(Etudiant.class, id);
        session.getTransaction().commit();
        session.close();
        return e;
    }
    
}
