package com.example.Teletype_web.MainController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
public class MainController {
    List<String> items = new ArrayList<>(Arrays.asList("1", "2", "3", "4", "5", "6", "7", "8", "9"));

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("items", items);
        return "home";
    }
}
