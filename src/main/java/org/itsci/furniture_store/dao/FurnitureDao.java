package org.itsci.furniture_store.dao;

import org.itsci.furniture_store.model.Furniture;
import org.itsci.furniture_store.model.Store;

import java.util.List;

public interface FurnitureDao {
    List<Furniture> getFurnitures();
    void saveFurniture(Furniture furniture);

    Furniture getFurniture(int id);

    void deleteFurniture(int id);
    List<Store> getStoreDoesNotHaveFurniture(int id);
}
