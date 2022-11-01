package org.itsci.furniture_store.service;

import org.itsci.furniture_store.model.Furniture;
import org.itsci.furniture_store.model.Store;

import java.util.List;

public interface StoreService {
    List<Store> getStores();
    List<Furniture> getFurnitureDoesNotHaveStore(int id);
    public void saveStore(Store store);

    Store getStore(int StoreId);
    void deleteStore(int StoreId);
    void updateStore(Store StoreEntity, Store store);

    void addFurnitureToStore( int storeId,int furnitureId);
    void removeFurnitureFromStore(int furnitureId,int storeId );
}
