<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to D-Mart</title>

    <!-- Meta Tags for Responsiveness -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap" rel="stylesheet">

    <!-- Custom Styles -->
    <style>
        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)),
                        url('https://images.unsplash.com/photo-1582407947304-fd86f028f716?auto=format&fit=crop&w=1470&q=80') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Nunito', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: white;
        }

        .welcome-box {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            padding: 60px 40px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.7);
            width: 100%;
            max-width: 600px;
            animation: fadeIn 1s ease-in-out;
            text-align: center;
        }

        .logo {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 20px;
            border: 3px solid #ffc107;
        }

        h1 {
            font-weight: 700;
            font-size: 2.5rem;
            margin-bottom: 20px;
        }

        .lead {
            font-size: 1.2rem;
            margin-bottom: 30px;
        }

        .btn-custom {
            padding: 12px 30px;
            font-size: 1.1rem;
            border-radius: 30px;
            transition: all 0.3s ease;
            font-weight: 600;
        }

        .btn-success {
            background-color: #28a745;
            border: none;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
        }

        .btn-custom:hover {
            transform: scale(1.05);
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.3);
        }

        @media (max-width: 768px) {
            .welcome-box {
                padding: 40px 25px;
            }

            .logo {
                width: 80px;
                height: 80px;
            }

            h1 {
                font-size: 2rem;
            }

            .lead {
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>

    <div class="welcome-box animate__animated animate__zoomIn">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjdZgP3mqdIe793oI97l4WSbZj4Od9eVOhgA&s"
             alt="D-Mart Logo" class="logo animate__animated animate__zoomIn" />
        
        <h1><i class="fas fa-store"></i> Welcome to <span class="text-warning">D-Mart</span></h1>
        <p class="lead">Your one-stop shop for everything, anytime, anywhere!</p>
        <a href="register" class="btn btn-success btn-custom m-2"><i class="fas fa-user-plus"></i> Register</a>
        <a href="login" class="btn btn-primary btn-custom m-2"><i class="fas fa-sign-in-alt"></i> Login</a>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
