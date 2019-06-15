package com.nt.controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nt.model.User;
import com.nt.properites.AppProperties;

@Controller
public class UserController {
		
	@Autowired
	private AppProperties props;
	
	@RequestMapping(value = { "/", "displayForm" }, method = RequestMethod.GET)
	public String displayForm(Model model) {
		System.out.println("UserController.displayForm()");

		model.addAttribute("user", new User());
		initiazeFormValues(model);

		return "UserForm";
	}

	@PostMapping("/register")
	public String displayUserDetails(Model model, @ModelAttribute("user") @Valid User user, BindingResult bindingResult,
			RedirectAttributes rta) {

		System.out.println("UserController.displayUserDetails()");
		initiazeFormValues(model);
		String msg=props.getProps().get("RegSucc");
		if (bindingResult.hasErrors())
			return "UserForm";

		model.addAttribute("user", user);
		System.out.println(user);
	
	
		rta.addFlashAttribute("msg", msg);
		return "redirect:/successurl";
	}

	private void initiazeFormValues(Model model) {
		List<String> genders = new ArrayList();
		genders.add("Male");
		genders.add("Female");
		model.addAttribute("genders", genders);

		List<String> timings = new ArrayList();
		timings.add("Morning");
		timings.add("Evening");
		model.addAttribute("timings", timings);

		List<String> course = new ArrayList<>();
		course.add("Spring");
		course.add("Hibernate");
		course.add("Jsp");
		course.add("Servlets");
		model.addAttribute("courseDetails", course);

	}

	@GetMapping("/successurl")
	public String success(Model model) {
		User user = new User();
		initiazeFormValues(model);
		model.addAttribute("user", user);
		return "UserForm";
	}

}
