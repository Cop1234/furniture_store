package org.itsci.furniture_store.service;

import org.itsci.furniture_store.dao.FurnitureDao;
import org.itsci.furniture_store.dao.StoreDao;
import org.itsci.furniture_store.model.Furniture;
import org.itsci.furniture_store.model.Store;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class StoreServiceImpl implements StoreService{

    @Autowired
    private StoreDao storeDao;

    @Autowired
    private FurnitureDao furnitureDao;

    @Override
    @Transactional
    public List<Store> getStoreDoesNotHaveFurniture(int id) {
        return storeDao.getStoreDoesNotHaveFurniture(id);
    }

    @Override
    @Transactional
    public List<Store> getStores() {
        return storeDao.getStores();
    }

    @Override
    @Transactional
    public void saveStore(Store store) {
        storeDao.saveStore(store);
    }

    @Override
    @Transactional
    public Store getStore(int StoreId) {
        return storeDao.getStore(StoreId);
    }

    @Override
    @Transactional
    public void deleteStore(int StoreId) {
        storeDao.deleteStore(StoreId);
    }

    @Override
    @Transactional
    public void updateStore(Store StoreEntity, Store store) {
        StoreEntity.fill(store);
        storeDao.saveStore(StoreEntity);
    }

    @Override
    @Transactional
    public void addFurnitureToStore(int storeId, int furnitureId) {
        Store store = storeDao.getStore(storeId);
        Furniture furniture = furnitureDao.getFurniture(furnitureId);
        furniture.getStores().add(store);
        furnitureDao.saveFurniture(furniture);
    }

    @Override
    @Transactional
    public void removeFurnitureFromStore(int furnitureId, int storeId) {
        Store store = storeDao.getStore(storeId);
        Furniture furniture = furnitureDao.getFurniture(furnitureId);
        furniture.getStores().remove(store);
        furnitureDao.saveFurniture(furniture);
    }
}
