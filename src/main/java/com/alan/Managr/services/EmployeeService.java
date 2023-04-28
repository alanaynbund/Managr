package com.alan.Managr.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.alan.Managr.models.Employee;
import com.alan.Managr.repositories.EmployeeRepository;

@Service
public class EmployeeService {
	
	
	private final EmployeeRepository emploRepo;
	public EmployeeService(EmployeeRepository emploRepo) {
		this.emploRepo = emploRepo;
	}

	public Employee getOne(Long id) {
		Optional<Employee> employee = emploRepo.findById(id);
		return employee.isPresent() ? employee.get() : null;
	}

	public List<Employee> getAll() {
		return (List<Employee>) emploRepo.findAll();
	}

	public Employee create(Employee emplo) {
		return emploRepo.save(emplo);
	}

	public Employee update(Employee emplo) {
		return emploRepo.save(emplo);
	}

	public void delete(Long id) {
		emploRepo.deleteById(id);
	}


}
