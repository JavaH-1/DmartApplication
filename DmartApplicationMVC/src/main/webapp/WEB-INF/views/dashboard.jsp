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
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            background-color: #0d0d0d;
            color: #fff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .navbar {
            position: fixed;
            top: 0;
            padding-top: 24px;
            width: 100%;
            z-index: 1100;
        }

        .navbar .navbar-brand {
    font-weight: bold;
    color: #ffcc00 !important;
    font-size: 1.8rem; /* Add this line or adjust as needed */
}


        .navbar .nav-link,
        .navbar .dropdown-toggle {
            color: #ffcc00 !important;
            font-weight: bold;
             font-size: 1.3rem;
        }

        .navbar .dropdown-menu {
            background-color: #1c1c1c;
            color: white;
        }

        .navbar .dropdown-menu a {
            color: white;
        }

        .sidebar {
            position: fixed;
            top: 56px;
            left: 0;
            width: 240px;
            height: calc(100% - 56px);
            background-color: #1c1c1c;
            padding-top: 30px;
            z-index: 1000;
        }

        .sidebar a {
            padding: 15px 20px;
            display: block;
            color: #fff;
            text-decoration: none;
            font-size: 1rem;
            font-weight: 500;
        }

        .sidebar a:hover, .sidebar a.active {
            background-color: #333;
            color: #ffcc00;
        }

        .content-area {
            margin-left: 240px;
            padding: 100px 30px 30px 30px;
        }

        .welcome-msg {
            font-size: 2.3rem;
            margin-bottom: 30px;
            color: #ffcc00;
        }

        .product-card {
            background-color: #1a1a1a;
            border-radius: 30px;
            padding: 15px;
            width: 100%;
            height: 100%;
            transition: all 0.3s ease-in-out;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: center;
            text-align: center;
            box-shadow: 0 0 10px rgba(25, 25, 25, 0.05);
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

        #cart-alert {
            top: 80px;
            right: 80px;
            z-index: 1050;
            font-size: 0.9rem;
            padding: 8px 16px;
        }

        @media (max-width: 768px) {
            .sidebar {
                position: relative;
                width: 100%;
                height: auto;
                top: 0;
            }

            .content-area {
                margin-left: 0;
                padding-top: 120px;
            }
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="dashboard">
        <i class="fas fa-store"></i> D-Mart
    </a>

    <div class="ml-auto d-flex align-items-center">
        <div class="dropdown mr-4">
            <a class="nav-link dropdown-toggle" href="#" id="navbarUserDropdown" role="button" data-toggle="dropdown">
                <i class="fas fa-user-circle"></i> ${user.username}
            </a>
            <div class="dropdown-menu dropdown-menu-right">
                <a class="dropdown-item" href="#">My Profile</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="logout">Logout</a>
            </div>
        </div>
    </div>
</nav>

<!-- Sidebar -->
<div class="sidebar">
    <a class="active" href="dashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
    <a href="viewcart">
        <i class="fas fa-shopping-cart"></i> Cart
        <c:if test="${cartSize > 0}">
            <span class="badge badge-warning">${cartSize}</span>
        </c:if>
    </a>
    <a href="#"><i class="fas fa-shipping-fast"></i> Track Order</a>
    <a href="#"><i class="fas fa-credit-card"></i> Payments</a>
</div>

<!-- Main Content -->
<div class="content-area">
    <div class="container text-center animate__animated animate__fadeInUp">
        <div class="welcome-msg">
            Welcome to D-Mart, <strong>${user.username != null ? user.username : 'Guest'}</strong>
        </div>

        <div class="row">
            <c:forEach var="product" items="${productList}">
                <div class="col-md-6 col-lg-4 col-xl-3 mb-4 d-flex align-items-stretch">
                    <div class="product-card w-100">
                        <img src="${product.imageUrl}" alt="${product.name}" class="product-image">
                        <div class="product-title">${product.name}</div>
                        <div><span class="strike">₹${product.mrp}</span></div>
                        <div class="price">₹${product.dmartPrice}</div>
                        <div class="discount">&#8377;${product.discount} OFF</div>
                        <form class="add-to-cart-form" style="width: 100%;">
                            <input type="hidden" name="productId" value="${product.id}" />
                            <button type="submit" class="btn btn-add mt-2">
                                <i class="fas fa-cart-plus"></i> Add to Cart
                            </button>
                        </form>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<!-- Cart Alert -->
<div id="cart-alert" class="alert alert-success alert-dismissible fade show position-fixed" role="alert" style="display: none;">
    <strong>Success!</strong> Item added to cart.
    <button type="button" class="close" onclick="$('#cart-alert').hide();">&times;</button>
</div>

<!-- JS -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
    $(document).ready(function () {
        $('.add-to-cart-form').on('submit', function (e) {
            e.preventDefault();
            var form = $(this);
            var productId = form.find('input[name="productId"]').val();

            $.ajax({
                url: 'addToCart',
                type: 'POST',
                data: { productId: productId },
                success: function () {
                    $('#cart-alert').fadeIn();
                    setTimeout(function () {
                        $('#cart-alert').fadeOut();
                    }, 2000);
                },
                error: function () {
                    alert("Error adding item to cart.");
                }
            });
        });
    });
</script>
</body>
</html>
