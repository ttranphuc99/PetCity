<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Document</title>
  <link rel="stylesheet" type="text/css" href="../css/public-page/header-footer.css">

  <link rel="stylesheet" type="text/css" href="../css/bootstrap/bootstrap.min.css">
  <script src="../js/bootstrap/jquery-1.9.1.min.js"></script>
  </script>
  <script src="../js/bootstrap/popper.min.js"></script>
  </script>
  <script src="../js/bootstrap/bootstrap.min.js"></script>
  </script>
</head>

<body>
  <header>
    <div class="row mx-5 my-4 text-center align-items-center">
      <!-- logo -->
      <div class="col-3">
        <img class="header-logo" src="../img/header-footer/petcity.png">
      </div>

      <!-- search -->
      <div class="col-6" style="margin-top: 10px">
        <form action="">
          <div class="row">
            <div class="form-group has-danger col-10 mx-0 px-0">
              <input type="text" name="txtSearch" class="form-control form-control-danger" placeholder="Search..."
                required>
            </div>
            <div class="col-2 mx-0 px-0">
              <input type="submit" class="btn btn-primary" name="action" value="Search">
            </div>
          </div>
        </form>
      </div>

      <!-- login + cart -->
      <div class="col-3">
        <div class="row">
          <!-- login btn -->
          <div class="col-8">
              <a href="login.jsp" class="btn btn-danger" role="button">Login</a>
          </div>

          <!-- cart -->
          <div class="col-4 wrap-cart">
            <a href="#" class="nav-link">
              <div class="row">
                <div class="col-12">
                  <div class="icon-quantity">0</div>
                </div>
              </div>

              <div class="row">
                <div class="col-12">
                  <img src="../img/header-footer/red-shopping-cart-hi.png" class="img-cart">
                </div>
              </div>
            </a>
          </div>
        </div>
      </div>
    </div>
  </header>

  <nav>
    <div class="row text-center align-items-center w-100">
      <div class="col-2"></div>
      <div class="col-2"><a href="#" role="button" class="nav-link">SHOP FOR DOG</a></div>
      <div class="col-2"><a href="#" role="button" class="nav-link">SHOP FOR CAT</a></div>
      <div class="col-2"><a href="#" role="button" class="nav-link">SHOP FOR HAMSTER</a></div>
      <div class="col-2"><a href="#" role="button" class="nav-link">SERVICE</a></div>
      <div class="col-2"></div>
    </div>
  </nav>
