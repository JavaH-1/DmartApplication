<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>D-Mart Registration</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap" rel="stylesheet"/>

    <style>
        body {
            background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)),
                        url('https://images.unsplash.com/photo-1582407947304-fd86f028f716?auto=format&fit=crop&w=1470&q=80') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Nunito', sans-serif;
            min-height: 100vh;
            color: white;
        }

        .form-container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 40px 30px;
            border-radius: 20px;
            margin-top: 40px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.6);
            max-width: 850px;
            margin-left: auto;
            margin-right: auto;
        }

        .form-control, select, textarea {
            border-radius: 10px;
        }

        .btn-success {
            border-radius: 30px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-success:hover {
            transform: scale(1.05);
            background-color: #218838;
        }

        .logo {
            display: block;
            margin: 0 auto 20px auto;
            max-width: 120px;
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #ffc107;
            box-shadow: 0 4px 12px rgba(0,0,0,0.3);
        }

        h2 {
            font-weight: 700;
        }

        .alert {
            font-weight: 600;
        }

        @media (max-width: 768px) {
            .form-container {
                padding: 25px 20px;
                margin-top: 20px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="form-container animate__animated animate__fadeInDown">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjdZgP3mqdIe793oI97l4WSbZj4Od9eVOhgA&s" class="logo animate__animated animate__zoomIn" alt="D-Mart Logo"/>
        <h2 class="text-center mb-4"><i class="fas fa-user-plus"></i> Register with <span style="color:#ffc107;">D-Mart</span></h2>

        <form action="register" method="post">
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="fullname">Full Name</label>
                    <input type="text" id="fullname" name="fullname" class="form-control" placeholder="Enter full name" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" class="form-control" placeholder="Choose a username" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" class="form-control" placeholder="example@domain.com" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="mobile">Mobile</label>
                    <input type="text" id="mobile" name="mobile" class="form-control" placeholder="Enter mobile number" required>
                </div>
            </div>

            <div class="form-group">
                <label for="address">Address</label>
                <textarea id="address" name="address" class="form-control" placeholder="Enter full address" required></textarea>
            </div>

            <div class="form-row">
                <div class="form-group col-md-4">
                   <label for="state">State</label>
  <select name="stateId" id="state" class="form-control" required>
    <option value="">-- Select State --</option>
    <c:forEach var="s" items="${states}">
      <option value="${s.id}">${s.stateName}</option>
    </c:forEach>
  </select>
                </div>
                <div class="form-group col-md-4">
                    <label for="city">City</label>
  <select name="cityId" id="city" class="form-control" required>
    <option value="">-- Select City --</option>
    <!-- Options will be populated dynamically using AJAX -->
  </select>
                </div>
                <div class="form-group col-md-4">
                    <label for="pincode">Pincode</label>
                    <input type="text" id="pincode" name="pincode" class="form-control" placeholder="Enter pincode" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" class="form-control" placeholder="Choose a password" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="usertype">User Type</label>
                    <select id="usertype" name="usertype" class="form-control" required>
                        <option value="Customer">Customer</option>
                        <option value="Admin">Admin</option>
                    </select>
                </div>
            </div>

            <button type="submit" class="btn btn-success btn-block"><i class="fas fa-user-plus"></i> Register</button>

            <!-- Alerts -->
            <c:if test="${not empty msg}">
                <div class="alert alert-info mt-3 animate__animated animate__fadeIn">
                    <i class="fas fa-info-circle"></i> ${msg}
                </div>
            </c:if>

            <c:if test="${not empty success}">
                <div class="alert alert-success mt-3 animate__animated animate__fadeIn">
                    <i class="fas fa-check-circle"></i> ${success}
                </div>
            </c:if>

            <c:if test="${not empty error}">
                <div class="alert alert-danger mt-3 animate__animated animate__shakeX">
                    <i class="fas fa-exclamation-circle"></i> ${error}
                </div>
            </c:if>

            <p class="mt-3 text-center">Already have an account? <a href="login"><strong>Login here</strong></a></p>
        </form>
    </div>
</div>

<!-- AJAX Script -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
  $(document).ready(function () {
    $("#state").change(function () {
      var stateId = $(this).val();
      if (stateId) {
        $.ajax({
          url: "getCities",
          type: "GET",
          data: { stateId: stateId },
          success: function (cities) {
            var $cityDropdown = $("#city");
            $cityDropdown.empty();
            $cityDropdown.append("<option value=''>-- Select City --</option>");
            $.each(cities, function (index, city) {
              $cityDropdown.append("<option value='" + city.id + "'>" + city.cityName + "</option>");
            });
          },
          error: function () {
            alert("Failed to load cities!");
          }
        });
      } else {
        $("#city").empty().append("<option value=''>-- Select City --</option>");
      }
    });
  });
</script>

</body>
</html>
