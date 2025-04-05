package com.dao;

import com.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class UserDAOImpl implements UserDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Helper method to map a ResultSet row to User
    private User mapUser(ResultSet rs, int rowNum) throws SQLException {
        User user = new User();
        user.setId(rs.getInt("id"));
        user.setUsername(rs.getString("username"));
        user.setPassword(rs.getString("password"));
        user.setEmail(rs.getString("email"));
        user.setPhone(rs.getString("phone"));
        user.setAge(rs.getInt("age"));
        user.setGender(rs.getString("gender"));
        user.setAddress(rs.getString("address"));
        user.setDob(rs.getDate("dob") != null ? rs.getDate("dob").toLocalDate() : null);
        user.setRole(rs.getString("role"));
        user.setEnabled(rs.getBoolean("enabled"));
        user.setCreatedAt(rs.getTimestamp("created_at") != null ? rs.getTimestamp("created_at").toLocalDateTime() : null);
        user.setUpdatedAt(rs.getTimestamp("updated_at") != null ? rs.getTimestamp("updated_at").toLocalDateTime() : null);
        return user;
    }

    @Override
    public void saveUser(User user) {
        String sql = "INSERT INTO users (username, password, email, phone, age, gender, address, dob, role, enabled, created_at) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())";

        jdbcTemplate.update(sql,
                user.getUsername(), user.getPassword(), user.getEmail(), user.getPhone(),
                user.getAge(), user.getGender(), user.getAddress(), user.getDob(),
                user.getRole(), user.isEnabled()
        );
    }


    @Override
    public User findByUsername(String username) {
        String sql = "SELECT * FROM users WHERE username = ?";
        return jdbcTemplate.queryForObject(sql, this::mapUser, username);
    }

    @Override
    public List<User> findAllUsers() {
        String sql = "SELECT * FROM users";
        return jdbcTemplate.query(sql, this::mapUser);
    }
}
