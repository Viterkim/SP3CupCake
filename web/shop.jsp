<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.CakePart"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="data.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop Page</title>
    </head>
    <%
        Connection con = DB.getConnection();
        CakePart currentTop, currentBot;
    %>
    <body>
        <div class="container">
        <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="index.jsp">Kage Butik 85</a>
            </div>
            <ul class="nav navbar-nav">
                <li><a href="index.jsp">Home</a></li>
                <li class="active"><a href="">Shop</a></li>
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
            <div class="col-sm-8">
                <p align="center"><button data-toggle="modal" data-target="#modalCake" type="button" class="btn btn-primary btn-block btn-lg">Add/Create New Cupcake!</button></p>
                
                <div class="col-md-4">
                    <h2>The Tops</h2>
                        <h3>Chocolate | 5$</h3>
                        <img src="https://www.brainscape.com/blog/wp-content/uploads/2014/07/Chocolate.jpg" width="125" height="125"/>
                        <h3>Vanilla | 5$</h3>
                        <img src="http://www.vapeland.co.uk/ekmps/shops/deankenny/images/-nicotine-strength-24mg-nicotine-strength--[1]-288-p.jpg" width="125" height="125"/>
                        <h3>Rasberry | 5$</h3>
                        <img src="https://www.colourbox.com/preview/4578756-ripe-rasberry-background-close-up-macro-shot-of-raspberries.jpg" width="125" height="125"/>
                        <h3>Crispy | 6$</h3>
                        <img src="http://www.cbc.ca/inthekitchen/assets_c/2013/01/Chips05-thumb-596x350-260906.jpg" width="125" height="125"/>
                        <h3>Strawberry | 6$</h3>
                        <img src="https://upload.wikimedia.org/wikipedia/commons/2/29/PerfectStrawberry.jpg" width="125" height="125"/>
                        <h3>Rum/Raisin | 7$</h3>
                        <img src="https://www.haagendazs.us/images/products/packingshots/ps_IceCream_RumRaisin.png" width="125" height="125"/>
                        <h3>Orange | 8$</h3>
                        <img src="https://realfood.tesco.com/media/images/Orange-and-almond-srping-cake-hero-58d07750-0952-47eb-bc41-a1ef9b81c01a-0-472x310.jpg" width="125" height="125"/>
                        <h3>Lemon | 8$</h3>
                        <img src="http://dingo.care2.com/pictures/greenliving/1296/1295735.large.jpg" width="125" height="125"/>
                        <h3>Blue Cheese | 9$</h3>
                        <img src="http://cdn.skim.gs/image/upload/v1456338951/msi/blue_cheese_emvg1c.jpg" width="125" height="125"/>
                    </br>
                </div>
                
                <div class="col-md-4">
                    <h2>The Bottoms</h2>
                    <h3>Chocolate | 5$</h3>
                    <img src="https://upload.wikimedia.org/wikipedia/commons/9/9f/Chocolate(bgFFF).jpg" width="125" height="125"/>
                    <h3>Vanilla | 5$</h3>
                    <img src="http://cdn.playbuzz.com/cdn/41e0e11f-c5ba-4771-80c9-0a8acd36244a/accef4b6-f28e-489e-9c06-98525d8c299b.jpg" width="125" height="125"/>
                    <h3>Nutmeg | 5$</h3>
                    <img src="http://www.seedguides.info/nutmeg/nutmeg.jpg" width="125" height="125"/>
                    <h3>Pistacio | 6$</h3>
                    <img src="https://images7.alphacoders.com/370/370832.jpg" width="125" height="125"/>
                
                    <h3>Almond | 7$</h3>
                    <img src="https://www.nuts.com.au/wp-content/uploads/2013/11/almonds.jpg" width="125" height="125"/>
                </div>
                
                

            </div>
            <div class="col-sm-4">
                <p align="center"><button onclick="clearBasket()" type="button" class="btn btn-danger btn-block btn-lg">Clear Basket</button></p>
                <h1>Basket:</h1>
                <form action="CheckOut" method="POST">
                    <div id="basketCon">
                        <!--Fedt Indhold Her-->
                    </div>
                    <p align="center"><button type="submit" class="btn btn-success btn-lg">Checkout</button></p>
                </form>
            </div>
        </div>
            

            
            
            
        <!--Create Cupcake Modal-->
        <div id="modalCake" class="modal fade" role="dialog">
        <div class="modal-dialog">

          <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"></button>
                <h4 class="modal-title">Create A New Cupcake</h4>
            </div>
            <div class="text-center">
            <div class="modal-body">
                <!--Preparing Cake Parts + Array-->
                <%
                    ArrayList<CakePart> topAr = new ArrayList<>();
                    ArrayList<CakePart> botAr = new ArrayList<>();
                    
                    //Top
                    String sql = "SELECT * FROM caketop";
                    PreparedStatement stmt = con.prepareCall(sql);
                    stmt.execute();
                    ResultSet rs = stmt.getResultSet();
                    while(rs.next())
                    {
                        String cpName = rs.getString("Name");
                        String cpPrice = rs.getString("Price");
                        CakePart cp = new CakePart("top", cpName, cpPrice);
                        topAr.add(cp);
                    }
                    //Bottom
                    String sql2 = "SELECT * FROM cakebottom;";
                    stmt = con.prepareCall(sql2);
                    stmt.execute();
                    rs = stmt.getResultSet();
                    while(rs.next())
                    {
                        String cpName = rs.getString("Name");
                        String cpPrice = rs.getString("Price");
                        CakePart cp = new CakePart("bottom", cpName, cpPrice);
                        botAr.add(cp);
                    }                    

                %>
                <!--<form id="cakeForm" action="Front" method="POST"> hvis du glemmer at tage bukser på-->
                    <h3>Select The Top Part:</h3>
                    <select id="topdrop" name="topdrop">
                        <%
                            for(int i = 0; i < topAr.size(); i++)
                            {
                                out.println("<option>" + topAr.get(i).toString() + "</option>");
                            }
                        %>
                    </select>
                    <h3>Select The Bottom Part:</h3>
                    <select id="bottomdrop" name="bottomdrop">
                        <%
                            for(int i = 0; i < botAr.size(); i++)
                            {
                                out.println("<option>" + botAr.get(i).toString() + "</option>");
                            }
                        %>
                    </select>
                    <br/><br/>
                    <button id="addCake" onclick="bingo()" class="btn btn-success btn-lg" data-dismiss="modal">Add to Basket</button><br/>
            </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
          

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
            
        
        <!--Own Scripts-->
        <script src="scripts/cakedropdown.js" type="text/javascript"></script>
        
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>
</html>
