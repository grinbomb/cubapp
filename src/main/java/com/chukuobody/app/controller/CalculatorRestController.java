package com.chukuobody.app.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/calculator")
public class CalculatorRestController {

	@RequestMapping
	public List<String> allMenu(){
		List<String> menu = new ArrayList<String>();
		
		menu.add("SOMEEAT1111111");
		menu.add("SOMEEAT2222222");
		menu.add("SOMEEAT3333333");
		menu.add("SOMEEAT4444444");
		menu.add("SOMEEAT5555555");
		
		return menu;
	}
	
}
