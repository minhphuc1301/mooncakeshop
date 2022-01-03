<%@page import="daos.MoonCakeDAO"%>
<%@page import="java.util.List"%>
<%@page import="dtos.MoonCakeDTO"%>
<%@page import="dtos.UserDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Moon Cake Shop</title>
        <!-- Font Awesome -->

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="css/mdb.min.css" rel="stylesheet">
        <!-- Your custom styles (optional) -->
        <link href="css/style.min.css" rel="stylesheet">
        <link href="style_1.css" rel="stylesheet">
        <style type="text/css">
            html,
            body,
            header,
            .carousel {
                height: 60vh;
            }

            @media (max-width: 740px) {

                html,
                body,
                header,
                .carousel {
                    height: 100vh;
                }
            }

            @media (min-width: 800px) and (max-width: 850px) {

                html,
                body,
                header,
                .carousel {
                    height: 100vh;
                }
            }
            #btnLogin:hover{
                background-color: white;
            }
        </style>
        <jsp:useBean id="moonDao" class="daos.MoonCakeDAO" scope="request"></jsp:useBean>
        <jsp:useBean id="paging" class="controllers.PagingController" scope="request"></jsp:useBean>
        </head>


        <body >

        <%
//            response.setHeader("Cache-Control", "no-cache, no-store");
            UserDTO dto = (UserDTO) session.getAttribute("USER");

            if (dto == null || !dto.getRoleID().equals("AD")) {
                String url = "home.jsp";
                response.sendRedirect(url);

            }

        %>

        <!-- Navbar -->
        <nav class="navbar fixed-top navbar-expand-lg navbar-light white scrolling-navbar">
            <div class="container">

                <!-- Brand -->
                <a class="navbar-brand waves-effect" href="home.jsp" target="_blank">
                    <image src="img/mooncake.jpg" width="80px">
                    <strong class="red-text">Moon Cake Shop</strong>
                </a>

                <!-- Collapse -->
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <!-- Links -->
                <div class="collapse navbar-collapse" id="navbarSupportedContent">

                    <!-- Left -->
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link waves-effect" href="home.jsp#main-page">Home
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>

                    </ul>
                    <c:forEach var="cart" items="${sessionScope.LIST_CART.getCart().values()}" >

                        <c:set var="count" value="${count+1}"></c:set>
                    </c:forEach>
                    <!-- Right -->
                    <ul class="navbar-nav nav-flex-icons">



                        <li class="nav-item" style="margin-right:5px;">

                            <%                                if (dto == null) {
                            %>
                            <a  style="display:inline;text-decoration:none;color:black;" href="login.jsp"/>
                            <button id="btnLogin"class="nav-link border border-light rounded waves-effect"
                                    target="_blank">   
                                <i class="fas fa-sign-in-alt"></i>Login
                            </button>
                            </a>
                            <%   } else {%>   

                            <a href="admin.jsp" class="nav-link border border-light rounded waves-effect"
                               target="_top">
                                <i class="fas fa-edit"></i></i>Manage Product
                            </a>
                            <%}%>

                        </li>
                        <li class="nav-item" style="margin-right:5px;">

                            <%                                if (dto == null) {
                            %>
                            <a  style="display:inline;text-decoration:none;color:black;" href="login.jsp"/>
                            <button id="btnLogin"class="nav-link border border-light rounded waves-effect"
                                    target="_blank">   
                                <i class="fas fa-sign-in-alt"></i>Login
                            </button>
                            </a>
                            <%   } else {%>   

                            <a href="addproduct.jsp" class="nav-link border border-light rounded waves-effect"
                               target="_top">
                                <i class="fas fa-plus"></i></i>Add New Product
                            </a>
                            <%}%>

                        </li>
                        <li class="nav-item">


                            <c:url var="logout" value="MainController">
                                <c:param name="action" value="Logout"></c:param>
                            </c:url>

                            <%                                if (dto == null) {
                            %>
                            <a  style="display:inline;text-decoration:none;color:black;" href="login.jsp"/>
                            <button id="btnLogin"class="nav-link border border-light rounded waves-effect"
                                    target="_blank">   
                                <i class="fas fa-sign-in-alt"></i>Login
                            </button>
                            </a>
                            <%   } else {%>   
                            <a href="${pageScope.logout}" class="nav-link border border-light rounded waves-effect"
                               target="_blank">
                                <i class="fas fa-sign-in-alt"></i>Logout
                            </a>
                            <%}%>
                        </li>

                    </ul>

                </div>

            </div>
        </nav>



        <!--Main layout-->
        <main style="margin-top:150px;">
            <div class="container">
                <div class="center">
                    <h1>Add new product</h1>



                    <form action="AddProductController" method="post" enctype="multipart/form-data">
                        <div class="txt_field">

                            <input value="${param.productID}"type="text" name="productID"class="form-control"  id="username" required="">
                            <span></span>
                            <label>Product ID</label>

                        </div>
                        <p>${requestScope.ERROR.productIDError}
                        <div class="txt_field">

                            <input value="${param.productName}"type="text" name="productName"class="form-control"  id="username" required="">
                            <span></span>
                            <label>Product Name</label>

                        </div>

                        <div class="txt_field">
                            <input  value="${param.description}"type="text" name="description"class="form-control" required="">
                            <span></span>
                            <label>Description</label>
                        </div>

                        <div class="txt_field">
                            <input  value="${param.price}"type="text" name="price"class="form-control" required="">
                            <span></span>
                            <label>Price</label>
                        </div>

                        <p >${requestScope.ERROR.priceError}</p>
                        <div class="txt_field">
                            <input  value="${param.unit}"type="text" name="unit"class="form-control" required="">
                            <span></span>
                            <label>Unit In Stock</label>
                        </div>
                        <p >${requestScope.ERROR.unitInStockError}</p>
                        <label>Create Date</label>
                        <div class="txt_field">
                            <input  value="${param.from}"type="date" name="from"class="form-control" required="">
                            <span></span>
                        </div>
                        <p>${requestScope.ERROR.fromDateError}</p>

                        <label>Expire Date</label>
                        <div class="txt_field">
                            <input  value="${param.to}"type="date" name="to"class="form-control" required="">
                            <span></span>

                        </div>
                        <p >${requestScope.ERROR.toDateError}</p>
                        Select file to upload: <input value="${param.file}" type="file" name="file" size="60" /><br /><br /> 
                        <p>${requestScope.ERROR.imgError}</p>

                        <div  class="signup_link">
                            <span> <input class="form-check-input" type="radio" name="category" id="inlineRadio1" value="Golden Baked Mooncake" checked/>
                                <label class="form-check-label" for="inlineRadio1" >Golden Baked Mooncake </label>
                            </span>
                            <span style="margin-left:250px;"> <input class="form-check-input" type="radio" name="category" id="inlineRadio1" value="Soft Sticky Rice Mooncake" />
                                <label class="form-check-label" for="inlineRadio1" >Soft Sticky Rice Mooncake</label>
                            </span>
                        </div>





                        <input type="submit" name="action" value="Upload">
                    </form>
                

                </div>




            </div>
        </main>
        <!--Main layout-->

    </form>
    <!--Footer-->
    <footer class="page-footer text-center font-small mt-4 wow fadeIn">

        <!--Call to action-->
        <div class="pt-4">
            <a class="btn btn-outline-white" href="https://mdbootstrap.com/docs/jquery/getting-started/download/" target="_blank"
               role="button">Download MDB
                <i class="fas fa-download ml-2"></i>
            </a>
            <a class="btn btn-outline-white" href="https://mdbootstrap.com/education/bootstrap/" target="_blank" role="button">Start
                free tutorial
                <i class="fas fa-graduation-cap ml-2"></i>
            </a>
        </div>
        <!--/.Call to action-->

        <hr class="my-4">

        <!-- Social icons -->
        <div class="pb-4">
            <a href="https://www.facebook.com/mdbootstrap" target="_blank">
                <i class="fab fa-facebook-f mr-3"></i>
            </a>

            <a href="https://twitter.com/MDBootstrap" target="_blank">
                <i class="fab fa-twitter mr-3"></i>
            </a>

            <a href="https://www.youtube.com/watch?v=7MUISDJ5ZZ4" target="_blank">
                <i class="fab fa-youtube mr-3"></i>
            </a>

            <a href="https://plus.google.com/u/0/b/107863090883699620484" target="_blank">
                <i class="fab fa-google-plus-g mr-3"></i>
            </a>

            <a href="https://dribbble.com/mdbootstrap" target="_blank">
                <i class="fab fa-dribbble mr-3"></i>
            </a>

            <a href="https://pinterest.com/mdbootstrap" target="_blank">
                <i class="fab fa-pinterest mr-3"></i>
            </a>

            <a href="https://github.com/mdbootstrap/bootstrap-material-design" target="_blank">
                <i class="fab fa-github mr-3"></i>
            </a>

            <a href="http://codepen.io/mdbootstrap/" target="_blank">
                <i class="fab fa-codepen mr-3"></i>
            </a>
        </div>
        <!-- Social icons -->

        <!--Copyright-->
        <div class="footer-copyright py-3">
            © 2021 Copyright:
            <a href="home.jsp" target="_blank"> Moon Cake Shop </a>
        </div>
        <!--/.Copyright-->

    </footer>
    <!--/.Footer-->

    <!-- SCRIPTS -->
    <!-- JQuery -->
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="js/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="js/mdb.min.js"></script>
    <!-- Initializations -->
    <script type="text/javascript">
        <%
            String mess1 = (String) request.getAttribute("MESS");
            if (mess1 != null) {

        %>
        alert("${requestScope.MESS}");
        <%}%>
        function deleteConf()
        {
            document.getElementById("confirm").style.display = "inline";
            document.getElementById("${count1}").style.display = "inline";
        }
        <%
            String mess = (String) request.getAttribute("MESSAGE1");
            if (mess != null) {
        %>
        alert("${requestScope.MESSAGE1}");
        <%}%>
        window.onload = function () {



            var bootstrapButton = $.fn.button.noConflict(); // return $.fn.button to previously assigned value
            $.fn.bootstrapBtn = bootstrapButton;
            $("#myBtn1").click(function () {
                $("#myModal").modal('hide');
                $("#myModal1").modal('show');

            });


        };

        <%
            String error1 = (String) session.getAttribute("ERROR");
            if (error1 != null) {
        %>
        $("#myModal").modal('show');




        <%}%>


        <%    String a = (String) request.getAttribute("index1");
            if (a != null) {
        %>
        document.getElementById('${index}').style.color = "black";
        <%
        } else {
        %>
        document.getElementById('1').style.color = "black";
        <%
            }
        %>
        // Animations initialization



        new WOW().init();

    </script>
</body>

</html>
