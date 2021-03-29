package com.chukuobody.app.controller;

import java.util.Collections;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.chukuobody.app.domain.User;
import com.chukuobody.app.domain.dto.CaptchaResponseDto;
import com.chukuobody.app.service.UserService;

@Controller
public class RegistrationController {
	
	private final static String CAPTCHA_URL = "https://www.google.com/recaptcha/api/siteverify?secret=%s&response=%s";
	
	@Autowired
    private UserService userService;
	
	@Autowired
	private RestTemplate restTemplate;
	
	String secret = "6LeBAJQaAAAAAO7B-bkro_y3P6TDY9ft6YvBP-X8";

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(
    		@RequestParam("g-recaptcha-response") String captchaResponse,
    		@RequestParam("password2") String password2,
    		@Valid User user, 
    		BindingResult bindingResult, 
    		Model model) {
    	
    	String url = String.format(CAPTCHA_URL, secret, captchaResponse);
        CaptchaResponseDto response = restTemplate.postForObject(url, Collections.emptyList(), CaptchaResponseDto.class);
        
        if (!response.isSuccess()) {
            model.addAttribute("errorReCaptcha", "Fill captcha");
        }
        
        boolean isConfirmEmpty = StringUtils.isEmpty(password2);

        if (isConfirmEmpty) {
            model.addAttribute("password2Error", "Password confirmation cannot be empty");
        }
    	
        boolean differentPasswords = user.getPassword() != null && !user.getPassword().equals(user.getPassword2());
        
    	if (differentPasswords) {
            model.addAttribute("passwordError", "Passwords are different!");
        }
    	
    	if (bindingResult.hasErrors()||!response.isSuccess()||differentPasswords) {
    		Map<String, String> errors = ControllerUtils.getErrors(bindingResult);

            model.mergeAttributes(errors);

            return "registration";
        }
    	
        if (!userService.addUser(user)) {
            model.addAttribute("usernameError", "This user already exists!");
            return "registration";
        }

        return "redirect:/login";
    }
    
    @GetMapping("/activate/{code}")
    public String activate(Model model, @PathVariable String code) {
        boolean isActivated = userService.activateUser(code);

        if (isActivated) {
            model.addAttribute("messageType", "success");
            model.addAttribute("message", "User successfully activated");
        } else {
            model.addAttribute("messageType", "danger");
            model.addAttribute("message", "Activation code is not found!");
        }

        return "login";
    }
}
