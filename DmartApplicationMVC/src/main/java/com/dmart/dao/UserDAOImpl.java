package com.dmart.dao;

import com.dmart.model.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public boolean registerUser(User user) {
        String sql = "INSERT INTO users(fullname, username, email, mobile, password, address, state_id, city_id, pincode, usertype) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        int rows = jdbcTemplate.update(sql, user.getFullname(), user.getUsername(), user.getEmail(), user.getMobile(),
                user.getPassword(), user.getAddress(), user.getStateId(), user.getCityId(), user.getPincode(), user.getUsertype());
        return rows > 0;
    }

    @Override
    public User loginUser(String username, String password) {
        String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new Object[]{username, password}, new RowMapper<User>() {
                public User mapRow(ResultSet rs, int rowNum) throws SQLException {
                    User user = new User();
                    user.setId(rs.getInt("id"));
                    user.setUsername(rs.getString("username"));
                    user.setFullname(rs.getString("fullname"));
                    user.setEmail(rs.getString("email"));
                    user.setUsertype(rs.getString("usertype"));
                    return user;
                }
            });
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<State> getAllStates() {
        String sql = "SELECT * FROM states";
        return jdbcTemplate.query(sql, new RowMapper<State>() {
            public State mapRow(ResultSet rs, int rowNum) throws SQLException {
                State state = new State();
                state.setId(rs.getInt("id"));
                state.setStateName(rs.getString("state_name"));
                return state;
            }
        });
    }

    @Override
    public List<City> getCitiesByStateId(int stateId) {
        String sql = "SELECT * FROM cities WHERE state_id = ?";
        return jdbcTemplate.query(sql, new Object[]{stateId}, new RowMapper<City>() {
            public City mapRow(ResultSet rs, int rowNum) throws SQLException {
                City city = new City();
                city.setId(rs.getInt("id"));
                city.setCityName(rs.getString("city_name"));
                city.setStateId(rs.getInt("state_id"));
                return city;
            }
        });
    }

    @Override
    public boolean isEmailRegistered(String email) {
        String sql = "SELECT COUNT(*) FROM users WHERE email = ?";
        Integer count = jdbcTemplate.queryForObject(sql, new Object[]{email}, Integer.class);
        return count != null && count > 0;
    }
}
