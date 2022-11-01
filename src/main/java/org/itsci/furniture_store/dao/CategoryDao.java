package org.itsci.furniture_store.dao;

import org.itsci.furniture_store.model.Category;

import java.util.List;

public interface CategoryDao {

    List<Category> getCategories();

    void saveCategory(Category category);

    Category getCategory(int id);

    void deleteCategory(int id);

    Category getCategoryByCode(String code);
}
