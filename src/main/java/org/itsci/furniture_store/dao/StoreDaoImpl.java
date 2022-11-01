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
public class StoreDaoImpl implements StoreDao{

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Store> getStores() {
        Session session = sessionFactory.getCurrentSession();
        Query<Store> query = session.createQuery("from Store", Store.class);
        List<Store> stores = query.getResultList();
        return stores;
    }

    @Override
    public void saveStore(Store store) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(store);
    }

    @Override
    public Store getStore(int id) {
        Session session = sessionFactory.getCurrentSession();
        Store store = session.get(Store.class, id);
        return store;
    }

    @Override
    public void deleteStore(int id) {

    }

    @Override
    public List<Furniture> getFurnitureDoesNotHaveStore(int id) {
        return null;
    }
}
