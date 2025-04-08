package com.dmart.dao;

import com.dmart.model.*;
import java.util.List;

public interface UserDAO {
    boolean registerUser(User user);
    User loginUser(String username, String password);
    List<State> getAllStates();
    List<City> getCitiesByStateId(int stateId);

    // ✅ Added method
    boolean isEmailRegistered(String email);
}