package org.itsci.furniture_store.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.itsci.furniture_store.model.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CategoryDaoImpl implements CategoryDao {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public List<Category> getCategories() {
        Session session = sessionFactory.getCurrentSession();
        Query<Category> query = session.createQuery("from Category", Category.class);
        List<Category> categories = query.getResultList();
        return categories;
    }

    @Override
    public void saveCategory(Category category) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(category);
    }

    @Override
    public Category getCategory(int id) {
        Session session = sessionFactory.getCurrentSession();
        Category category = session.get(Category.class, id);
        return category;
    }

    @Override
    public void deleteCategory(int id) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("delete from Category where id=:id");
        query.setParameter("id", id);
        query.executeUpdate();
    }

    @Override
    public Category getCategoryByCode(String code) {
        Session session = sessionFactory.getCurrentSession();
        Query<Category> query = session.createQuery("from Category where code=:code", Category.class);
        query.setParameter("code", code);
        Category category = query.getSingleResult();
        return category;
    }
}
