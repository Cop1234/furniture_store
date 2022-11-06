package org.itsci.furniture_store.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
    @GetMapping("/login")
    public String loginPage(Model model) {
        model.addAttribute("title", "ลงชือเข้าสู่รูะบบ");
        return "login-page";
    }
    @GetMapping("/access-denied")
    public String showAccessDenied(Model model) {
        model.addAttribute("title", "Access Denied");
        return "access-denied";
    }
}
