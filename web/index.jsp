<html>
    <head>
        <title>Chris & Viktor's Butik</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="container">
        <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="">Kage Butik 85</a>
            </div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="index.jsp">Home</a></li>
                <li><a href="shop.jsp">Shop</a></li>
                <li><a href="" data-toggle="modal" data-target="#modalLogin">Login</a></li>
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <%
                    Object sessionbalance = session.getAttribute("sessionbalance");
                    if (sessionbalance == null)
                    sessionbalance = "0";
                    Object sessionusername = session.getAttribute("sessionusername");
                    if (sessionusername == null)
                    sessionusername = "Unknown";
                %>
                <li><a>Hello <%= sessionusername %>! <span class="glyphicon glyphicon-user"></span></a></li>
                <li><a>Balance: <%= sessionbalance %><span class="glyphicon glyphicon-usd"></span></a></li>
            </ul>
        </div>
        </nav>
            
        <div class="row">
            <div class="col-sm-12">
                <img src="http://i.imgur.com/c5zbOAE.png">
                <img src="http://i.imgur.com/DEP1Hah.png">
            </div>
        </div>

            
        
        
        
        <!--Login Modal-->
        <div id="modalLogin" class="modal fade" role="dialog">
        <div class="modal-dialog">

          <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"></button>
                <h4 class="modal-title">Login/Register</h4>
            </div>
            <div class="text-center">
            <div class="modal-body">
                <form action="Front" method="POST">
                    <p>Username:</p>
                    <input type="text" name="username" value="" />
                    <p>Password:</p>
                    <input type="password" name="password" value="" />
                    <br/><br/>
                    <button type="submit" class="btn btn-primary">Login</button><br/>
                    <a href="createacc.jsp" class="btn btn-link" target="_blank">Create Account</a>
                </form>
            </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
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
