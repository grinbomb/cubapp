package com.chukuobody.app.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {
	@GetMapping("/")
	public String main(@RequestParam(required = false, defaultValue = "") String name, Model model) {
		model.addAttribute("name", name);
        return "main";
    }
	
	@GetMapping("/calculator")
	public String somecalctest() {
		
        return "calculator";
    }
	
	@PostMapping("/calculator")
	public String calculate(
			@RequestParam String weight,
			@RequestParam String height,
			@RequestParam String age,
			@RequestParam String intensity,
			@RequestParam(defaultValue = "") String sex,
			Model model) 
	{
		
		Map<String, String> errorList = new HashMap<String, String>();
		model.addAttribute("weight", weight);
		model.addAttribute("height", height);
		model.addAttribute("age", age);
		
		if(weight.isEmpty())errorList.put("errorValueWeight", "Weight must not be empty.");
		if(height.isEmpty())errorList.put("errorValueHeight", "Height must not be empty.");
		if(age.isEmpty())errorList.put("errorValueAge", "Age must not be empty.");
		if(intensity.isEmpty())errorList.put("errorValueIntensity", "Intensity must not be empty.");
		if(sex.isEmpty())errorList.put("errorValueGender", "Gender must not be empty.");
		
		if(!errorList.isEmpty()) {
			for(Map.Entry<String, String> entry : errorList.entrySet()) {
				model.addAttribute(entry.getKey(), entry.getValue());
			}
			return "calculator";
		}
		
		int genderConst = 0;
		if(sex.equals("male")) genderConst = 5;
		else if(sex.equals("female")) genderConst = -161;
		
		double intensityConst = 0;
		switch (intensity) {
		case "Min":
			intensityConst = 1.200;
			break;
		case "Low":
			intensityConst = 1.375;
			break;
		case "Medium":
			intensityConst = 1.550;
			break;
		case "Hard":
			intensityConst = 1.725;
			break;
		case "Max":
			intensityConst = 1.900;
			break;
		}
		
		double calories = intensityConst * ( 10*Integer.parseInt(weight) + 6.25*Integer.parseInt(height) - 5*Integer.parseInt(age) + genderConst),
				proteins = (calories*0.30)/4.1,
				fats = (calories*0.22)/9.29,
				carbohydrates = (calories*0.48)/4.1;
		
		int caloriesInt = (int)Math.round(calories);
		
		model.addAttribute("calories", Integer.toString(caloriesInt));
		model.addAttribute("proteins", (int)proteins);
		model.addAttribute("fats", (int)fats);
		model.addAttribute("carbohydrates", (int)carbohydrates);
		
		return "calculator";
	}
}