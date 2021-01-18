package com.chukuobody.app.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.chukuobody.app.domain.ProductCard;
import com.chukuobody.app.repos.CardRepo;

@RestController
@RequestMapping("/api/calculator")
public class CalculatorRestController {
	
	@Autowired
	private CardRepo eatcard;

	@RequestMapping
	public Iterable<ProductCard> allMenu(@RequestBody Map<String,String> msg){
		Iterable<ProductCard> cards = eatcard.findByProductCategory(msg.get("subject"));
		
		return cards;
	}
	
}
