<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Document</title>
  <link rel="stylesheet" type="text/css" href="../css/public-page/login.css">

  <link rel="stylesheet" type="text/css" href="../css/bootstrap/bootstrap.min.css">
  <script src="../js/bootstrap/jquery-1.9.1.min.js"></script>
  </script>
  <script src="../js/bootstrap/popper.min.js"></script>
  </script>
  <script src="../js/bootstrap/bootstrap.min.js"></script>
  </script>
</head>
<body>
  <div class="wrap-login">
    <div class="wrap-form">
      <div class="label my-3">Log In</div>

      <form action="">
        <div class="form-group">
          <label for="txtUsername">Username:</label>
          <input type="text" class="form-control" id="txtUsername" name="txtUsername" required>
        </div>

        <div class="form-group">
          <label for="txtPassword">Password:</label>
          <input type="password" class="form-control" id="txtPassword" name="txtPassword" required>
        </div>

        <div class="form-group text-center py-3">
          <input type="submit" class="btn btn-success w-50 font-label" name="action" value="Login">
        </div>

        <div class="text-center">
          <a href="signup.jsp" class="nav-link">Don't have an account? Register</a>
        </div>
      </form>
    </div>
  </div>
</body>

</html>