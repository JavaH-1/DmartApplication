<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>D-Mart Dashboard</title>

    <!-- Bootstrap & Icons -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

    <style>
        body {
            background-color: #121212;
            color: #ffffff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .navbar {
            background-color: #1f1f1f;
        }

        .navbar-brand, .nav-link {
            color: #fff !important;
        }

        .container {
            margin-top: 50px;
        }

        .small-card {
            background-color: #1e1e2f;
            color: #ffffff;
            border: none;
            border-radius: 0.75rem;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.3);
            transition: transform 0.3s ease;
        }

        .small-card:hover {
            transform: translateY(-5px);
        }

        .product-image-mini {
            width: 60px;
            height: 60px;
            object-fit: contain;
            margin-top: 10px;
        }

        .btn-add {
            background-color: #ff9800;
            color: #fff;
            border: none;
            font-size: 0.85rem;
        }

        .btn-add:hover {
            background-color: #e68900;
        }

        .card-title, .card-text {
            font-size: 0.9rem;
            margin-bottom: 0.25rem;
        }

        footer {
            margin-top: 60px;
            padding: 20px;
            background-color: #1f1f1f;
            color: #bbb;
            text-align: center;
        }
    </style>
</head>

<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <a class="navbar-brand animate__animated animate__fadeInLeft" href="#"><i class="fas fa-store"></i> D-Mart</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse animate__animated animate__fadeInRight" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="#">Dashboard</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Product List</a></li>
                <li class="nav-item"><a class="nav-link" href="#">View Cart</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Delivery Tracking</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Payments</a></li>
                <li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
            </ul>
        </div>
    </nav>

    <!-- Welcome Section -->
    <div class="container text-center animate__animated animate__fadeInUp">
        <h2 class="mb-4">Welcome to D-Mart, <strong>${user.username}</strong></h2>

        <!-- Product Display Grid -->
        <div class="row">
            <c:forEach var="product" items="${productList}">
                <div class="col-6 col-sm-3 mb-3">
                    <div class="card text-center p-2 small-card">
                        <img src="${product.imageUrl}" class="card-img-top product-image-mini mx-auto" alt="Product">
                        <div class="card-body p-2">
                            <h6 class="card-title">${product.name}</h6>
                            <p class="card-text">₹${product.price}</p>
                            <form method="post" action="addToCart">
                                <input type="hidden" name="productId" value="${product.id}" />
                                <button type="submit" class="btn btn-sm btn-add btn-block">Add</button>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 D-Mart. All rights reserved.</p>
    </footer>

    <!-- JS Scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
