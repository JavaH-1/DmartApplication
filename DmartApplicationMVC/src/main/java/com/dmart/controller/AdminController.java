package com.dmart.controller;

import com.dmart.model.Product;
import com.dmart.model.User;
import com.dmart.service.ProductService;
import com.dmart.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private ProductService productService;

    @Autowired
    private UserService userService;

    @GetMapping("/dashboard")
    public String adminDashboard(HttpSession session, Model model,
                                 @ModelAttribute("message") String message,
                                 @ModelAttribute("alertClass") String alertClass) {
        User user = (User) session.getAttribute("user");

        if (user != null && "admin".equalsIgnoreCase(user.getUsertype())) {
            model.addAttribute("productList", productService.getAllProducts());
            model.addAttribute("customerList", userService.getAllCustomers());
            model.addAttribute("message", message);
            model.addAttribute("alertClass", alertClass);
            return "admin-dashboard";
        }

        return "redirect:/login";
    }

    @PostMapping("/addProduct")
    public String addProduct(@ModelAttribute Product product, HttpSession session, RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("user");

        if (user != null && "admin".equalsIgnoreCase(user.getUsertype())) {
            productService.addProduct(product);
            redirectAttributes.addFlashAttribute("message", "✅ Product added successfully!");
            redirectAttributes.addFlashAttribute("alertClass", "alert-success");
            return "redirect:/admin/dashboard";
        }

        return "redirect:/login";
    }

    @GetMapping("/deleteProduct/{id}")
    public String deleteProduct(@PathVariable int id, HttpSession session, RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("user");

        if (user != null && "admin".equalsIgnoreCase(user.getUsertype())) {
            productService.deleteProduct(id);
            redirectAttributes.addFlashAttribute("message", "🗑️ Product deleted successfully!");
            redirectAttributes.addFlashAttribute("alertClass", "alert-success");
            return "redirect:/admin/dashboard";
        }

        return "redirect:/login";
    }

    @GetMapping("/editProduct/{id}")
    public String editProduct(@PathVariable int id, Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");

        if (user != null && "admin".equalsIgnoreCase(user.getUsertype())) {
            Product product = productService.getProductById(id);
            model.addAttribute("editing", product);
            model.addAttribute("productList", productService.getAllProducts());
            model.addAttribute("customerList", userService.getAllCustomers());
            return "admin-dashboard";
        }

        return "redirect:/login";
    }

    @PostMapping("/updateProduct")
    public String updateProduct(@ModelAttribute Product product, HttpSession session, RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("user");

        if (user != null && "admin".equalsIgnoreCase(user.getUsertype())) {
            productService.updateProduct(product);
            redirectAttributes.addFlashAttribute("message", "📝 Product updated successfully!");
            redirectAttributes.addFlashAttribute("alertClass", "alert-info");
            return "redirect:/admin/dashboard";
        }

        return "redirect:/login";
    }
}