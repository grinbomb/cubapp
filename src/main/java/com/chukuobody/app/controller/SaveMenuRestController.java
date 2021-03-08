package com.chukuobody.app.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.chukuobody.app.domain.SelectedCards;
import com.chukuobody.app.domain.User;
import com.chukuobody.app.repos.MenuRepo;

@RestController
public class SaveMenuRestController {

	@Autowired
	private MenuRepo menuRepo;
	
	@RequestMapping("/api/savemenu")
	public boolean allMenu(@AuthenticationPrincipal User user,
			@RequestBody Map<String,String> msg) throws ParseException{
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date parsedDate = dateFormat.parse(msg.get("subject"));
		Timestamp docDate = new Timestamp(parsedDate.getTime());
		
		List<SelectedCards> selectedCards = menuRepo.findByUserIdAndDate(user.getId(), docDate);
		
		if(!selectedCards.isEmpty()) {
			return true;
		}
		
		return false;
	}
}
