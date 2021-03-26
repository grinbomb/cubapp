package com.chukuobody.app.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chukuobody.app.domain.Role;
import com.chukuobody.app.domain.User;
import com.chukuobody.app.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping
    public String userList(Model model) {
        model.addAttribute("users", userService.findAll());

        return "userlist";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("{user}")
    public String userEditForm(@PathVariable User user,
    		Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        
        return "useredit";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("/delete/{id}")
    public String userDeleter(
    		@PathVariable("id") Long id) {	
    	
    	Iterable<Role> userRoles = userService.findById(id).get().getRoles();
    	for (Role role : userRoles) {
			if(role.equals(Role.ADMIN)) {
				return "redirect:/user";
			}
		}
    	
    	userService.deleteById(id);
    
    	return "redirect:/user";
    	
    }
    		
    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping
    public String userEditor(
            @RequestParam String username,
            @RequestParam Map<String, String> form,
            @RequestParam("userId") User user
    ) {
        userService.saveUser(user, username, form);

        return "redirect:/user";
    }
    
    @GetMapping("profile")
    public String getProfile(Model model, @AuthenticationPrincipal User user) {
        model.addAttribute("username", user.getUsername());
        model.addAttribute("email", user.getEmail());

        return "profile";
    }

    @PostMapping("profile")
    public String updateProfile(
            @AuthenticationPrincipal User user,
            @RequestParam String password,
            @RequestParam String password2,
            @RequestParam String email
    ) {
    	
    	
    	userService.updateProfile(user.getId(), password, password2, email);
    	
        return "redirect:/user/profile";
    }
}