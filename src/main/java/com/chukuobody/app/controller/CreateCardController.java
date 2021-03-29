package com.chukuobody.app.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chukuobody.app.domain.ProductCard;
import com.chukuobody.app.repos.CardRepo;

@Controller
@RequestMapping("/createcard")
@PreAuthorize("hasAuthority('ADMIN')")
public class CreateCardController {
	
	@Autowired 
	private CardRepo cardRepo;
	
	@GetMapping
	public String showCards(Model model) {
		
		List<ProductCard> allCards = cardRepo.findAll();
		
		model.addAttribute("cards", allCards);
		
        return "createcard";
    }
	
	@PostMapping("/delete/{id}")
	public String deleteCard(@PathVariable("id") Long id) {
		
		cardRepo.deleteById(id);
		
		return "redirect:/createcard";
	}
	
	@PostMapping
	public String create(
			@Valid ProductCard productCard,
			BindingResult bindingResult,
			Model model) throws IOException 
	{
		
		if(bindingResult.hasErrors()) {
			
			Map<String, String> errorList = ControllerUtils.getErrors(bindingResult);

            model.mergeAttributes(errorList);
            
		}else {
			
		cardRepo.save(productCard);
		
		}
		
		List<ProductCard> allCards = cardRepo.findAll();
		
		model.addAttribute("cards", allCards);
		
		return "createcard";
	}
	
}
