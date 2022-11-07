package org.itsci.furniture_store.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.itsci.furniture_store.model.Furniture;
import org.itsci.furniture_store.model.Store;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class FurnitureDaoImpl implements FurnitureDao{

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Furniture> getFurnitures() {
        Session session = sessionFactory.getCurrentSession();
        Query<Furniture> query = session.createQuery("from Furniture", Furniture.class);
        List<Furniture> furnitures = query.getResultList();
        return furnitures;
    }

    @Override
    public void saveFurniture(Furniture furniture) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(furniture);
    }

    @Override
    public Furniture getFurniture(int furnitureid) {
        Session session = sessionFactory.getCurrentSession();
        Furniture furniture = session.get(Furniture.class, furnitureid);
        return furniture;
    }

    @Override
    public void deleteFurniture(int FurnitureId) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("delete from Furniture where id =:FurnitureId ");
        query.setParameter("FurnitureId", FurnitureId);
        query.executeUpdate();
    }

    @Override
    public List<Furniture> getFurnitureDoesNotHaveStore(int id) {
        Session session = sessionFactory.getCurrentSession();
        Query<Furniture> query = session.createQuery("select s.furnitures from Store s where s.id=:id");
        query.setParameter("id", id);
        List<Furniture> Furniture1 = query.getResultList();
        query = session.createQuery("from Furniture");
        List<Furniture> Furniture2 = query.getResultList();
        Furniture2.removeAll(Furniture1);
        return Furniture2;
    }
}
