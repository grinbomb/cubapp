package com.chukuobody.app.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.chukuobody.app.model.EatCard;

@RestController
@RequestMapping("/api/calculator")
public class CalculatorRestController {

	@RequestMapping
	public List<EatCard> allMenu(){
		List<EatCard> menu = new ArrayList<EatCard>();
		
		menu.add(new EatCard("123", "EGG", "https://pngicon.ru/file/uploads/razbitoe-jajco.png"));
		menu.add(new EatCard("444", "BREAD", "https://clipart-db.ru/file_content/rastr/bread-008.png"));
		
		return menu;
	}
	
}
