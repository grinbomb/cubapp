package com.chukuobody.app.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.chukuobody.app.model.EatCard;

@RestController
@RequestMapping("/api/calculator")
public class CalculatorRestController {

	@RequestMapping
	public List<EatCard> allMenu(@RequestBody Map<String,String> msg){
		List<EatCard> menu = new ArrayList<EatCard>();
		
		String eatType = msg.get("subject");
		if(eatType.equals("1")) {
		menu.add(new EatCard("111", "EGG", "https://pngicon.ru/file/uploads/razbitoe-jajco.png"));
		menu.add(new EatCard("222", "BREAD", "https://clipart-db.ru/file_content/rastr/bread-008.png"));}
		else if(eatType.equals("2"))
		menu.add(new EatCard("333", "APPLE", "https://pngicon.ru/file/uploads/2_50.png"));
		else
		menu.add(new EatCard("444", "BANANA", "https://pngicon.ru/file/uploads/svyazka-bananov.png"));
		
		return menu;
	}
	
}
