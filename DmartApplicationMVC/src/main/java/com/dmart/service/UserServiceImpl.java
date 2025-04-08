package com.dmart.service;

import com.dmart.dao.UserDAO;
import com.dmart.model.*;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import com.dmart.mapper.UserRowMapper;


@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO dao;
    
    @Autowired
    private JdbcTemplate jdbcTemplate;


    @Override
    public boolean registerUser(User user) {
        return dao.registerUser(user);
    }

    @Override
    public User loginUser(String username, String password) {
        return dao.loginUser(username, password);
    }

    @Override
    public List<State> getAllStates() {
        return dao.getAllStates();
    }

    @Override
    public List<City> getCitiesByStateId(int stateId) {
        return dao.getCitiesByStateId(stateId);
    }

    // ✅ Added method implementation
    @Override
    public boolean checkEmailExists(String email) {
        return dao.isEmailRegistered(email);
    }
    
    @Override
    public List<User> getAllCustomers() {
        String sql = "SELECT * FROM users WHERE usertype = 'customer'";
        return jdbcTemplate.query(sql, new UserRowMapper());
    }

}