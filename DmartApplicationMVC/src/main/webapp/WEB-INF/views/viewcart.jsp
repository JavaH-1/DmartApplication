<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Your Cart - D-Mart</title>

    <!-- Bootstrap & Icons -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>

    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            background-color: #121212;
            color: #fff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            overflow: hidden;
        }

        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
        }

        .footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            padding: 10px;
            text-align: center;
            background-color: #1e1e1e;
            color: #aaa;
            font-size: 0.9rem;
            border-top: 1px solid #333;
        }

        .main-content {
            position: absolute;
            top: 56px;
            bottom: 50px;
            left: 0;
            right: 0;
            overflow-y: auto;
            padding: 20px;
        }

        .container {
            margin-top: 20px;
        }

        h2 {
            font-weight: 600;
            margin-bottom: 30px;
        }

        table {
            background-color: #1e1e1e;
            border-radius: 12px;
            overflow: hidden;
        }

        th {
            background-color: #f8f9fa;
            color: #000;
        }

        td {
            vertical-align: middle;
        }

        .btn-danger {
            font-size: 0.85rem;
        }

        .btn-warning {
            font-weight: bold;
            margin-top: 20px;
        }

        .cart-empty {
            background-color: #1e1e1e;
            padding: 30px;
            border-radius: 10px;
            text-align: center;
        }

        .cart-empty p {
            font-size: 1.1rem;
            color: #bbb;
        }

        .continue-icon {
            margin-right: 6px;
        }

        .discount-label {
            background-color: #28a745;
            color: #fff;
            padding: 4px 8px;
            border-radius: 10px;
            font-size: 0.8rem;
            display: inline-block;
        }

        .table th, .table td {
            text-align: center;
        }

        .product-img {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 50%;
            border: 2px solid #fff;
            margin-right: 10px;
        }

        .product-name {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .logout-link {
            font-weight: bold;
            font-size: 1rem;
            color: #ffc107 !important;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand text-warning font-weight-bold" href="dashboard">
        <i class="fas fa-store"></i> <strong>D-Mart</strong>
    </a>
    <div class="collapse navbar-collapse">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link logout-link" href="logout">
                    <i class="fas fa-sign-out-alt"></i> <strong>Logout</strong>
                </a>
            </li>
        </ul>
    </div>
</nav>

<!-- Main Content -->
<div class="main-content">
    <div class="container">
        <h2 class="text-warning"><i class="fas fa-shopping-cart"></i> Your Cart</h2>

        <c:choose>
            <c:when test="${empty cartItems}">
                <div class="cart-empty">
                    <p><i class="fas fa-shopping-basket fa-3x mb-3 text-secondary"></i><br>Your cart is currently empty.</p>
                    <a href="dashboard" class="btn btn-outline-warning mt-3">
                        <i class="fas fa-arrow-left continue-icon"></i>Continue Shopping
                    </a>
                </div>
            </c:when>
            <c:otherwise>
                <div class="table-responsive">
                    <table class="table table-bordered text-white">
                        <thead>
                        <tr>
                            <th>Product</th>
                            <th>MRP</th>
                            <th>D-Mart Price</th>
                            <th>Discount</th>
                            <th>Unit</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="item" items="${cartItems}">
                            <tr>
                                <td class="product-name">
                                    <img src="${item.imageUrl}" alt="${item.name}" class="product-img"
                                         onerror="this.onerror=null;this.src='images/default.png';"/>
                                    <span>${item.name}</span>
                                </td>
                                <td>₹${item.mrp}</td>
                                <td><span class="text-warning font-weight-bold">₹${item.dmartPrice}</span></td>
                                <td><span class="discount-label">₹${item.discount} OFF</span></td>
                                <td>${item.unit}</td>
                                <td>
                                    <a href="removeFromCart?productId=${item.id}" class="btn btn-sm btn-danger">
                                        <i class="fas fa-trash-alt"></i> Remove
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <a href="dashboard" class="btn btn-warning">
                    <i class="fas fa-arrow-left continue-icon"></i>Continue Shopping
                </a>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<!-- Footer -->
<div class="footer">
    &copy; 2025 D-Mart. All rights reserved.
</div>

</body>
</html>
