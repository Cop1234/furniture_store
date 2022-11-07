package org.itsci.furniture_store.controller;

import org.itsci.furniture_store.model.Furniture;
import org.itsci.furniture_store.service.CategoryService;
import org.itsci.furniture_store.service.FurnitureService;
import org.itsci.furniture_store.service.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member-show")
public class ShowController {
    private String title = "เฟอร์นิเจอร์";

    @InitBinder
    public void initBinder(WebDataBinder dataBinder) {
        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
        dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
    }

    @Autowired
    private FurnitureService furnitureService;

    @GetMapping("/list")
    public String listFurniture(Model model) {
        model.addAttribute("title", "รายการ" + title);
        model.addAttribute("furnitures", furnitureService.getFurnitures());
        return "member-show/list";
    }

    @GetMapping("/{id}/result")
    public String showResult(@PathVariable("id") int id, Model model) {
        Furniture furniture = furnitureService.getFurniture(Integer.valueOf(id));
        model.addAttribute("title", "ผลการซื้อ" + title);
        model.addAttribute("furniture", furniture);
        return "member-show/result";
    }


}
