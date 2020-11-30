package com.chukuobody.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {
	@GetMapping("/main")
	public String main(@RequestParam(required = false, defaultValue = "") String name, Model model) {
		model.addAttribute("name", name);
        return "main";
    }
	
	@PostMapping("/calculator")
	public String calculate(
			@RequestParam(required = false, defaultValue = "") String weight,
			@RequestParam(required = false, defaultValue = "") String height, Model model) 
	{
		if(weight.isEmpty()||height.isEmpty()) {
			if(weight.isEmpty())model.addAttribute("errorValueWeight", "Incorrect value, weight must not be empty.");
			if(height.isEmpty())model.addAttribute("errorValueHeight", "Incorrect value, height must not be empty.");
			
			return "calculator";
		}
		
		model.addAttribute("sum", Integer.parseInt(weight)*Integer.parseInt(height));
		return "calculator";
	}
}