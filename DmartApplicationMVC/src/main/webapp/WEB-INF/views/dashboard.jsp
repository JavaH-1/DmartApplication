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
            background-color: #0d0d0d;
            color: #fff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .navbar {
            background-color: #1c1c1c;
            padding: 20px;
        }

        .navbar-brand, .nav-link {
            color: #ffffff !important;
            font-weight: 500;
            font-size: 1rem;
        }

        .container {
            margin-top: 40px;
        }

        .product-card {
            background-color: #1a1a1a;
            border-radius: 20px;
            padding: 20px;
            width: 100%;
            max-width: 310px;
            height: 350px;
            transition: all 0.3s ease-in-out;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: center;
            text-align: center;
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.05);
        }

        .product-card:hover {
            transform: scale(1.05);
            box-shadow: 0 0 15px rgba(255, 255, 255, 0.1);
        }

        .product-image {
            width: 140px;
            height: 140px;
            object-fit: cover;
            border-radius: 50%;
            border: 3px solid #ffffff;
        }

        .product-title {
            font-size: 1.1rem;
            font-weight: bold;
            color: #ffffff;
            margin-top: 10px;
        }

        .strike {
            text-decoration: line-through;
            color: #999999;
            font-size: 0.85rem;
        }

        .price {
            color: #ffcc00;
            font-size: 1.1rem;
            font-weight: bold;
        }

        .discount {
            background-color: #2e7d32;
            color: #fff;
            font-size: 0.75rem;
            padding: 4px 8px;
            border-radius: 10px;
            margin-top: 4px;
            display: inline-block;
        }

        .btn-add {
            background-color: #ff9800;
            color: #fff;
            font-weight: bold;
            width: 100%;
            border: none;
            font-size: 0.9rem;
            padding: 8px 0;
            border-radius: 8px;
        }

        .btn-add:hover {
            background-color: #e68900;
        }

        .welcome-msg {
            font-size: 1.3rem;
            margin-bottom: 30px;
            color: #ffcc00;
        }

        footer {
            margin-top: 100px;
            padding: 20px;
            background-color: #1c1c1c;
            color: #bbb;
            text-align: center;
        }

        @media (max-width: 768px) {
            .product-card {
                height: auto;
            }
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
                <li class="nav-item"><a class="nav-link" href="#">Track Order</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Payments</a></li>
                <li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
            </ul>
        </div>
    </nav>

    <!-- Welcome Section -->
    <div class="container text-center animate__animated animate__fadeInUp">
        <div class="welcome-msg">
            Welcome to D-Mart, <strong>${user.username != null ? user.username : 'Guest'}</strong>
        </div>

        <!-- Product Grid -->
        <div class="row justify-content-center">
            <c:forEach var="product" items="${productList}">
                <div class="col-md-6 col-lg-4 col-xl-3 mb-4 d-flex justify-content-center">
                    <div class="product-card">
                        <img src="${product.imageUrl}" alt="${product.name}" class="product-image">
                        <div class="product-title">${product.name}</div>
                        <div><span class="strike">₹${product.mrp}</span></div>
                        <div class="price">₹${product.dmartPrice}</div>
                        <div class="discount">&#8377;${product.discount} OFF</div>
                        <form method="post" action="addToCart" style="width: 100%;">
                            <input type="hidden" name="productId" value="${product.id}" />
                            <button type="submit" class="btn btn-add mt-2"><i class="fas fa-cart-plus"></i> Add to Cart</button>
                        </form>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 D-Mart. All rights reserved.</p>
    </footer>

    <!-- JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
