package org.itsci.furniture_store.controller;

import org.itsci.furniture_store.model.Furniture;
import org.itsci.furniture_store.model.Store;
import org.itsci.furniture_store.service.FurnitureService;
import org.itsci.furniture_store.service.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/store")
public class StoreController {
    private String title = "ร้านเฟอร์นิเจอร์";

    @Autowired
    private StoreService storeService;

    @Autowired
    private FurnitureService furnitureService;

    @GetMapping("/list")
    public String listStore(Model model) {
        model.addAttribute("title", "รายการ" + title);
        model.addAttribute("stores", storeService.getStores());
        return "store/list";
    }

    @GetMapping("/create")
    public String showFormForAdd(Model model) {
        model.addAttribute("title", "เพิ่ม" + title);
        model.addAttribute("store", new Store());
        return "store/store-form";
    }

    @RequestMapping(path="/save", method = RequestMethod.POST)
    public String processForm(@Valid @ModelAttribute("store") Store store,
                              BindingResult bindingResult, Model model){
        if (bindingResult.hasErrors()) {
            model.addAttribute("title", "มีข้อผิดพลาดในการบันทึก" + title);
            return "store/store-form";
        } else {
            Store storeEntity = storeService.getStore(store.getId());
            if (storeEntity != null) {
                storeService.updateStore(storeEntity, store);
            } else {
                storeService.saveStore(store);
            }
            return "redirect:/store/list";
        }
    }

    @GetMapping("/{id}/update")
    public String showFormForUpdate(@PathVariable("id") int id, Model model) {
        Store store = storeService.getStore(Integer.valueOf(id));
        model.addAttribute("title", "แก้ไข" + title);
        model.addAttribute("store", store);
        return "store/store-form";
    }

    @GetMapping("/{id}/delete")
    public String deleteStore(@PathVariable("id") int id) {
        storeService.deleteStore(id);
        return "redirect:/store/list";
    }

    @GetMapping("/{id}/view-furnitures")
    public String StoreViewStore(@PathVariable("id") int id, Model model) {
        Store store = storeService.getStore(id);
        model.addAttribute("title", title + " - รายการร้านค้า");
        model.addAttribute("store", store);
        model.addAttribute("furnitures", store.getFurnitures());
        return "store/store-view-furnitures";
    }

    @GetMapping("/{id}/furniture/add")
    public String showFurnitureForAdd(@PathVariable("id") int id, Model model) {
        Store store = storeService.getStore(id);
        List<Furniture> furnitures = furnitureService.getFurnitureDoesNotHaveStore(id);
        model.addAttribute("title", "เพิมร้านค้า");
        model.addAttribute("store", store);
        model.addAttribute("furnitures", furnitures);
        return "store/furniture-list";
    }

    @PostMapping("/{id}/furniture/add")
    public String addFurniture(@PathVariable("id")  int storeId ,
                             @RequestParam("furniture") int furnitureId ) {
        storeService.addFurnitureToStore(storeId,furnitureId);
        return "redirect:/store/" + storeId+ "/furniture/add";
    }

    @GetMapping("/{id}/furniture/{furniture}/remove")
    public String shopRemoveFurniture(@PathVariable("id") int storeId,
                                    @PathVariable("furniture") int furnitureId) {
        storeService.removeFurnitureFromStore(storeId,furnitureId);
        return "redirect:/store/" + storeId + "/view-furnitures";
    }
}
