package com.dmart.service;

import com.dmart.model.Product;
import java.util.List;

public interface ProductService {
    List<Product> getAllProducts();
    
    void addProduct(Product product);
    void deleteProduct(int id);

	Product getProductById(int productId);

}
