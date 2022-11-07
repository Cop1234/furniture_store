package org.itsci.furniture_store.dao;

import org.itsci.furniture_store.model.Furniture;
import org.itsci.furniture_store.model.Store;

import java.util.List;

public interface StoreDao {
    List<Store> getStores();
    void saveStore(Store store);
    Store getStore(int id);
    void deleteStore(int id);

    List<Store> getStoreDoesNotHaveFurniture(int id);
}
