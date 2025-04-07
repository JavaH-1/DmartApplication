package com.dmart.dao;

import com.dmart.model.*;
import java.sql.*;
import java.util.*;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO {

    @Autowired
    private DataSource dataSource;

    @Override
    public boolean registerUser(User user) {
        String sql = "INSERT INTO users(fullname, username, email, mobile, password, address, state_id, city_id, pincode, usertype) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user.getFullname());
            ps.setString(2, user.getUsername());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getMobile());
            ps.setString(5, user.getPassword());
            ps.setString(6, user.getAddress());
            ps.setInt(7, user.getStateId());
            ps.setInt(8, user.getCityId());
            ps.setString(9, user.getPincode());
            ps.setString(10, user.getUsertype());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public User loginUser(String username, String password) {
        String sql = "SELECT * FROM users WHERE username=? AND password=?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(username);
                user.setFullname(rs.getString("fullname"));
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<State> getAllStates() {
        List<State> list = new ArrayList<>();
        String sql = "SELECT * FROM states";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                State s = new State();
                s.setId(rs.getInt("id"));
                s.setStateName(rs.getString("state_name"));
                list.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<City> getCitiesByStateId(int stateId) {
        List<City> list = new ArrayList<>();
        String sql = "SELECT * FROM cities WHERE state_id=?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, stateId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                City c = new City();
                c.setId(rs.getInt("id"));
                c.setCityName(rs.getString("city_name"));
                c.setStateId(stateId);
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // ✅ Implemented the missing method
    @Override
    public boolean isEmailRegistered(String email) {
        String sql = "SELECT COUNT(*) FROM users WHERE email=?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
