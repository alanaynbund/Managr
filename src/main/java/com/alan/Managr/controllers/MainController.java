package com.alan.Managr.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.alan.Managr.models.Employee;
import com.alan.Managr.services.EmployeeService;
import com.alan.Managr.services.UserService;

@Controller
public class MainController {
	private final EmployeeService emploServ;
	private final UserService userServ;
	public MainController(EmployeeService emploServ,UserService userServ) {
		this.emploServ = emploServ;
		this.userServ = userServ;
	}

	@GetMapping("/dashboard")
	public String home(HttpSession session,Model model) {
		if(session.getAttribute("user_id") == null) {
			return "redirect:/";
		}
		
		model.addAttribute("allEmployees", emploServ.getAll());
		model.addAttribute("loggedInUser", userServ.getOne((Long) session.getAttribute("user_id")));
		return "main/dashboard.jsp";
	}
}