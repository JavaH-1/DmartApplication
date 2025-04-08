<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>D-Mart Admin Dashboard</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap, Font Awesome, Animate.css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">

    <style>
        body { background-color: #121212; font-family: 'Roboto', sans-serif; }
        .section-title { color: gold; font-weight: bold; margin-bottom: 20px; }

        .form-control, .btn { border-radius: 8px; }

        .form-control {
            background-color: #1f1f1f !important;
            border: 1px solid #444;
            color: #fff !important;
            caret-color: #ffffff;
        }

        .form-control::placeholder { color: #bbb !important; }

        .form-control:focus {
            border-color: #0d6efd;
            box-shadow: 0 0 0 0.15rem rgba(13, 110, 253, 0.25);
        }

        input:-webkit-autofill {
            -webkit-box-shadow: 0 0 0 30px #1f1f1f inset !important;
            -webkit-text-fill-color: #ffffff !important;
            border: 1px solid #444 !important;
        }

        .btn-primary { background-color: #0d6efd; }
        .btn-danger { background-color: #dc3545; }
        .btn-warning { background-color: #ffc107; color: #000; }

        .table-dark th { background-color: #222; }
        .table tbody tr { background-color: #1c1c1c; border-bottom: 1px solid #333; }
        .table-hover tbody tr:hover { background-color: #2a2a2a; }

        .card {
            background-color: #1e1e1e;
            border: none;
            box-shadow: 0 0 10px rgba(0,0,0,0.4);
            margin-bottom: 2rem;
        }

        .sidebar {
            height: 100vh;
            background-color: #1a1a1a;
            padding-top: 30px;
            position: fixed;
            top: 0;
            left: 0;
            width: 16.666667%;
            z-index: 1000;
        }

        .sidebar a {
            display: block;
            color: #fff;
            padding: 15px 20px;
            font-weight: bold;
            border-bottom: 1px solid #333;
            text-decoration: none;
        }

        .sidebar a:hover {
            background-color: #0d6efd;
            color: white;
        }

        .icon { color: #0d6efd; margin-right: 8px; }
        .content-area { margin-left: 16.666667%; padding: 30px; }
        .form-label { color: #fff; font-weight: bold; }
        img.rounded-circle { object-fit: cover; }

        .custom-alert {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 9999;
            min-width: 250px;
            max-width: 300px;
            font-size: 0.85rem;
            padding: 10px 15px;
            opacity: 0.95;
        }
    </style>
</head>
<body class="animate__animated animate__fadeIn">

<!-- ALERT MESSAGE FOR SUCCESS/DELETE -->
<c:if test="${not empty message}">
    <div class="alert ${alertClass eq 'alert-success' ? 'alert-success' : 'alert-danger'} alert-dismissible fade show custom-alert shadow-sm" role="alert" id="autoDismissAlert">
        ${message}
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>

<div class="container-fluid">
    <div class="row min-vh-100">
        <!-- Sidebar -->
        <div class="col-md-2 sidebar">
            <h4 class="text-white text-center mb-4"><i class="fas fa-user-shield icon"></i> Admin Panel</h4>
            <a href="javascript:void(0);" onclick="showSection('productForm')"><i class="fas fa-plus-circle icon"></i> Add/Edit Product</a>
            <a href="javascript:void(0);" onclick="showSection('allProducts')"><i class="fas fa-list icon"></i> All Products</a>
            <a href="javascript:void(0);" onclick="showSection('customers')"><i class="fas fa-users icon"></i> Registered Customers</a>
            <a href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt icon"></i> Logout</a>
        </div>

        <!-- Main Content -->
        <div class="col-md-10 offset-md-2 content-area">
            <!-- Add/Edit Product -->
            <div class="card p-4 mb-5" id="productForm">
                <h2 class="section-title">
                    <i class="fas fa-box-open"></i>
                    <c:choose>
                        <c:when test="${not empty editing}">Edit Product</c:when>
                        <c:otherwise>Add Product</c:otherwise>
                    </c:choose>
                </h2>

                <form action="${pageContext.request.contextPath}/admin/${empty editing ? 'addProduct' : 'updateProduct'}" method="post" class="row g-3 mt-2">
                    <c:if test="${not empty editing}">
                        <input type="hidden" name="id" value="${editing.id}" />
                    </c:if>
                    <div class="col-md-6">
                        <label class="form-label">Product Name</label>
                        <input type="text" name="name" class="form-control" value="${editing.name}" placeholder="Enter product name" required />
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">MRP</label>
                        <input type="number" step="0.01" name="mrp" class="form-control" value="${editing.mrp}" placeholder="Enter MRP" required />
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Dmart Price</label>
                        <input type="number" step="0.01" name="dmartPrice" class="form-control" value="${editing.dmartPrice}" placeholder="Enter discounted price" required />
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Discount (%)</label>
                        <input type="number" step="0.01" name="discount" class="form-control" value="${editing.discount}" placeholder="Enter discount %" required />
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Unit</label>
                        <input type="text" name="unit" class="form-control" value="${editing.unit}" placeholder="E.g. 1kg, 500ml" required />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Image URL</label>
                        <input type="text" name="imageUrl" class="form-control" value="${editing.imageUrl}" placeholder="Paste product image URL" />
                    </div>
                    <div class="col-12 text-end">
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save"></i>
                            <c:choose>
                                <c:when test="${not empty editing}">Update</c:when>
                                <c:otherwise>Add</c:otherwise>
                            </c:choose> Product
                        </button>
                    </div>
                </form>
            </div>

            <!-- All Products -->
            <div class="card p-4" id="allProducts" style="display:none;">
                <h2 class="section-title"><i class="fas fa-list"></i> All Products</h2>
                <div class="table-responsive mt-3">
                    <table class="table table-dark table-hover">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>MRP</th>
                            <th>Dmart Price</th>
                            <th>Discount</th>
                            <th>Unit</th>
                            <th>Image</th>
                            <th>Action</th>
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
                                        <img src="${product.imageUrl}" width="50" height="50" class="rounded-circle border border-light" />
                                    </c:if>
                                </td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/admin/editProduct/${product.id}" class="btn btn-warning btn-sm"><i class="fas fa-edit"></i> Edit</a>
                                    <a href="${pageContext.request.contextPath}/admin/deleteProduct/${product.id}" class="btn btn-danger btn-sm" onclick="return confirm('Delete this product?')"><i class="fas fa-trash-alt"></i> Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Registered Customers -->
            <div class="card p-4 mt-5" id="customers" style="display:none;">
                <h2 class="section-title"><i class="fas fa-users"></i> Registered Customers</h2>
                <div class="table-responsive mt-3">
                    <table class="table table-dark table-hover">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Full Name</th>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Mobile</th>
                            <th>Address</th>
                            <th>Pincode</th>
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
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function showSection(sectionId) {
        const sections = ['productForm', 'allProducts', 'customers'];
        sections.forEach(id => {
            document.getElementById(id).style.display = (id === sectionId) ? 'block' : 'none';
        });
    }

    window.onload = function () {
        const isEditing = '${not empty editing}';
        if (isEditing === 'true') {
            showSection('productForm');
        }

        const alertBox = document.getElementById("autoDismissAlert");
        if (alertBox) {
            setTimeout(() => {
                const alert = bootstrap.Alert.getOrCreateInstance(alertBox);
                alert.close();
            }, 3000);
        }
    };
</script>

</body>
</html>