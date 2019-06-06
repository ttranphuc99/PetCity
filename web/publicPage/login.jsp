<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Pet City - Login</title>
        <link rel="stylesheet" type="text/css" href="/PetCity/css/public-page/login.css">
        <link rel="stylesheet" type="text/css" href="/PetCity/css/public-page/snackbar.css">
        <link rel="stylesheet" type="text/css" href="/PetCity/css/bootstrap/bootstrap.min.css">
        <script src="/PetCity/js/bootstrap/jquery-1.9.1.min.js"></script>
        <script src="/PetCity/js/bootstrap/popper.min.js"></script>
        <script src="/PetCity/js/bootstrap/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="wrap-login">
            <div class="wrap-form">
                <div class="label my-3">Log In</div>
                <div id="snackbar"><s:property value="%{errorMess}"/></div>
                <form action="/PetCity/login" method="POST">
                    <div class="form-group">
                        <label for="username">Username:</label>
                        <input type="text" name="username" id="username" class="form-control" required>
                    </div>

                    <div class="form-group">
                        <label for="password">Password:</label>
                        <input type="password" name="password" id="password" class="form-control" required>
                    </div>

                    <div class="form-group text-center py-3">
                        <input type="submit" name="action" value="Login" class="btn btn-success w-50 font-label">
                    </div>

                    <div class="text-center">
                        <a href="/PetCity/publicPage/signup.jsp" class="nav-link">Don't have an account? Register</a>
                        <a href="/PetCity/publicPage/index.jsp" class="nav-link">Back to Home</a>
                    </div>
                </form>
            </div>
        </div>
        <script src="/PetCity/js/public-page/show-snackbar.js"></script>
    </body>

</html>