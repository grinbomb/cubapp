package com.chukuobody.app.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chukuobody.app.domain.SelectedCards;
import com.chukuobody.app.domain.User;
import com.chukuobody.app.repos.CardRepo;
import com.chukuobody.app.repos.MenuRepo;

@Controller
public class MenuController {

	@Autowired
	private CardRepo cardRepo;
	
	@Autowired
	private MenuRepo menuRepo;
	
	@GetMapping("/selectedmenu")
	public String main(
			@AuthenticationPrincipal User user,
			Model model
			) throws ParseException {
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date parsedDate = dateFormat.parse(dateFormat.format(new Date()));
		Timestamp docDate = new Timestamp(parsedDate.getTime());
		
		List<SelectedCards> selectedCards = menuRepo.findByUserIdAndDate(user.getId(), docDate);
		
		List<SelectedCards> 
				breakfastCards = new ArrayList(),
				brunchCards = new ArrayList(),
				lunchCards = new ArrayList(),
				linnerCards = new ArrayList(),
				dinnerCards = new ArrayList();
		
		for (SelectedCards card : selectedCards) {
			
			switch (card.getMealTime()) {
			case "breakfast":
				breakfastCards.add(card);
				break;
			case "brunch":
				brunchCards.add(card);
				break;
			case "lunch":
				lunchCards.add(card);
				break;
			case "linner":
				linnerCards.add(card);
				break;
			case "dinner":
				dinnerCards.add(card);
				break;
			}
		}
		
		if(!breakfastCards.isEmpty()) model.addAttribute("breakfastCards", breakfastCards);
		if(!brunchCards.isEmpty()) model.addAttribute("brunchCards", brunchCards);
		if(!lunchCards.isEmpty()) model.addAttribute("lunchCards", lunchCards);
		if(!linnerCards.isEmpty()) model.addAttribute("linnerCards", linnerCards);
		if(!dinnerCards.isEmpty()) model.addAttribute("dinnerCards", dinnerCards);
		
		String formatted = dateFormat.format(docDate);
		
		model.addAttribute("selectedDate", formatted);
		
        return "selectedmenu";
    }
	
	@PostMapping("/selectedmenu")
	public String checkDate(
			@AuthenticationPrincipal User user,
			@RequestParam String selectedDate,
			@RequestParam String action,
			Model model
			) throws ParseException {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date parsedDate = dateFormat.parse(selectedDate);
		Timestamp docDate = new Timestamp(parsedDate.getTime());
		
		List<SelectedCards> selectedCards = menuRepo.findByUserIdAndDate(user.getId(), docDate);
		
		if(action.equals("check")) {
	
		List<SelectedCards> 
		breakfastCards = new ArrayList(),
		brunchCards = new ArrayList(),
		lunchCards = new ArrayList(),
		linnerCards = new ArrayList(),
		dinnerCards = new ArrayList();

		for (SelectedCards card : selectedCards) {
			
			switch (card.getMealTime()) {
			case "breakfast":
				breakfastCards.add(card);
				break;
			case "brunch":
				brunchCards.add(card);
				break;
			case "lunch":
				lunchCards.add(card);
				break;
			case "linner":
				linnerCards.add(card);
				break;
			case "dinner":
				dinnerCards.add(card);
				break;
			}
		}
		
		if(!breakfastCards.isEmpty()) model.addAttribute("breakfastCards", breakfastCards);
		if(!brunchCards.isEmpty()) model.addAttribute("brunchCards", brunchCards);
		if(!lunchCards.isEmpty()) model.addAttribute("lunchCards", lunchCards);
		if(!linnerCards.isEmpty()) model.addAttribute("linnerCards", linnerCards);
		if(!dinnerCards.isEmpty()) model.addAttribute("dinnerCards", dinnerCards);
		
		}
		else if(action.equals("delete"))
		{
			for (SelectedCards card : selectedCards) {
				menuRepo.deleteById(card.getId());
			}
		}
		String formatted = dateFormat.format(docDate);
		
		model.addAttribute("selectedDate", formatted);
		return "selectedmenu";
	}
	
	@PostMapping("/savemenu")
	public String saveMenu(@AuthenticationPrincipal User user,
			@RequestParam(required = false) String[] productCards,
			@RequestParam String selectedDate,
			Model model) throws ParseException {
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date parsedDate = dateFormat.parse(selectedDate);
		Timestamp docDate = new Timestamp(parsedDate.getTime());
		
		if(productCards==null){
			return "redirect:/selectedmenu";
		}
		
		List<SelectedCards> selectedCards = menuRepo.findByUserIdAndDate(user.getId(), docDate);
		
		if(!selectedCards.isEmpty()) {
			return "redirect:/selectedmenu";
		}
		
		for (String card : productCards) {
			String[] tempArr;
			if(card.split(",").length<3) {
				tempArr = productCards;
			}else {
				tempArr = card.split(",");
			}
			
			SelectedCards selectedCard = new SelectedCards(user, cardRepo.findById(Long.parseLong(tempArr[1])).get(), Integer.parseInt(tempArr[0]), tempArr[2], docDate);
			
			menuRepo.save(selectedCard);
			
		}
		
		return "redirect:/selectedmenu";
	}
	
}
