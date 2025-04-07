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
    
    @Override
    public Product getProductById(int productId) {
        String sql = "SELECT * FROM products WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{productId}, (rs, rowNum) -> {
            Product p = new Product();
            p.setId(rs.getInt("id"));
            p.setName(rs.getString("name"));
            p.setMrp(rs.getDouble("mrp"));
            p.setDmartPrice(rs.getDouble("dmart_price"));
            p.setDiscount(rs.getDouble("discount"));
            p.setImageUrl(rs.getString("image_url"));
            p.setUnit(rs.getString("unit"));
            return p;
        });
    }

}
