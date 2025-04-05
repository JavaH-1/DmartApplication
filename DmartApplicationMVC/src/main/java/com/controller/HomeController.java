package com.controller;

import com.model.Product;
import com.model.User;
import com.service.ProductService;
import com.service.UserService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/")  // Base path
public class HomeController {

    private final UserService userService;
    private final ProductService productService;

    @Autowired
    public HomeController(UserService userService, ProductService productService) {
        this.userService = userService;
        this.productService = productService;
    }

    // ==================== Registration ====================
    @GetMapping("register")
    public String showRegisterPage(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("register")
    public String registerUser(@ModelAttribute("user") User user, Model model) {
        userService.register(user);
        model.addAttribute("message", "Registration successful! Please log in.");
        return "login";
    }

    // ==================== Login ====================
    @GetMapping("login")
    public String showLoginForm() {
        return "login";
    }

    @PostMapping("login")
    public String loginUser(@RequestParam("username") String username,
                            @RequestParam("password") String password,
                            HttpSession session,
                            Model model) {
        User user = userService.login(username, password);
        if (user != null) {
            session.setAttribute("loggedInUser", user);
            return "redirect:/dashboard";
        } else {
            model.addAttribute("error", "Invalid credentials");
            return "login";
        }
    }

    // ==================== Logout ====================
    @GetMapping("logout")
    public String logoutUser(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

    // ==================== Dashboard ====================
    @GetMapping("dashboard")
    public String showDashboard(Model model) {
        List<Product> products = productService.listAll();
        model.addAttribute("products", products);
        return "dashboard";
    }

    // ==================== User List (Admin?) ====================
    @GetMapping("users")
    public String listAllUsers(Model model) {
        List<User> users = userService.findAllUsers();
        model.addAttribute("users", users);
        return "user-list";
    }
}
