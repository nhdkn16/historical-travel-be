package com.nhdkn16.historicaltravel.controller;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nhdkn16.historicaltravel.dto.RegisterForm;
import com.nhdkn16.historicaltravel.entity.User;
import com.nhdkn16.historicaltravel.service.UserService;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AuthController {

    private final UserService userService;
    private final PasswordEncoder passwordEncoder;

    @GetMapping("/login")
    public String loginPage(Model model) {
        return "user/register/login";
    }

    @GetMapping("/register")
    public String showRegisterForm(Model model) {
        if (!model.containsAttribute("registerForm")) {
            model.addAttribute("registerForm", new RegisterForm());
        }
        return "user/register/register";
    }

    @PostMapping("/register")
    public String registerUser(@Valid @ModelAttribute("registerForm") RegisterForm form,
                               BindingResult result,
                               RedirectAttributes redirectAttributes) {

        if (result.hasErrors()) {
            redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.registerForm", result);
            redirectAttributes.addFlashAttribute("registerForm", form);
            return "redirect:/register";
        }
        
        if (userService.findByUsername(form.getUsername()).isPresent()) {
            result.rejectValue("username", "error.registerForm", "Tên đăng nhập đã tồn tại.");
        }
        if (userService.findByEmail(form.getEmail()).isPresent()) {
            result.rejectValue("email", "error.registerForm", "Email đã được sử dụng.");
        }
        
        if (result.hasErrors()) {
             redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.registerForm", result);
             redirectAttributes.addFlashAttribute("registerForm", form);
             return "redirect:/register";
        }

        User newUser = User.builder()
                .username(form.getUsername())
                .email(form.getEmail())
                .passwordHash(passwordEncoder.encode(form.getPassword()))
                .role(User.Role.USER)
                .status(User.Status.ACTIVE)
                .build();

        userService.create(newUser);

        redirectAttributes.addFlashAttribute("successMessage", "Đăng ký thành công! Vui lòng đăng nhập.");
        return "redirect:/login";
    }
}
