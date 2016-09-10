<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Creation</title>
    </head>
    <body>
        <div class="container">
        <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <div class="text-center">
                <h2>Account Creation:</h2>
                <form action="Account" method="POST">
                <p>Username:</p>
                <input type="text" name="username" value="" />
                <p>Password:</p>
                <input type="password" name="password" value="" />
                <br/><br/>
                <button type="submit" class="btn btn-info">Create Account</button><br/>
                <h3 id="accerror"></h3>
                </form>
                </div>
            </div>
        </div>
        
        
        </div>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>
</html>
