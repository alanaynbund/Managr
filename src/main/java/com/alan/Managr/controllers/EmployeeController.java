package com.alan.Managr.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.alan.Managr.models.Employee;
import com.alan.Managr.services.EmployeeService;

@Controller
public class EmployeeController {
	private final EmployeeService emploServ;
	public EmployeeController(EmployeeService emploServ) {
		this.emploServ = emploServ;
	}
	
	@GetMapping("/create")
	public String create(@ModelAttribute("employee")Employee employee,HttpSession session) {
		if(session.getAttribute("user_id") == null) {
			return "redirect:/";
		}
		return "employee/create.jsp";
	}
	
	@PostMapping("/process/create")
	public String processCreateDonation(@Valid @ModelAttribute("employee") Employee employee, BindingResult result) {
		if(result.hasErrors()) {
			return "employee/create.jsp";
		}
		emploServ.create(employee);
		return "redirect:/dashboard";
	}
	@GetMapping("/edit/{id}")
	public String editDonation(@PathVariable("id") Long id, Model model) {
		model.addAttribute("employee", emploServ.getOne(id));
		return "employee/edit.jsp";
	}

	@PutMapping("/process/edit/{id}")
	public String processEditDonation(@Valid @ModelAttribute("employee")Employee employee, BindingResult result) {
		if(result.hasErrors()) {
			return "employee/edit.jsp";
		}
		emploServ.update(employee);
		return "redirect:/dashboard";
	}
	
	@GetMapping("/notes/{id}")
	public String notes(@PathVariable("id") Long id, Model model) {
		model.addAttribute("employee", emploServ.getOne(id));
		return "employee/notes.jsp";
	}
	
	@PutMapping("/process/note/{id}")
	public String processNote(@Valid @ModelAttribute("employee")Employee employee, BindingResult result) {
		if(result.hasErrors()) {
			return "employee/notes.jsp";
		}
		emploServ.update(employee);
		return "redirect:/dashboard";
	}
	@GetMapping("/display/{id}")
	public String displayOneDonation(@PathVariable("id") Long id, Model model) {
		Employee employee = emploServ.getOne(id);
		model.addAttribute("employee", employee);
		return "employee/displayOne.jsp";
	}
	
	@DeleteMapping("/{id}")
	public String deleteDonation(@PathVariable("id") Long id) {
		emploServ.delete(id);
		return "redirect:/dashboard";
	}
	

}
