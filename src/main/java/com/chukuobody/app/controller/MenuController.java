package com.chukuobody.app.controller;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chukuobody.app.domain.ProductCard;
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
	public String main(@AuthenticationPrincipal User user,
			Model model) {
		
		LocalDate localDate = LocalDate.now();
		
		Iterable<SelectedCards> selectedCards = menuRepo.findByUserIdAndLocalDate(user.getId(), localDate); 
		
		model.addAttribute("cards", selectedCards);
		
        return "selectedmenu";
    }
	
	@PostMapping("/savemenu")
	public String saveMenu(@AuthenticationPrincipal User user,
			@RequestParam String[] productCards,
			@RequestParam String localDate,
			Model model) {
		
		LocalDate ld = LocalDate.parse(localDate);
		
		for (String card : productCards) {
			String[] tempArr;
			tempArr = card.split(",");
			
			SelectedCards selectedCard = new SelectedCards(user, cardRepo.findById(Long.parseLong(tempArr[1])).get(), Integer.parseInt(tempArr[0]), tempArr[2], ld);
			
			menuRepo.save(selectedCard);
			
		}
		
		return "redirect:/selectedmenu";
	}
	
}
