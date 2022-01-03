<%@page import="dtos.OrderDTO"%>
<%@page import="dtos.CartDTO"%>
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
        <jsp:useBean id="orderDAO" class="daos.OrderDAO" scope="request"></jsp:useBean>
        <jsp:useBean id="orderDetailDAO" class="daos.OrderDetailsDAO" scope="request"></jsp:useBean>
        </head>


        <body >

        <%
    //            response.setHeader("Cache-Control", "no-cache, no-store");
            UserDTO dto = (UserDTO) session.getAttribute("USER");
            CartDTO list = (CartDTO) session.getAttribute("LIST_CART");

            if (dto != null) {
                List<OrderDTO> list1 = (List) orderDAO.getListOrder(dto.getUserID());
                if (list1 == null || list1.isEmpty()) {
                    String mess2 = (String) request.getAttribute("SUCCESS");
                    String url = "home.jsp";
                    response.sendRedirect(url);
                    return;
                }
            } else if (dto == null) {

                String url = "home.jsp";
                response.sendRedirect(url);
                return;
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
                        <li class="nav-item">
                            <a href="listCart.jsp"class="nav-link waves-effect">
                                <span class="badge red z-depth-1 mr-1"> ${count} </span>
                                <i class="fas fa-shopping-cart"></i>
                                <span class="clearfix d-none d-sm-inline-block"> Cart </span>
                            </a>
                        </li>

                        <%                                if (dto == null) {
                        %>
                        <li class="nav-item" style="margin-right:5px;">

                            <a  href="register.jsp"class="nav-link border border-light rounded waves-effect"
                                target="_self" >
                                <i class="fas fa-user-plus"></i>Register
                            </a>

                        </li>
                        <%}%>

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
        <main style="margin-top:150px;margin-bottom: 229px">

            <h3>${requestScope.MESS}</h3>

            <div class="container">

                <a href="listOrder.jsp">Back to see my order</a>
                <div  >
                    <div>





                    </div>
                    <div>
                        <h3 style="text-align:center;">Your Order List</h3>



                        <table style="text-align: center;"class="table table-bordered">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>Product Name</th>
                                    <th>Description</th>
                                    <th>Image</th>
                                    <th>Quantity</th>

                                    <th>Unit Price $</th>


                                </tr>
                            </thead>
                            <tbody>


                                <c:forEach  var="detail" items="${orderDetailDAO.getListOrderDetails(param.orderID)}" varStatus="counter">
                                    <c:set var="dto" value="${moonDao.getProductByID(detail.productID)}"></c:set>
                                        <tr>
                                            <td>${counter.count}</td>
                                        <td>${dto.productName}</td>
                                        <td>${dto.description}</td>
                                        <td><img style="width:100px;"src='img/${dto.imageUrl}'></td>
                                        <td>${detail.quantity}</td>
                                        <td>${detail.unitPrice} $</td>




                                    </tr>
                                    </form>

                                </c:forEach>
                            </tbody>

                        </table>




                    </div>

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
