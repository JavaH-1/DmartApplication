<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
</head>
<body>
    <h2>Register</h2>

    <form action="register" method="post">
        <label for="username">Username:</label><br>
        <input type="text" name="username" required><br><br>

        <label for="password">Password:</label><br>
        <input type="password" name="password" required><br><br>

        <label for="email">Email:</label><br>
        <input type="email" name="email" required><br><br>

        <label for="phone">Phone:</label><br>
        <input type="text" name="phone" maxlength="10"><br><br>

        <label for="age">Age:</label><br>
        <input type="number" name="age" min="1" max="120"><br><br>

        <label for="gender">Gender:</label><br>
        <select name="gender">
            <option value="">Select</option>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Other">Other</option>
        </select><br><br>

        <label for="address">Address:</label><br>
        <textarea name="address" rows="3" cols="30"></textarea><br><br>

        <label for="dob">Date of Birth:</label><br>
        <input type="date" name="dob"><br><br>

        <label for="role">Role:</label><br>
        <input type="text" name="role" value="USER"><br><br>

        <label for="enabled">Enabled:</label><br>
        <input type="checkbox" name="enabled" checked><br><br>

        <!-- created_at and updated_at are handled by DB and not needed in form -->

        <input type="submit" value="Register">
    </form>

    <p>Already registered? <a href="login">Login here</a></p>
</body>
</html>
