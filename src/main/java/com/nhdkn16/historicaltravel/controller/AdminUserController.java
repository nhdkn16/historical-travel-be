package com.nhdkn16.historicaltravel.controller;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.nhdkn16.historicaltravel.dto.UserForm;
import com.nhdkn16.historicaltravel.entity.User;
import com.nhdkn16.historicaltravel.service.UserService;

import lombok.*;

@Controller
@RequestMapping("/admin/user")
@RequiredArgsConstructor
public class AdminUserController {

    private final UserService userService;
    private final PasswordEncoder passwordEncoder;

    @GetMapping
    public String list(Model model) {
        model.addAttribute("users", userService.findAll());
        model.addAttribute("userForm", new UserForm()); // Truyền DTO mới
        return "admin/users";
    }

    @PostMapping("/create")
    public String create(@ModelAttribute("userForm") UserForm form) {
        User user = User.builder()
                        .username(form.getUsername())
                        .email(form.getEmail())
                        .role(form.getRole())
                        .status(form.getStatus())
                        .passwordHash(passwordEncoder.encode(form.getPassword())) 
                        .build();
        
        userService.create(user);
        return "redirect:/admin/user";
    }

    @PostMapping("/update/{id}")
    public String update(@PathVariable Long id, @ModelAttribute User formUser, @RequestParam(required = false) String password) {
        User user = userService.findById(id).orElseThrow(() -> new IllegalArgumentException("User not found"));

        user.setUsername(formUser.getUsername());
        user.setEmail(formUser.getEmail());
        user.setRole(formUser.getRole());
        user.setStatus(formUser.getStatus());

        if (password != null && !password.isBlank()) {
            user.setPasswordHash(passwordEncoder.encode(password));
        }

        userService.update(user);
        return "redirect:/admin/user";
    }

    @PostMapping("/block/{id}")
    public String block(@PathVariable Long id) {
        User user = userService.findById(id).orElseThrow(() -> new IllegalArgumentException("User not found"));

        user.setStatus(User.Status.BANNED);
        userService.update(user);

        return "redirect:/admin/user";
    }

    @PostMapping("/unblock/{id}")
    public String unblock(@PathVariable Long id) {
        User user = userService.findById(id).orElseThrow(() -> new IllegalArgumentException("User not found"));

        user.setStatus(User.Status.ACTIVE);
        userService.update(user);

        return "redirect:/admin/user";
    }

    @PostMapping("/toggle-role/{id}")
    public String toggleRole(@PathVariable Long id) {
        User user = userService.findById(id).orElseThrow(() -> new IllegalArgumentException("User not found"));

        user.setRole(user.getRole() == User.Role.ADMIN ? User.Role.USER : User.Role.ADMIN);

        userService.update(user);
        return "redirect:/admin/user";
    }
}
