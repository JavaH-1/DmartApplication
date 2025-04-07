<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; }
        h2 { margin-top: 40px; }
        form { margin-bottom: 30px; }
        input, textarea, select, button {
            padding: 8px;
            margin: 5px;
            width: 250px;
        }
        table { width: 100%; border-collapse: collapse; margin-top: 10px; }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }
        th { background-color: #f4f4f4; }
        .btn-delete {
            background-color: red;
            color: white;
            padding: 5px 12px;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>

<h1>Welcome, Admin</h1>

<!-- Add Product Form -->
<h2>Add Product</h2>
<form action="${pageContext.request.contextPath}/admin/addProduct" method="post">
    <input type="text" name="name" placeholder="Product Name" required /><br/>
    <input type="number" step="0.01" name="mrp" placeholder="MRP" required /><br/>
    <input type="number" step="0.01" name="dmartPrice" placeholder="Dmart Price" required /><br/>
    <input type="number" step="0.01" name="discount" placeholder="Discount (%)" required /><br/>
    <input type="text" name="unit" placeholder="Unit (e.g., 1kg, 500ml)" required /><br/>
    <input type="text" name="imageUrl" placeholder="Image URL" /><br/>
    <button type="submit">Add Product</button>
</form>

<!-- Product List -->
<h2>All Products</h2>
<table>
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
            <td>${product.mrp}</td>
            <td>${product.dmartPrice}</td>
            <td>${product.discount} &#8377;</td>
            <td>${product.unit}</td>
            <td>
                <c:if test="${not empty product.imageUrl}">
                    <img src="${product.imageUrl}" width="50"/>
                </c:if>
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/admin/deleteProduct/${product.id}" class="btn-delete" onclick="return confirm('Delete this product?')">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<!-- Customer List -->
<h2>Registered Customers</h2>
<table>
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

</body>
</html>
