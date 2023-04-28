package com.alan.Managr.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.alan.Managr.models.LoginUser;
import com.alan.Managr.models.User;
import com.alan.Managr.services.UserService;

@Controller
public class UserController {
	private final UserService userServ;
	public UserController(UserService userServ) {
		this.userServ = userServ;
	}
	
	@GetMapping("/")
	public String loginReg(@ModelAttribute("loginUser") LoginUser loginUser,HttpSession session) {
		if(session.getAttribute("user_id") != null) {
			return "redirect:/";
		}
		return "user/login.jsp";
	}
	
	@GetMapping("/register")
	public String register(@ModelAttribute("newUser") User user, HttpSession session) {
		if(session.getAttribute("user_id") != null) {
			return "redirect:/";
		}
		return "user/register.jsp";
	}
	
	@PostMapping("/process/register")
	public String processRegister(@Valid @ModelAttribute("newUser") User newUser, BindingResult result,Model model,HttpSession session) {
		// to-do
		//		check if the passwords match
		if(!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("password", "Match", "passwords dont match");
		}
		//		reject if email is taken
		if(userServ.getOne(newUser.getEmail()) != null) {
			result.rejectValue("email", "Unique", "Email is already taken");
		}
		if(result.hasErrors()) {
			model.addAttribute("loginUser", new LoginUser());
			return "user/register.jsp";
		}
		User newlyCreatedUser = userServ.registerUser(newUser);
		session.setAttribute("user_id", newlyCreatedUser.getId());
		return "redirect:/dashboard";
	}

	@PostMapping("/login")
	public String processLogin(@Valid @ModelAttribute("loginUser") LoginUser loginUser, BindingResult result, Model model,HttpSession session) {
		User loggingUser = userServ.login(loginUser, result);
		if(result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "user/login.jsp";
		}
		session.setAttribute("user_id", loggingUser.getId());
		return "redirect:/dashboard";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

}
