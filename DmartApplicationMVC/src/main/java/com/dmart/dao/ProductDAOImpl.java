package com.dmart.dao;

import com.dmart.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProductDAOImpl implements ProductDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<Product> getAllProducts() {
        String sql = "SELECT * FROM products";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Product.class));
    }

    @Override
    public Product getProductById(int id) {
        String sql = "SELECT * FROM products WHERE id = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new Object[]{id}, new BeanPropertyRowMapper<>(Product.class));
        } catch (Exception e) {
            // Handle case where no product is found
            return null;
        }
    }

    @Override
    public void addProduct(Product product) {
        String sql = "INSERT INTO products (name, mrp, dmart_price, discount, unit, image_url) VALUES (?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql,
                product.getName(),
                product.getMrp(),
                product.getDmartPrice(),
                product.getDiscount(),
                product.getUnit(),
                product.getImageUrl());
    }

    @Override
    public void updateProduct(Product product) {
        String sql = "UPDATE products SET name = ?, mrp = ?, dmart_price = ?, discount = ?, unit = ?, image_url = ? WHERE id = ?";
        jdbcTemplate.update(sql,
                product.getName(),
                product.getMrp(),
                product.getDmartPrice(),
                product.getDiscount(),
                product.getUnit(),
                product.getImageUrl(),
                product.getId());
    }

    @Override
    public void deleteProduct(int id) {
        String sql = "DELETE FROM products WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }
}