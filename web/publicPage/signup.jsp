<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Document</title>

        <link rel="stylesheet" href="/PetCity/css/public-page/signup.css">
        <link rel="stylesheet" type="text/css" href="/PetCity/css/bootstrap/bootstrap.min.css">
        <script src="/PetCity/js/bootstrap/jquery-1.9.1.min.js"></script>
        <script src="/PetCity/js/bootstrap/popper.min.js"></script>
        <script src="/PetCity/js/bootstrap/bootstrap.min.js"></script>
    </head>

    <body>
        <div class="wrap-signup">
            <div class="wrap-form">
                <div class="label my-3">Sign Up</div>

                <form action="">
                    <div class="form-group">
                        <label for="txtUsername">Username:</label>
                        <input type="text" class="form-control" id="txtUsername" name="txtUsername" required>
                    </div>

                    <div class="form-group">
                        <label for="txtPassword">Password:</label>
                        <input type="password" class="form-control" id="txtPassword" name="txtPassword" required>
                    </div>

                    <div class="form-group">
                        <label for="txtConfirm">Confirm Password:</label>
                        <input type="password" class="form-control" id="txtConfirm" name="txtConfirm" required>
                    </div>

                    <div class="form-group">
                        <label for="txtFullname">Fullname:</label>
                        <input type="text" class="form-control" id="txtFullname" name="txtFullname" required>
                    </div>

                    <label>Gender:</label>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="rdGender" id="rdMale" value="Male" required>
                        <label class="form-check-label" for="rdMale">Male</label>
                    </div>

                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="rdGender" id="rdFemale" value="Female" required>
                        <label class="form-check-label" for="rdFemale">Female</label>
                    </div>

                    <div class="form-group text-center py-3">
                        <input type="submit" class="btn btn-success w-50 font-label" name="action" value="Register">
                    </div>

                    <div class="text-center">
                        <a href="/PetCity/publicPage/index.jsp" class="nav-link">Back to Home</a>
                    </div>
                </form>
            </div>
        </div>
    </body>

</html>