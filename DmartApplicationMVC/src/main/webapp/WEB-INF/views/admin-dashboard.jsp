<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - D-Mart</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">

    <!-- Font Awesome Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

    <style>
    body {
        background-color: #121212;
        font-family: 'Roboto', sans-serif;
        padding: 20px;
    }

    /* Make all text white and bold */
    body, h1, h2, h3, h4, h5, h6, p, th, td, label, input, button, a, span, div {
        color: #fff !important;
        font-weight: 700 !important;
    }

    .form-control, .btn {
        border-radius: 8px;
    }

    .form-control {
        background-color: #1f1f1f;
        border: 1px solid #444;
        color: #ffffff !important; /* <--- ensures typed text is white */
        font-weight: bold !important;
    }

    .form-control::placeholder {
        color: #ffffff !important; /* <--- white placeholder */
        opacity: 1;
        font-weight: bold;
    }

    .form-control:focus {
        border-color: #0d6efd;
        box-shadow: none;
        background-color: #1f1f1f;
        color: #ffffff !important;
    }

    input, select, textarea {
        color: #ffffff !important;
        background-color: #1f1f1f !important;
        font-weight: bold;
    }

    .btn-primary {
        background-color: #0d6efd;
        border: none;
    }

    .btn-danger {
        background-color: #dc3545;
        border: none;
    }

    .table-dark th {
        background-color: #222;
    }

    img {
        border-radius: 5px;
    }

    .card {
        background-color: #1e1e1e;
        border: none;
        box-shadow: 0 0 10px rgba(0,0,0,0.4);
        margin-bottom: 2rem;
    }

    .table thead {
        background-color: #292929;
    }

    .table tbody tr {
        background-color: #1c1c1c;
        border-bottom: 1px solid #333;
    }

    .table-hover tbody tr:hover {
        background-color: #2a2a2a;
    }

    .icon {
        color: #0d6efd;
    }
</style>


</head>
<body class="animate__animated animate__fadeIn">

<div class="container">
    <h1 class="mb-4"><i class="fas fa-user-shield icon"></i> Welcome, Admin</h1>

    <!-- Add Product Form -->
    <div class="card p-4 mb-5">
        <h2><i class="fas fa-box-open icon"></i> Add Product</h2>
        <form action="${pageContext.request.contextPath}/admin/addProduct" method="post" class="row g-3 mt-2">
            <div class="col-md-6">
                <label class="form-label fw-bold text-white">Product Name</label>
                <input type="text" name="name" class="form-control" placeholder="Enter product name" required />
            </div>
            <div class="col-md-3">
                <label class="form-label fw-bold text-white">MRP</label>
                <input type="number" step="0.01" name="mrp" class="form-control" placeholder="Enter MRP" required />
            </div>
            <div class="col-md-3">
                <label class="form-label fw-bold text-white">Dmart Price</label>
                <input type="number" step="0.01" name="dmartPrice" class="form-control" placeholder="Enter Dmart price" required />
            </div>
            <div class="col-md-3">
                <label class="form-label fw-bold text-white">Discount (%)</label>
                <input type="number" step="0.01" name="discount" class="form-control" placeholder="Enter discount" required />
            </div>
            <div class="col-md-3">
                <label class="form-label fw-bold text-white">Unit</label>
                <input type="text" name="unit" class="form-control" placeholder="E.g., 1kg, 500ml" required />
            </div>
            <div class="col-md-6">
                <label class="form-label fw-bold text-white">Image URL</label>
                <input type="text" name="imageUrl" class="form-control" placeholder="Paste image URL" />
            </div>
            <div class="col-12 text-end">
                <button type="submit" class="btn btn-primary"><i class="fas fa-plus-circle"></i> Add Product</button>
            </div>
        </form>
    </div>

    <!-- Product List -->
    <div class="card p-4">
        <h2><i class="fas fa-list icon"></i> All Products</h2>
        <div class="table-responsive mt-3">
            <table class="table table-dark table-hover">
                <thead>
                    <tr>
                        <th>ID</th><th>Name</th><th>MRP</th><th>Dmart Price</th><th>Discount</th><th>Unit</th><th>Image</th><th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="product" items="${productList}">
                        <tr>
                            <td>${product.id}</td>
                            <td>${product.name}</td>
                            <td>&#8377; ${product.mrp}</td>
                            <td>&#8377; ${product.dmartPrice}</td>
                            <td>${product.discount}%</td>
                            <td>${product.unit}</td>
                            <td>
                                <c:if test="${not empty product.imageUrl}">
                                    <img src="${product.imageUrl}" width="50" height="50" alt="Product Image"/>
                                </c:if>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/admin/deleteProduct/${product.id}" class="btn btn-danger btn-sm" onclick="return confirm('Delete this product?')">
                                    <i class="fas fa-trash-alt"></i> Delete
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Customer List -->
    <div class="card p-4 mt-5">
        <h2><i class="fas fa-users icon"></i> Registered Customers</h2>
        <div class="table-responsive mt-3">
            <table class="table table-dark table-hover">
                <thead>
                    <tr>
                        <th>ID</th><th>Full Name</th><th>Username</th><th>Email</th><th>Mobile</th><th>Address</th><th>Pincode</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${customerList}">
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.fullname}</td>
                            <td>${user.username}</td>
                            <td>${user.email}</td>
                            <td>${user.mobile}</td>
                            <td>${user.address}</td>
                            <td>${user.pincode}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Bootstrap JS CDN -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
