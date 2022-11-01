package org.itsci.furniture_store.controller;

import org.itsci.furniture_store.service.CategoryService;
import org.itsci.furniture_store.service.FurnitureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

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
    private CategoryService categoryService;

    
}
