package com.chukuobody.app.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chukuobody.app.domain.User;

@Controller
public class MainController {
	@GetMapping("/")
	public String main(@RequestParam(required = false, defaultValue = "") String name,
			@AuthenticationPrincipal User user,
			Model model) {
		
		if(user!=null) {
		model.addAttribute("name", user.getUsername());
		}else {
		model.addAttribute("name", "dear Guest");
		}
		
        return "main";
    }
	
	@GetMapping("/calculator")
	public String somecalctest(Model model) {
		
		model.addAttribute("activeMaleBox", "");
		model.addAttribute("activeFemaleBox", "");
		model.addAttribute("checkedMaleBox", "");
		model.addAttribute("checkedFemaleBox", "");
		
		model.addAttribute("selectedMin", "");
		model.addAttribute("selectedLow", "");
		model.addAttribute("selectedMedium", "");
		model.addAttribute("selectedHard", "");
		model.addAttribute("selectedMax", "");
		
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
		
		model.addAttribute("selectedMin", "");
		model.addAttribute("selectedLow", "");
		model.addAttribute("selectedMedium", "");
		model.addAttribute("selectedHard", "");
		model.addAttribute("selectedMax", "");
		
		model.addAttribute("activeMaleBox", "");
		model.addAttribute("activeFemaleBox", "");
		model.addAttribute("checkedMaleBox", "");
		model.addAttribute("checkedFemaleBox", "");
		
		int genderConst = 0;
		double intensityConst = 0;
		
		int weightInt,
			heightInt,
			ageInt;
		
		try {
				weightInt = Integer.parseInt(weight);
		}
		catch (NumberFormatException e)
		{
				weightInt = 0;
		}
		try {
				heightInt = Integer.parseInt(height);
		}
		catch (NumberFormatException e)
		{
				heightInt = 0;
		}
		try {
				ageInt = Integer.parseInt(age);
		}
		catch (NumberFormatException e)
		{
				ageInt = 0;
		}
		
		if(weight.isEmpty())
			errorList.put("errorValueWeight", "Weight must not be empty.");
		else if(weightInt>1000||weightInt<=0)
			errorList.put("errorValueWeight", "Weight must not be less than or equal to 0 and cannot exceed 1000.");
		if(height.isEmpty())
			errorList.put("errorValueHeight", "Height must not be empty.");
		else if(heightInt>400||heightInt<=0)
			errorList.put("errorValueHeight", "Height must not be less than or equal to 0 and cannot exceed 400.");
		if(age.isEmpty())
			errorList.put("errorValueAge", "Age must not be empty.");
		else if(ageInt<13||ageInt>80)
			errorList.put("errorValueAge", "Age must not be less than 13 and cannot exceed 80.");
		if(intensity.isEmpty())
			errorList.put("errorValueIntensity", "Intensity must not be empty.");
		else {
			switch (intensity) {
			case "Min":
				model.addAttribute("selectedMin", "selected");
				break;
			case "Low":
				model.addAttribute("selectedLow", "selected");
				break;
			case "Medium":
				model.addAttribute("selectedMedium", "selected");
				break;
			case "Hard":
				model.addAttribute("selectedHard", "selected");
				break;
			case "Max":
				model.addAttribute("selectedMax", "selected");
				break;
			}
		}
		if(sex.isEmpty())
			errorList.put("errorValueGender", "Gender must not be empty.");
		else {
			if(sex.equals("male")) {
				model.addAttribute("activeMaleBox", "active");
				model.addAttribute("checkedMaleBox", "checked");
			}else if(sex.equals("female")) {
				model.addAttribute("activeFemaleBox", "active");
				model.addAttribute("checkedFemaleBox", "checked");
			}
				
		}
		
		
		if(!errorList.isEmpty()) {
			for(Map.Entry<String, String> entry : errorList.entrySet()) {
				model.addAttribute(entry.getKey(), entry.getValue());
			}
			return "calculator";
		}
		
		if(sex.equals("male")) {
			genderConst = 5;
		}
		else if(sex.equals("female")) {
			genderConst = -161;
		}
		
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
		
		double calories = intensityConst * (10*weightInt + 6.25*heightInt - 5*ageInt + genderConst),
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