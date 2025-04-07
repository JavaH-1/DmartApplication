package com.dmart.controller;

import com.dmart.model.*;
import com.dmart.service.ProductService;
import com.dmart.service.UserService;
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
        return "welcome";
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
            return "register";
        } else {
            model.addAttribute("msg", "❌ Something went wrong during registration...");
            model.addAttribute("type", "danger");
            model.addAttribute("states", service.getAllStates());
            return "register";
        }
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

            if ("Admin".equalsIgnoreCase(user.getUsertype())) {
                return "redirect:/admin/dashboard"; // 🔄 Admin gets redirected here
            }

            return "redirect:/dashboard"; // Regular user
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

            List<Product> productList = productService.getAllProducts();
            model.addAttribute("productList", productList);

            return "dashboard";
        } else {
            return "redirect:/login";
        }
    }


    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
    
    //ADMIN access controllers
    @GetMapping("/admin/dashboard")
    public String adminDashboard(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");

        if (user != null && "admin".equalsIgnoreCase(user.getUsertype())) {
            // Fetch all products
            List<Product> productList = productService.getAllProducts();
            model.addAttribute("productList", productList);

            // Fetch customers only
            List<User> customerList = service.getAllCustomers(); // You’ll add this method in UserService
            model.addAttribute("customerList", customerList);

            return "admin-dashboard";
        }

        return "redirect:/login";
    }

    @PostMapping("/admin/addProduct")
    public String addProduct(@ModelAttribute Product product, HttpSession session) {
        User user = (User) session.getAttribute("user");

        if (user != null && "admin".equalsIgnoreCase(user.getUsertype())) {
            productService.addProduct(product); // You’ll add this in ProductService
            return "redirect:/admin/dashboard";
        }

        return "redirect:/login";
    }

    @GetMapping("/admin/deleteProduct/{id}")
    public String deleteProduct(@PathVariable("id") int id, HttpSession session) {
        User user = (User) session.getAttribute("user");

        if (user != null && "admin".equalsIgnoreCase(user.getUsertype())) {
            productService.deleteProduct(id); // You’ll add this in ProductService
            return "redirect:/admin/dashboard";
        }

        return "redirect:/login";
    }

}
