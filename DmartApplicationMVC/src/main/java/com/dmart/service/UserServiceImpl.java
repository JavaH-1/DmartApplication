package com.dmart.service;

import com.dmart.dao.UserDAO;
import com.dmart.model.*;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO dao;

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
}
