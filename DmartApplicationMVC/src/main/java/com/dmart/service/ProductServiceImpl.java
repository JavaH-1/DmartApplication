package com.dmart.service;

import com.dmart.dao.ProductDAO;
import com.dmart.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDAO productDAO;

    @Override
    public List<Product> getAllProducts() {
        return productDAO.getAllProducts();
    }

    @Override
    public void addProduct(Product product) {
        productDAO.addProduct(product);
    }

    @Override
    public void deleteProduct(int id) {
        productDAO.deleteProduct(id);
    }

    @Override
    public Product getProductById(int id) {
        return productDAO.getProductById(id);
    }

    @Override
    public void updateProduct(Product product) {
        productDAO.updateProduct(product);
    }
}