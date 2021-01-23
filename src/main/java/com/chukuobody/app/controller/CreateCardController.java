package com.chukuobody.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CreateCardController {
	
	@GetMapping("/createcard")
	public String main() {
		
        return "createcard";
    }
	
	@PostMapping("/createcard")
	public String calculate(
			@RequestParam String weight,
			@RequestParam String height,
			@RequestParam String age,
			@RequestParam String intensity,
			@RequestParam(defaultValue = "") String sex,
			Model model) 
	{
		
		
		return "createcard";
	}
	
}
