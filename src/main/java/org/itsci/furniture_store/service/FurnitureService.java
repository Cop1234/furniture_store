package org.itsci.furniture_store.service;

import org.itsci.furniture_store.model.Furniture;
import org.itsci.furniture_store.model.Store;

import java.util.List;

public interface FurnitureService {
    List<Furniture> getFurnitures();
    List<Store> getStoreDoesNotHaveFurniture(int id);
    public void saveFurniture(Furniture furniture);
    Furniture getFurniture(int FurnitureId);
    void deleteFurniture(int FurnitureId);
    void updateFurniture(Furniture FurnitureEntity, Furniture furniture);

    void addStoreToFurniture(int furnitureId, int storeId);
    void removeStoreFromFurniture(int furnitureId, int storeId);
}
