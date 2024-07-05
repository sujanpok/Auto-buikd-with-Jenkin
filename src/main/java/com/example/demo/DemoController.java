package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DemoController {
	//test
    @GetMapping("/hello")
    public String hello(Model model) {
        model.addAttribute("message", "Hello, World! , i Am  auto deploying with jenkin");
        return "hello";
    }
}
