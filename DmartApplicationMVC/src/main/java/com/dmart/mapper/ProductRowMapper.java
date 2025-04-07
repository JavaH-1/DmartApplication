package com.dmart.mapper;

import com.dmart.model.Product;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductRowMapper implements RowMapper<Product> {
    @Override
    public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
        Product product = new Product();
        product.setId(rs.getInt("id"));
        product.setName(rs.getString("name"));
        product.setMrp(rs.getDouble("mrp"));
        product.setDmartPrice(rs.getDouble("dmart_price"));
        product.setDiscount(rs.getDouble("discount"));
        product.setImageUrl(rs.getString("image_url"));
        product.setUnit(rs.getString("unit"));
        return product;
    }
}
