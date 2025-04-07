package com.dmart.service;

import com.dmart.dao.ProductDAO;
import com.dmart.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDAO productDAO;
    
    @Autowired
    private JdbcTemplate jdbcTemplate;


    @Override
    public List<Product> getAllProducts() {
        return productDAO.getAllProducts();
    }
    
    @Override
    public void addProduct(Product product) {
        String sql = "INSERT INTO products (name, mrp, dmart_price, discount, image_url, unit) VALUES (?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, product.getName(), product.getMrp(), product.getDmartPrice(),
                            product.getDiscount(), product.getImageUrl(), product.getUnit());
    }

    @Override
    public void deleteProduct(int id) {
        String sql = "DELETE FROM products WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }

}
