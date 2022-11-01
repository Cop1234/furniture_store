package org.itsci.furniture_store.service;

import org.itsci.furniture_store.dao.CategoryDao;
import org.itsci.furniture_store.dao.FurnitureDao;
import org.itsci.furniture_store.dao.StoreDao;
import org.itsci.furniture_store.model.Category;
import org.itsci.furniture_store.model.Furniture;
import org.itsci.furniture_store.model.Store;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class FurnitureServiceImpl implements FurnitureService{

    @Autowired
    private FurnitureDao furnitureDao;

    @Autowired
    private CategoryDao categoryDao;

    @Autowired
    private StoreDao storeDao;

    @Override
    @Transactional
    public List<Furniture> getFurnitures() {
        return furnitureDao.getFurnitures();
    }

    @Override
    @Transactional
    public List<Store> getStoreDoesNotHaveFurniture(int id) {
        return furnitureDao.getStoreDoesNotHaveFurniture(id);
    }

    @Override
    @Transactional
    public void saveFurniture(Furniture furniture) {
        Category category = categoryDao.getCategoryByCode(furniture.getCategory().getCode());
        furniture.setCategory(category);
        furnitureDao.saveFurniture(furniture);
    }

    @Override
    @Transactional
    public Furniture getFurniture(int FurnitureId) {
        return furnitureDao.getFurniture(FurnitureId);
    }

    @Override
    @Transactional
    public void deleteFurniture(int FurnitureId) {
        furnitureDao.deleteFurniture(FurnitureId);
    }

    @Override
    @Transactional
    public void updateFurniture(Furniture FurnitureEntity, Furniture furniture) {
        FurnitureEntity.fill(furniture);
        saveFurniture(FurnitureEntity);
    }

    @Override
    @Transactional
    public void addStoreToFurniture(int furnitureId, int storeId) {
        Store store = storeDao.getStore(storeId);
        Furniture furniture = furnitureDao.getFurniture(furnitureId);
        furniture.getStores().add(store);
        furnitureDao.saveFurniture(furniture);
    }

    @Override
    @Transactional
    public void removeStoreFromFurniture(int furnitureId, int storeId) {
        Store store = storeDao.getStore(storeId);
        Furniture furniture = furnitureDao.getFurniture(furnitureId);
        furniture.getStores().remove(store);
        furnitureDao.saveFurniture(furniture);
    }
}
