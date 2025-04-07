package com.dmart.service;

import com.dmart.model.*;
import java.util.List;

public interface UserService {
    boolean registerUser(User user);
    User loginUser(String username, String password);
    List<State> getAllStates();
    List<City> getCitiesByStateId(int stateId);

    // ✅ Added method
    boolean checkEmailExists(String email);
}
