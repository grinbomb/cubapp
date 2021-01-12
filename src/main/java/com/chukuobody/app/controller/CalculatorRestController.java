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
		menu.add(new EatCard("222", "BREAD", "https://clipart-db.ru/file_content/rastr/bread-008.png"));
		menu.add(new EatCard("333", "BREAKFAST CEREAL", "https://start-ukraine.com/%D0%A3%D0%BF%D0%B0%D0%BA%D0%BE%D0%B2%D0%BA%D0%B8/Cocoa_Balls.png"));
		menu.add(new EatCard("444", "OATMEAL", "https://pngimg.com/uploads/porridge/porridge_PNG23.png"));
		menu.add(new EatCard("777", "SPAGHETTI", "https://lh3.googleusercontent.com/proxy/wlCoEvvDSjXayDOVk2usLpWpI0CSno7derQ1dqa0JswbyhPdDO2BTMenIRJ837BKtmDfDMBcCPCnhsItyAOj4UY6Rsc"));}
		else if(eatType.equals("2"))
		menu.add(new EatCard("555", "APPLE", "https://pngicon.ru/file/uploads/2_50.png"));
		else
		menu.add(new EatCard("666", "BANANA", "https://pngicon.ru/file/uploads/svyazka-bananov.png"));
		
		return menu;
	}
	
}
