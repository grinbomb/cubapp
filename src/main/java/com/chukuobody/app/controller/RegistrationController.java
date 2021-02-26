package com.chukuobody.app.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chukuobody.app.domain.User;
import com.chukuobody.app.service.UserService;

@Controller
public class RegistrationController {
	@Autowired
    private UserService userService;

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user,
    		@RequestParam String username,
			@RequestParam String password,
			@RequestParam String email, 
			Model model) {
    	
    	Map<String, String> errorList = new HashMap<String, String>();
    	
    	if(username.isEmpty())errorList.put("errorUsername", "Username must not be empty.");
		if(password.isEmpty())errorList.put("errorPassword", "Password must not be empty.");
		if(email.isEmpty())errorList.put("errorEmail", "Email must not be empty.");
    	
		if(!errorList.isEmpty()) {
			for(Map.Entry<String, String> entry : errorList.entrySet()) {
				model.addAttribute(entry.getKey(), entry.getValue());
			}
			
			model.addAttribute("username", username);
			model.addAttribute("password", password);
			model.addAttribute("email", email);
			
			return "registration";
		}
		
        if (!userService.addUser(user)) {
            model.addAttribute("message", "This user already exists!");
            return "registration";
        } else {
        	model.addAttribute("message", "An activation code was sent to the specified mail");
        }

        return "redirect:/login";
    }
    
    @GetMapping("/activate/{code}")
    public String activate(Model model, @PathVariable String code) {
        boolean isActivated = userService.activateUser(code);

        if (isActivated) {
            model.addAttribute("message", "User successfully activated");
        } else {
            model.addAttribute("message", "Activation code is not found!");
        }

        return "login";
    }
}
