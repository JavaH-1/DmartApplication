package com.dmart.dao;

import com.dmart.model.Product;
import java.util.List;

public interface ProductDAO {
    
    // Get a list of all products
    List<Product> getAllProducts();
    
    // Get a single product by ID
    Product getProductById(int id);
    
    // Add a new product
    void addProduct(Product product);
    
    // Update an existing product
    void updateProduct(Product product);
    
    // Delete a product by ID
    void deleteProduct(int id);
}