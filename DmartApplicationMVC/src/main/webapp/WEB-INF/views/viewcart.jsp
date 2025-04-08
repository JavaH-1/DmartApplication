<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Your Cart - D-Mart</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
</head>
<body class="bg-dark text-white">
    <div class="container mt-5">
        <h2 class="text-warning mb-4">🛒 Your Cart</h2>
        <c:choose>
            <c:when test="${empty cartItems}">
                <p>Your cart is empty.</p>
            </c:when>
            <c:otherwise>
                <table class="table table-bordered text-white">
                    <thead class="thead-light text-dark">
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
                                <td>${item.name}</td>
                                <td>₹${item.mrp}</td>
                                <td>₹${item.dmartPrice}</td>
                                <td>${item.discount}</td>
                                <td>${item.unit}</td>
                                <td>
                                    <a href="removeFromCart?productId=${item.id}" class="btn btn-sm btn-danger">Remove</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
        <a href="dashboard" class="btn btn-warning">Continue Shopping</a>
    </div>
</body>
</html>