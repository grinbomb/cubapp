package com.chukuobody.app.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
	public String main(@AuthenticationPrincipal User user,
			Model model) throws ParseException {
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date parsedDate = dateFormat.parse(dateFormat.format(new Date()));
		Timestamp docDate = new Timestamp(parsedDate.getTime());
		
		System.out.println(parsedDate);
		
		List<SelectedCards> selectedCards = menuRepo.findByUserIdAndDate(user.getId(), docDate);
		
		if(!selectedCards.isEmpty()) {
		model.addAttribute("cards", selectedCards);
		}
        return "selectedmenu";
    }
	
	@PostMapping("/savemenu")
	public String saveMenu(@AuthenticationPrincipal User user,
			@RequestParam String[] productCards,
			@RequestParam String selectedDate,
			Model model) throws ParseException {
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date parsedDate = dateFormat.parse(selectedDate);
		Timestamp docDate = new Timestamp(parsedDate.getTime());
		
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
