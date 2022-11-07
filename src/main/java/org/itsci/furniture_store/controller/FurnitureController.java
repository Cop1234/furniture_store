package org.itsci.furniture_store.controller;

import org.itsci.furniture_store.model.Furniture;
import org.itsci.furniture_store.model.Store;
import org.itsci.furniture_store.service.CategoryService;
import org.itsci.furniture_store.service.FurnitureService;
import org.itsci.furniture_store.service.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/furniture")
public class FurnitureController {
    private String title = "เฟอร์นิเจอร์";

    @InitBinder
    public void initBinder(WebDataBinder dataBinder) {
        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
        dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
    }

    @Autowired
    private FurnitureService furnitureService;

    @Autowired
    private StoreService storeService;

    @Autowired
    private CategoryService categoryService;

    @GetMapping("/list")
    public String listFurniture(Model model) {
        model.addAttribute("title", "รายการ" + title);
        model.addAttribute("furnitures", furnitureService.getFurnitures());
        return "furniture/list";
    }

    @GetMapping("/create")
    public String showFormForAdd(Model model) {
        model.addAttribute("title", "เพิ่ม" + title);
        model.addAttribute("categories", categoryService.getCategories());
        model.addAttribute("furniture", new Furniture());
        return "furniture/furniture-form";
    }

    @RequestMapping(path="/save", method = RequestMethod.POST)
    public String processForm(@Valid @ModelAttribute("furniture") Furniture furniture,
                              BindingResult bindingResult, Model model){
        if (bindingResult.hasErrors()) {
            model.addAttribute("title", "มีข้อผิดพลาดในการบันทึก" + title);
            model.addAttribute("categories", categoryService.getCategories());
            return "furniture/furniture-form";
        } else {
            Furniture furnitureEntity = furnitureService.getFurniture(furniture.getId());
            if (furnitureEntity != null) {
                furnitureService.updateFurniture(furnitureEntity, furniture);
            } else {
                furnitureService.saveFurniture(furniture);
            }
            return "redirect:/furniture/list";
        }
    }

    @GetMapping("/{id}/update")
    public String showFormForUpdate(@PathVariable ("id") int id, Model model) {
        Furniture furniture = furnitureService.getFurniture(Integer.valueOf(id));
        model.addAttribute("title", "แก้ไข" + title);
        model.addAttribute("categories", categoryService.getCategories());
        model.addAttribute("furniture", furniture);
        return "furniture/furniture-form";
    }

    @GetMapping("/{id}/delete")
    public String deleteFurniture(@PathVariable("id") int id) {
        furnitureService.deleteFurniture(id);
        return "redirect:/furniture/list";
    }

    @GetMapping("/{id}/view-stores")
    public String furnitureViewStore(@PathVariable("id") int id, Model model) {
        Furniture furniture = furnitureService.getFurniture(id);
        model.addAttribute("title", title + " - รายการร้านค้า");
        model.addAttribute("furniture", furniture);
        model.addAttribute("stores", furniture.getStores());
        return "furniture/furniture-view-stores";
    }

    @GetMapping("/{id}/store/add")
    public String showStoreForAdd(@PathVariable("id") int id, Model model) {
        Furniture furniture = furnitureService.getFurniture(id);
        List<Store> stores = storeService.getStoreDoesNotHaveFurniture(id);
        model.addAttribute("title", "เพิ่มร้านค้า");
        model.addAttribute("furniture", furniture);
        model.addAttribute("stores", stores);
        return "furniture/store-list";
    }

    @PostMapping("/{id}/store/add")
    public String addStore(@PathVariable("id") int furnitureId,
                          @RequestParam("store") int storeId) {
        furnitureService.addStoreToFurniture(furnitureId, storeId);
        return "redirect:/furniture/" + furnitureId + "/store/add";
    }

    @GetMapping("/{id}/store/{store}/remove")
    public String furnitureRemoveStore(@PathVariable("id") int furnitureId,
                                    @PathVariable("store") int storeId) {
        furnitureService.removeStoreFromFurniture(furnitureId, storeId);
        return "redirect:/furniture/" + furnitureId + "/view-stores";
    }
}
