package com.chukuobody.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MenuController {

	@GetMapping("/selectedmenu")
	public String main(Model model) {
		
        return "selectedmenu";
    }
	
}
