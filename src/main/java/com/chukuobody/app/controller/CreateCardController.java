package com.chukuobody.app.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chukuobody.app.domain.ProductCard;
import com.chukuobody.app.repos.CardRepo;

@Controller
@RequestMapping("/createcard")
@PreAuthorize("hasAuthority('ADMIN')")
public class CreateCardController {
	
	@Autowired 
	private CardRepo cardRepo;
	
	@GetMapping
	public String create() {
		
        return "createcard";
    }
	
	@PostMapping
	public String create(
			@RequestParam String productName,
			@RequestParam(defaultValue = "") String productCategory,
			@RequestParam String calories,
			@RequestParam String proteins,
			@RequestParam String fats,
			@RequestParam String carbohydrates,
			@RequestParam String imgLink,
			Model model) throws IOException 
	{
		Map<String, String> errorList = new HashMap<String, String>();
		
		if(productName.isEmpty())errorList.put("errorProductName", "Product name must not be empty.");
		if(productCategory.isEmpty())errorList.put("errorProductCategory", "Product category must not be empty.");
		if(calories.isEmpty())errorList.put("errorCalories", "Calories must not be empty.");
		if(proteins.isEmpty())errorList.put("errorProteins", "Proteins must not be empty.");
		if(fats.isEmpty())errorList.put("errorFats", "Fats must not be empty.");
		if(carbohydrates.isEmpty())errorList.put("errorCarbohydrates", "Carbohydrates must not be empty.");
		if(imgLink.isEmpty())errorList.put("errorImgLink", "Image link must not be empty.");
		
		if(!errorList.isEmpty()) {
			for(Map.Entry<String, String> entry : errorList.entrySet()) {
				model.addAttribute(entry.getKey(), entry.getValue());
			}
			return "createcard";
		}
		
		ProductCard productCard = new ProductCard(productName, productCategory, Double.parseDouble(calories), Double.parseDouble(proteins), Double.parseDouble(fats), Double.parseDouble(carbohydrates), imgLink);

		cardRepo.save(productCard);
		
		return "createcard";
	}
	
}
