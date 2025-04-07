<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>D-Mart Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
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

        .card {
            background-color: #1e1e2f;
            color: #ffffff;
            border: none;
            border-radius: 1rem;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.5);
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px);
        }

        .card i {
            font-size: 40px;
            margin-bottom: 15px;
            color: #ff9800;
        }

        .card-title {
            font-size: 1.5rem;
        }

        footer {
            margin-top: 182px;
            padding: 20px;
            background-color: #1f1f1f;
            color: #bbb;
            text-align: center;
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <a class="navbar-brand animate__animated animate__fadeInLeft" href="#"><i class="fas fa-store"></i> D-Mart</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link animate__animated animate__fadeInRight" href="#">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link animate__animated animate__fadeInRight" href="logout">Logout</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container text-center animate__animated animate__fadeInUp">
        <h1 class="mb-4">Welcome to D-Mart, <strong>${user.username}</strong></h1>
        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="card p-4">
                    <i class="fas fa-shopping-cart"></i>
                    <h5 class="card-title">Orders</h5>
                    <p class="card-text">Track your latest orders in real-time.</p>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card p-4">
                    <i class="fas fa-box"></i>
                    <h5 class="card-title">Products</h5>
                    <p class="card-text">View and manage available products.</p>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card p-4">
                    <i class="fas fa-users"></i>
                    <h5 class="card-title">Customers</h5>
                    <p class="card-text">Explore customer details and their activity.</p>
                </div>
            </div>
        </div>
    </div>

    <footer>
        <p>&copy; 2025 D-Mart. All rights reserved.</p>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
