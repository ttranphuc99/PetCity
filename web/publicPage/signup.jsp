
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Pet City - Sign Up</title>

        <link rel="stylesheet" href="/PetCity/css/public-page/signup.css">
        <link rel="stylesheet" type="text/css" href="/PetCity/css/public-page/snackbar.css">
        <link rel="stylesheet" type="text/css" href="/PetCity/css/bootstrap/bootstrap.css">
        <script src="/PetCity/js/bootstrap/jquery-1.9.1.min.js"></script>
        <script src="/PetCity/js/bootstrap/popper.min.js"></script>
        <script src="/PetCity/js/bootstrap/bootstrap.js"></script>
    </head>

    <body>
        <div class="wrap-signup">
            <div class="wrap-form">
                <div class="label my-3">Sign Up</div>
                <div id="snackbar"><s:property value="%{mess}"/></div>

                <form action="/PetCity/signup" method="POST">
                    <div class="form-group">
                        <label for="txtUsername">Username:</label>
                        <input type="text" class="form-control" id="txtUsername" name="username" value='<s:property value="%{username}"/>'
                               required minlength="8" maxlength="20">
                    </div>

                    <div class="form-group">
                        <label for="txtPassword">Password:</label>
                        <input type="password" class="form-control" id="txtPassword" name="password" required minlength="6" maxlength="20">
                    </div>

                    <div class="form-group">
                        <label for="txtConfirm">Confirm Password:</label>
                        <input type="password" class="form-control" id="txtConfirm" name="confirm" required minlength="6" maxlength="20" oninput="checkMatchConfirmPass('txtConfirm', 'txtPassword')">
                    </div>

                    <div class="form-group">
                        <label for="txtFullname">Fullname:</label>
                        <input type="text" class="form-control" id="txtFullname" name="fullname" value='<s:property value="%{fullname}"/>'
                               required maxlength="50">
                    </div>

                    <label>Gender:</label>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" id="rdMale" value="Male" required>
                        <label class="form-check-label" for="rdMale">Male</label>
                    </div>

                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" id="rdFemale" value="Female" required>
                        <label class="form-check-label" for="rdFemale">Female</label>
                    </div>

                    <div class="form-group text-center py-3">
                        <input type="submit" class="btn btn-success w-50 font-label" name="action" value="Register">
                    </div>

                    <div class="text-center">
                        <a href="/PetCity/welcome" class="nav-link">Back to Home</a>
                    </div>
                </form>
            </div>
        </div>
        <script src="/PetCity/js/public-page/show-snackbar.js"></script>
        <script src="/PetCity/js/public-page/validate-signup.js"></script>
    </body>

</html>