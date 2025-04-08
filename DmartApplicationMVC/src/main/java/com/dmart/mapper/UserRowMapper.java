package com.dmart.mapper;

import com.dmart.model.User;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserRowMapper implements RowMapper<User> {
    @Override
    public User mapRow(ResultSet rs, int rowNum) throws SQLException {
        User user = new User();
        user.setId(rs.getInt("id"));
        user.setFullname(rs.getString("fullname"));
        user.setUsername(rs.getString("username"));
        user.setEmail(rs.getString("email"));
        user.setMobile(rs.getString("mobile"));
        user.setPassword(rs.getString("password"));
        user.setAddress(rs.getString("address"));
        user.setPincode(rs.getString("pincode"));
        user.setUsertype(rs.getString("usertype"));
        user.setStateId(rs.getInt("state_id"));
        user.setCityId(rs.getInt("city_id"));
        return user;
    }
}