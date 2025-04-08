package com.dmart.service;

import com.dmart.model.Product;
import java.util.List;

public interface ProductService {

    // Retrieve all products
    List<Product> getAllProducts();

    // Add a new product
    void addProduct(Product product);

    // Delete product by ID
    void deleteProduct(int id);

    // Get product by ID
    Product getProductById(int id);

    // Update an existing product
    void updateProduct(Product product);
}