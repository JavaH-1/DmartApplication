package com.dmart.dao;

import com.dmart.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class ProductDAOImpl implements ProductDAO {

    @Autowired
    private DataSource dataSource;

    @Override
    public List<Product> getAllProducts() {
        List<Product> productList = new ArrayList<>();

        String sql = "SELECT * FROM products";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setMrp(rs.getDouble("mrp"));
                product.setDmartPrice(rs.getDouble("dmart_price"));
                product.setDiscount(rs.getDouble("discount"));
                product.setImageUrl(rs.getString("image_url"));
                product.setUnit(rs.getString("unit"));

                productList.add(product);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productList;
    }

	@Override
	public Product getProductById(int id) {
		// TODO Auto-generated method stub
		return null;
	}
}
