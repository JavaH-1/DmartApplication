package com.service;

import com.dao.UserDAO;
import com.model.User;

import java.util.List;

public class UserServiceImpl implements UserService {

    private UserDAO userDAO;

    // Setter for Dependency Injection via XML
    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    @Override
    public void register(User user) {
        user.setRole("USER");
        user.setEnabled(true);
        userDAO.saveUser(user);
    }

    @Override
    public User login(String username, String password) {
        User user = userDAO.findByUsername(username);
        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }

    @Override
    public List<User> findAllUsers() {
        return userDAO.findAllUsers();
    }
}
