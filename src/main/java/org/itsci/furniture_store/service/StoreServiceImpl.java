package org.itsci.furniture_store.service;

import org.itsci.furniture_store.dao.FurnitureDao;
import org.itsci.furniture_store.dao.StoreDao;
import org.itsci.furniture_store.model.Furniture;
import org.itsci.furniture_store.model.Store;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class StoreServiceImpl implements StoreService{

    @Autowired
    private StoreDao storeDao;

    @Autowired
    private FurnitureDao furnitureDao;

    @Override
    public List<Furniture> getFurnitureDoesNotHaveStore(int id) {
        return storeDao.getFurnitureDoesNotHaveStore(id);
    }

    @Override
    public List<Store> getStores() {
        return storeDao.getStores();
    }

    @Override
    public void saveStore(Store store) {
        storeDao.saveStore(store);
    }

    @Override
    public Store getStore(int StoreId) {
        return storeDao.getStore(StoreId);
    }

    @Override
    public void deleteStore(int StoreId) {
        storeDao.deleteStore(StoreId);
    }

    @Override
    public void updateStore(Store StoreEntity, Store store) {
        StoreEntity.fill(store);
        storeDao.saveStore(StoreEntity);
    }

    @Override
    public void addFurnitureToStore(int storeId, int furnitureId) {
        Store store = storeDao.getStore(storeId);
        Furniture furniture = furnitureDao.getFurniture(furnitureId);
        furniture.getStores().add(store);
        furnitureDao.saveFurniture(furniture);
    }

    @Override
    public void removeFurnitureFromStore(int furnitureId, int storeId) {
        Store store = storeDao.getStore(storeId);
        Furniture furniture = furnitureDao.getFurniture(furnitureId);
        furniture.getStores().remove(store);
        furnitureDao.saveFurniture(furniture);
    }
}
