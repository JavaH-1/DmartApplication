<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>D-Mart Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap, Font Awesome, Animate.css, Google Fonts -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap" rel="stylesheet" />

    <style>
        body {
            margin: 0;
            padding: 0;
            background: url('https://images.unsplash.com/photo-1582407947304-fd86f028f716?auto=format&fit=crop&w=1470&q=80') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Nunito', sans-serif;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
        }

        .login-box {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 40px 30px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.6);
            width: 100%;
            max-width: 440px;
            animation: fadeIn 1s ease-in-out;
        }

        .login-box h2 {
            font-weight: 700;
            font-size: 1.8rem;
            margin-bottom: 25px;
        }

        .login-box img {
    width: 100px;
    height: 100px;
    object-fit: cover;
    border-radius: 50%;
    border: 3px solid #ffc107;
    box-shadow: 0 4px 12px rgba(0,0,0,0.3);
}

        }

        .form-control:focus {
            box-shadow: none;
            border-color: #ffc107;
        }

        .btn-primary {
            background-color: #28a745;
            border: none;
            border-radius: 30px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #218838;
            transform: scale(1.05);
        }

        .alert {
            font-weight: 600;
            font-size: 0.9rem;
        }

        .register-link {
            margin-top: 15px;
            font-size: 0.95rem;
        }

        .register-link a {
            color: #ffc107;
            font-weight: bold;
            text-decoration: none;
        }

        .register-link a:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .login-box {
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>

<div class="login-box animate__animated animate__zoomIn">
    <div class="text-center">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjdZgP3mqdIe793oI97l4WSbZj4Od9eVOhgA&s" alt="D-Mart Logo" class="mb-2 rounded-circle shadow-sm">
        <h2><i class="fas fa-sign-in-alt"></i> Login to <span style="color:#ffc107;">D-Mart</span></h2>
    </div>

    <form action="login" method="post" class="mt-4">
        <div class="form-group">
            <label for="username"><i class="fas fa-user"></i> Username</label>
            <input type="text" name="username" id="username" class="form-control" placeholder="Enter username" required>
        </div>

        <div class="form-group">
            <label for="password"><i class="fas fa-lock"></i> Password</label>
            <input type="password" name="password" id="password" class="form-control" placeholder="Enter password" required>
        </div>

        <button type="submit" class="btn btn-primary btn-block"><i class="fas fa-arrow-right"></i> Login</button>

        <!-- Alerts -->
        <c:if test="${not empty msg}">
            <div class="alert alert-info mt-3 animate__animated animate__fadeIn text-center">
                <i class="fas fa-info-circle"></i> ${msg}
            </div>
        </c:if>

        <c:if test="${not empty success}">
            <div class="alert alert-success mt-3 animate__animated animate__fadeIn text-center">
                <i class="fas fa-check-circle"></i> ${success}
            </div>
        </c:if>

        <c:if test="${not empty error}">
            <div class="alert alert-danger mt-3 animate__animated animate__shakeX text-center">
                <i class="fas fa-exclamation-triangle"></i> ${error}
            </div>
        </c:if>

        <p class="register-link text-center">New to D-Mart? <a href="register">Register here</a></p>
    </form>
</div>

<!-- JS Libraries -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
