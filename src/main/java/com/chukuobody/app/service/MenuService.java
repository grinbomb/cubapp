package com.chukuobody.app.service;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.chukuobody.app.domain.ProductCard;
import com.chukuobody.app.domain.SelectedCards;
import com.chukuobody.app.domain.User;
import com.chukuobody.app.repos.MenuRepo;

@Service
@Transactional
public class MenuService {
	
	@Autowired
	private MenuRepo menuRepo;

	public Model updateMenu(User user, Model model, String selectedDate, String action) throws ParseException {
		
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

		int sumCalories = 0;
		double sumFats = (float) 0;
		double sumProteins = (float) 0;
		double sumCarbohydrates = (float) 0;
		
		for (SelectedCards card : selectedCards) {
			
			sumCalories+= card.getCard().getCaloriesPG()*card.getGram();
			sumCarbohydrates += card.getCard().getCarbohydratesPG()*card.getGram();
			sumProteins += card.getCard().getProteinsPG()*card.getGram();
			sumFats += card.getCard().getFatsPG()*card.getGram();
			
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
		
			if(sumCalories>0||sumFats>0||sumProteins>0||sumCarbohydrates>0) {
				model.addAttribute("sumCalories", sumCalories);
				model.addAttribute("sumFats", (int)sumFats);
				model.addAttribute("sumProteins", (int)sumProteins);
				model.addAttribute("sumCarbohydrates", (int)sumCarbohydrates);
			}
		}
		else if(action.equals("delete"))
		{
			for (SelectedCards card : selectedCards) {
				menuRepo.deleteById(card.getId());
			}
		}
		
		String formatted = dateFormat.format(docDate);
		
		model.addAttribute("selectedDate", formatted);
		
		return model;
		
	}
	
	public Model updateMenu(User user, Model model) throws ParseException {
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
		
		int sumCalories = 0;
		double sumFats = (float) 0;
		double sumProteins = (float) 0;
		double sumCarbohydrates = (float) 0;
		
		for (SelectedCards card : selectedCards) {
			
			sumCalories+= card.getCard().getCaloriesPG()*card.getGram();
			sumCarbohydrates += card.getCard().getCarbohydratesPG()*card.getGram();
			sumProteins += card.getCard().getProteinsPG()*card.getGram();
			sumFats += card.getCard().getFatsPG()*card.getGram();
			
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
		
			if(sumCalories>0||sumFats>0||sumProteins>0||sumCarbohydrates>0) {
				model.addAttribute("sumCalories", sumCalories);
				model.addAttribute("sumFats", (int)sumFats);
				model.addAttribute("sumProteins", (int)sumProteins);
				model.addAttribute("sumCarbohydrates", (int)sumCarbohydrates);
			}
			
		String formatted = dateFormat.format(docDate);
		
		model.addAttribute("selectedDate", formatted);
		
		return model;
	}

	public void deleteByUser(User user) {
		menuRepo.deleteByUser(user);
		
	}

	public int countByUser(User user) {
		return menuRepo.countByUser(user);
	}

}
