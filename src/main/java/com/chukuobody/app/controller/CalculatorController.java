package com.chukuobody.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CalculatorController {
	@GetMapping("/calculator")
	public String calculate(@RequestParam(required = false, defaultValue = "") String weight, @RequestParam(required = false, defaultValue = "") String height, Model model) {
		int sum;
		try {
	        sum = Integer.parseInt(weight)*Integer.parseInt(height);
	    } catch (NumberFormatException e) {
	        model.addAttribute("errorTypeData", "danger");
	        model.addAttribute("errorMessage", "Incorrect! Both fields must be numeric!");
	    	return "calculator";
	    }
		model.addAttribute("sum", sum);
		return "calculator";
	}
}
