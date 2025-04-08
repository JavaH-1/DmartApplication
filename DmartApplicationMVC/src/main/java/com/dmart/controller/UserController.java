package com.dmart.controller;

import com.dmart.model.*;
import com.dmart.service.ProductService;
import com.dmart.service.UserService;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {

    @Autowired
    private UserService service;

    @Autowired
    private ProductService productService;

    @GetMapping("/")
    public String welcome() {
        return "index";
    }

    @GetMapping("/register")
    public String showRegister(Model model) {
        model.addAttribute("states", service.getAllStates());
        return "register";
    }

    @GetMapping("/getCities")
    @ResponseBody
    public List<City> getCities(@RequestParam("stateId") int stateId) {
        return service.getCitiesByStateId(stateId);
    }

    @PostMapping("/register")
    public String doRegister(@ModelAttribute User user, Model model) {
        if (service.checkEmailExists(user.getEmail())) {
            model.addAttribute("msg", "⚠ Email already exists. Please try another one.");
            model.addAttribute("type", "warning");
            model.addAttribute("states", service.getAllStates());
            return "register";
        }

        if (service.registerUser(user)) {
            model.addAttribute("msg", "✅ Registration successful!");
            model.addAttribute("type", "success");
        } else {
            model.addAttribute("msg", "❌ Something went wrong during registration...");
            model.addAttribute("type", "danger");
        }

        model.addAttribute("states", service.getAllStates());
        return "register";
    }

    @GetMapping("/login")
    public String showLogin() {
        return "login";
    }

    @PostMapping("/login")
    public String doLogin(@RequestParam String username,
                          @RequestParam String password,
                          HttpSession session, Model model) {

        User user = service.loginUser(username, password);
        if (user != null) {
            session.setAttribute("user", user);
            return user.getUsertype().equalsIgnoreCase("admin") ? "redirect:/admin/dashboard" : "redirect:/dashboard";
        } else {
            model.addAttribute("msg", "❌ Invalid username or password");
            model.addAttribute("type", "danger");
            return "login";
        }
    }

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            model.addAttribute("user", user);
            model.addAttribute("productList", productService.getAllProducts());
            return "dashboard";
        }
        return "redirect:/login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

    @PostMapping("/addToCart")
    public String addToCart(@RequestParam("productId") int productId, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";

        List<Product> cart = (List<Product>) session.getAttribute("cart");
        if (cart == null) cart = new ArrayList<>();

        Product product = productService.getProductById(productId);
        if (product != null) {
            cart.add(product);
            session.setAttribute("cart", cart);
        }

        return "redirect:/dashboard";
    }

    @GetMapping("/viewcart")
    public String viewCart(HttpSession session, Model model) {
        List<Product> cartItems = (List<Product>) session.getAttribute("cart");
        model.addAttribute("cartItems", cartItems != null ? cartItems : new ArrayList<>());
        return "viewcart";
    }

    @GetMapping("/removeFromCart")
    public String removeFromCart(@RequestParam("productId") int productId, HttpSession session) {
        List<Product> cart = (List<Product>) session.getAttribute("cart");
        if (cart != null) {
            cart.removeIf(p -> p.getId() == productId);
            session.setAttribute("cart", cart);
        }
        return "redirect:/viewcart";
    }
}