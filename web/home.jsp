<%@page import="java.util.List"%>
<%@page import="dtos.OrderDTO"%>
<%@page import="daos.OrderDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.math.RoundingMode"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="daos.MoonCakeDAO"%>

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
        </head>


        <body >

        <%
//            response.setHeader("Cache-Control", "no-cache, no-store");
            UserDTO dto = (UserDTO) session.getAttribute("USER");

            if (dto != null && dto.getRoleID().equals("AD")) {
                String url = "admin.jsp";
                response.sendRedirect(url);
                return;

            }

        %>

        <!-- Navbar -->
        <nav class="navbar fixed-top navbar-expand-lg navbar-light white scrolling-navbar">
            <div class="container">

                <!-- Brand -->
                <a class="navbar-brand waves-effect" href="home.jsp" target="_self">
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

                        <c:if test="${orderDAO.getListOrder(sessionScope.USER.getUserID())!=null and sessionScope.USER!=null and not empty orderDAO.getListOrder(sessionScope.USER.getUserID())}">
                            <li class="nav-item" style="margin-right:5px;">

                                <a  href="listOrder.jsp"class="nav-link border border-light rounded waves-effect"
                                    target="_self" >
                                    <i class="fas fa-user-plus"></i>View My Order
                                </a>

                            </li>
                        </c:if>

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

        <!--Carousel Wrapper-->
        <div id="carousel-example-1z" class="carousel slide carousel-fade pt-4" data-ride="carousel">

            <!--Indicators-->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-1z" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-1z" data-slide-to="1"></li>
                <li data-target="#carousel-example-1z" data-slide-to="2"></li>
            </ol>
            <!--/.Indicators-->

            <!--Slides-->
            <div class="carousel-inner" role="listbox">

                <!--First slide-->
                <div class="carousel-item active">
                    <div class="view" style="background-image: url('https://cf.shopee.vn/file/ab48d45758fcbbf13f4c57a0edb0d560'); background-repeat: no-repeat; background-size: cover;">
                        <!-- Mask & flexbox options-->
                        <div class="mask rgba-black-strong d-flex justify-content-center align-items-center">

                            <!-- Content -->
                            <div class="text-center white-text mx-5 wow fadeIn">
                                <h1 class="mb-4">
                                    <strong>Hi ${sessionScope.USER.getFullName()}, Welcome to Moon Cake Shop </strong>
                                </h1>                         
                                <a  href="#main-page" class="btn btn-outline-white btn-lg">Start
                                    shopping
                                    <i class="fas fa-shopping-cart"></i>
                                </a>
                            </div>
                            <!-- Content -->
                        </div>
                        <!-- Mask & flexbox options-->

                    </div>
                </div>
                <!--/First slide-->

                <!--Second slide-->
                <div class="carousel-item">
                    <div class="view" style="background-image: url('https://cf.shopee.vn/file/7db87a0b6f860deae9ede7909579e7db'); background-repeat: no-repeat; background-size: cover;">
                        <!-- Mask & flexbox options-->
                        <div class="mask rgba-black-strong d-flex justify-content-center align-items-center">

                            <!-- Content -->
                            <div class="text-center white-text mx-5 wow fadeIn">
                                <h1 class="mb-4">
                                    <strong>Hi ${sessionScope.USER.getFullName()}, Welcome to Moon Cake Shop </strong>
                                </h1>                         
                                <a  href="#main-page" class="btn btn-outline-white btn-lg">Start
                                    shopping
                                    <i class="fas fa-shopping-cart"></i>
                                </a>
                            </div>
                            <!-- Content -->
                        </div>
                        <!-- Mask & flexbox options-->

                    </div>
                </div>
                <!--/Second slide-->

                <!--Third slide-->
                <div class="carousel-item">
                    <div class="view" style="background-image: url('https://cf.shopee.vn/file/99538d923998cb8791a90f6caeb40c23'); background-repeat: no-repeat; background-size: cover;">
                        <!-- Mask & flexbox options-->
                        <div class="mask rgba-black-strong d-flex justify-content-center align-items-center">

                            <!-- Content -->
                            <div class="text-center white-text mx-5 wow fadeIn">
                                <h1 class="mb-4">
                                    <strong>Hi ${sessionScope.USER.getFullName()}, Welcome to Moon Cake Shop </strong>
                                </h1>                         
                                <a  href="#main-page" class="btn btn-outline-white btn-lg">Start
                                    shopping
                                    <i class="fas fa-shopping-cart"></i>
                                </a>
                            </div>
                            <!-- Content -->
                        </div>
                        <!-- Mask & flexbox options-->

                    </div>
                </div>
                <!--/Third slide-->

            </div>
            <!--/.Slides-->

            <!--Controls-->
            <a class="carousel-control-prev" href="#carousel-example-1z" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carousel-example-1z" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
            <!--/.Controls-->

        </div>
        <!--/.Carousel Wrapper-->

        <!--Main layout-->
        <main id="main-page">
            <div class="container">

                <!--Navbar-->
                <nav class="navbar navbar-expand-lg navbar-dark mdb-color lighten-3 mt-3 mb-5">

                    <!-- Navbar brand -->
                    <span class="navbar-brand">Categories:</span>

                    <!-- Collapse button -->
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#basicExampleNav"
                            aria-controls="basicExampleNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <!-- Collapsible content -->
                    <div class="collapse navbar-collapse" id="basicExampleNav">
                        <c:set var="tag" value="4"></c:set>
                        <c:if test="${requestScope.cate==1 or requestScope.cate==2}">
                            <c:set var="tag" value="5"></c:set>
                        </c:if>
                        <!-- Links -->
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item ${requestScope.cate==3?"active":tag==4?"active":""}">
                                <a class="nav-link" href="PagingController?search=&cate=">All</a>
                            </li>
                            <li class="nav-item ${requestScope.cate==1?"active":""} ">
                                <a class="nav-link" href="PagingController?search=&cate='Golden Baked'">Golden Baked Mooncake</a>
                            </li>

                            <li class="nav-item ${requestScope.cate==2?"active":""}">

                                <a class="nav-link" href="PagingController?search=&cate='Soft Sticky'">Soft Sticky Rice Mooncake</a>
                            </li>

                        </ul>
                        <!-- Links -->

                        <form action="PagingController"class="form-inline">

                            <select disabled style="display:none;"id="search3"name="search3">
                                <option value="30">Less than 30$</option>
                                <option value="60">30$ -> 60$</option>
                                <option value="90">More than 60$</option>
                            </select>

                            <input onclick=" if (document.getElementById('search3').style.display == 'none') {
                                        document.getElementById('search3').style.display = 'block'
                                        document.getElementById('search3').style = 'block'
                                        document.getElementById('search3').disabled = '';
                                        
                                    } else {
                                        document.getElementById('search3').disabled = 'disabled';
                                        document.getElementById('search3').style.display = 'none';
                                    }" type="checkbox"  value="${param.vehicle1}" value="Bike">
                            <label for="vehicle1"> Search by price</label><br>

                            <div class="md-form my-0">
                                <input value="${param.search}"name="search"class="form-control mr-sm-2" type="text" placeholder="Search by name" aria-label="Search">
                                <input style="border:none;"class="fas fa-search" type="submit"  action="search">
                                <input type="hidden" name="index" value="1">
                                <input type="hidden" name="cate2" value="${requestScope.cate2}">
                                <input type="hidden" name="cate" value="${requestScope.cate}">



                            </div>

                        </form>
                    </div>
                    <!-- Collapsible content -->

                </nav>
                <!--/.Navbar-->

                <!--Section: Products v.3-->
                <section class="text-center mb-4">

                    <!--Grid row-->
                    <div class="row wow fadeIn">
                        <%
                            List<MoonCakeDTO> list1 = (List) moonDao.pageingProduct(1);
                            HttpSession session1 = request.getSession();
                            session.setAttribute("list", list1);

                        %>
                        <c:if test="${sessionScope.list !=null and requestScope.LIST1==null and requestScope.LIST2==null}"> 
                            <c:forEach items="${list}" var="p">

                                <c:url var="add" value="MainController">
                                    <c:param name="productID" value="${p.productID}"></c:param>
                                    <c:param name="productName" value="${p.productName}"></c:param>
                                    <c:param name="price" value="${p.price}"></c:param>
                                    <c:param name="unitInstock" value="${p.unitInStock}"></c:param>
                                    <c:param name="index" value="${param.index}"></c:param>
                                    <c:param name="search" value="${param.search}"></c:param>
                                    <c:param name="amount" value="${p.unitInStock}"></c:param>
                                    <c:param name="image" value="${p.imageUrl}"></c:param>
                                    <c:param name="cate" value="${cate}"></c:param>
                                    <c:param name="cate2" value="${requestScope.cate2}"></c:param>
                                    <c:param name="action" value="Add"></c:param>
                                </c:url>
                                <!--Grid column-->
                                <div class="col-lg-3 col-md-6 mb-4">

                                    <!--Card-->
                                    <div class="card">

                                        <!--Card image-->
                                        <div class="view overlay">
                                            <img src="img/${p.imageUrl}" class="card-img-top"
                                                 alt="">
                                            <a>
                                                <div class="mask rgba-white-slight"></div>
                                            </a>
                                        </div>
                                        <!--Card image-->

                                        <!--Card content-->
                                        <div class="card-body text-center">
                                            <!--Category & Title-->
                                            <a  class="grey-text">
                                                <h5>${p.productName}</h5>
                                            </a>
                                            <c:if test="${p.categoryID==1}">
                                                <c:set var="one" value="Golden Baked "></c:set>
                                            </c:if>
                                            <c:if test="${p.categoryID==2}">
                                                <c:set var="one" value=" Soft Sticky Rice "></c:set>
                                            </c:if>
                                            <h5>
                                                <strong>
                                                    <a  class="dark-grey-text">${one}

                                                    </a>
                                                </strong>
                                            </h5>
                                            <h5>
                                                <strong>
                                                    <a  class="dark-grey-text">${p.description}

                                                    </a>
                                                </strong>
                                            </h5>
                                            <h5>
                                                <strong>
                                                    <a class="dark-grey-text">Unit In Stock 
                                                        <span class="badge badge-pill deep-orange">${p.unitInStock}</span>
                                                    </a>
                                                </strong>
                                            </h5>
                                            <h5>
                                                <strong>
                                                    <a  class="dark-grey-text">Create Date:
                                                        <span class="badge badge-pill success-color">${p.createDate}</span>
                                                    </a>
                                                </strong>
                                            </h5>
                                            <h5>
                                                <strong>
                                                    <a  class="dark-grey-text">Expire Date:
                                                        <span class="badge badge-pill danger-color">${p.expirationDate}</span>
                                                    </a>
                                                </strong>
                                            </h5>
                                            <h5>
                                                <strong>

                                                    <strong class="font-weight-bold blue-text">${p.price} $</strong>


                                                    <a href="${pageScope.add}" class="dark-grey-text">
                                                        <span class="badge badge-pill primary-color-dark">Add To Cart</span>
                                                    </a>
                                                </strong>
                                            </h5>




                                        </div>
                                        <!--Card content-->

                                    </div>
                                    <!--Card-->

                                </div>
                                <!--Grid column-->

                            </c:forEach>
                        </c:if>
                        <c:if test="${requestScope.MESS1!=null and  empty requestScope.LIST1  }"> 
                            <p>Nothing here</p>
                        </c:if>
                        <c:if test="${requestScope.LIST1==null and empty requestScope.LIST2  }"> 
                            <p>${requestScope.ERROR}</p>
                        </c:if>

                        <c:if test="${requestScope.LIST2 !=null or not empty requestScope.LIST2}"> 
                            <c:forEach items="${LIST2}" var="p">

                                <c:url var="add" value="MainController">
                                    <c:param name="productID" value="${p.productID}"></c:param>
                                    <c:param name="productName" value="${p.productName}"></c:param>
                                    <c:param name="price" value="${p.price}"></c:param>
                                    <c:param name="unitInstock" value="${p.unitInStock}"></c:param>
                                    <c:param name="index" value="${param.index}"></c:param>
                                    <c:param name="search" value="${param.search}"></c:param>
                                    <c:param name="amount" value="${p.unitInStock}"></c:param>
                                    <c:param name="image" value="${p.imageUrl}"></c:param>
                                    <c:param name="cate" value="${cate}"></c:param>
                                    <c:param name="cate2" value="${requestScope.cate2}"></c:param>
                                    <c:param name="action" value="Add"></c:param>
                                </c:url>
                                <!--Grid column-->
                                <div class="col-lg-3 col-md-6 mb-4">


                                    <!--Card-->
                                    <div class="card">

                                        <!--Card image-->
                                        <div class="view overlay">
                                            <img src="img/${p.imageUrl}" class="card-img-top"
                                                 alt="">
                                            <a>
                                                <div class="mask rgba-white-slight"></div>
                                            </a>
                                        </div>
                                        <!--Card image-->

                                        <!--Card content-->
                                        <div class="card-body text-center">
                                            <!--Category & Title-->
                                            <a href="" class="grey-text">
                                                <h5>${p.productName}</h5>
                                            </a>
                                            <c:if test="${p.categoryID==1}">
                                                <c:set var="one" value="Golden Baked "></c:set>
                                            </c:if>
                                            <c:if test="${p.categoryID==2}">
                                                <c:set var="one" value=" Soft Sticky Rice "></c:set>
                                            </c:if>
                                            <h5>
                                                <strong>
                                                    <a href="" class="dark-grey-text">${one}

                                                    </a>
                                                </strong>
                                            </h5>
                                            <h5>
                                                <strong>
                                                    <a href="" class="dark-grey-text">${p.description}

                                                    </a>
                                                </strong>
                                            </h5>
                                            <h5>
                                                <strong>
                                                    <a href="" class="dark-grey-text">Unit In Stock 
                                                        <span class="badge badge-pill deep-orange">${p.unitInStock}</span>
                                                    </a>
                                                </strong>
                                            </h5>
                                            <h5>
                                                <strong>
                                                    <a href="" class="dark-grey-text">Create Date:
                                                        <span class="badge badge-pill success-color">${p.createDate}</span>
                                                    </a>
                                                </strong>
                                            </h5>
                                            <h5>
                                                <strong>
                                                    <a href="" class="dark-grey-text">Expire Date:
                                                        <span class="badge badge-pill danger-color">${p.expirationDate}</span>
                                                    </a>
                                                </strong>
                                            </h5>
                                            <h5>
                                                <strong>

                                                    <strong class="font-weight-bold blue-text">${p.price} $</strong>


                                                    <a href="${pageScope.add}" class="dark-grey-text">
                                                        <span class="badge badge-pill primary-color-dark">Add To Cart</span>
                                                    </a>
                                                </strong>
                                            </h5>




                                        </div>
                                        <!--Card content-->

                                    </div>
                                    <!--Card-->
                                </div>
                                <!--Grid column-->
                            </c:forEach>
                        </c:if>


                        <c:if test="${requestScope.LIST1 !=null or not empty requestScope.LIST1 and requestScope.LIST2==null}"> 
                            <c:forEach items="${LIST1}" var="p">

                                <c:url var="add" value="MainController">
                                    <c:param name="productID" value="${p.productID}"></c:param>
                                    <c:param name="productName" value="${p.productName}"></c:param>
                                    <c:param name="price" value="${p.price}"></c:param>
                                    <c:param name="unitInstock" value="${p.unitInStock}"></c:param>
                                    <c:param name="index" value="${param.index}"></c:param>
                                    <c:param name="search" value="${param.search}"></c:param>
                                    <c:param name="amount" value="${p.unitInStock}"></c:param>
                                    <c:param name="image" value="${p.imageUrl}"></c:param>
                                    <c:param name="cate" value="${cate}"></c:param>
                                    <c:param name="cate2" value="${requestScope.cate2}"></c:param>
                                    <c:param name="action" value="Add"></c:param>
                                </c:url>
                                <!--Grid column-->
                                <div class="col-lg-3 col-md-6 mb-4">


                                    <!--Card-->
                                    <div class="card">

                                        <!--Card image-->
                                        <div class="view overlay">
                                            <img src="img/${p.imageUrl}" class="card-img-top"
                                                 alt="">
                                            <a>
                                                <div class="mask rgba-white-slight"></div>
                                            </a>
                                        </div>
                                        <!--Card image-->

                                        <!--Card content-->
                                        <div class="card-body text-center">
                                            <!--Category & Title-->
                                            <a href="" class="grey-text">
                                                <h5>${p.productName}</h5>
                                            </a>
                                            <c:if test="${p.categoryID==1}">
                                                <c:set var="one" value="Golden Baked "></c:set>
                                            </c:if>
                                            <c:if test="${p.categoryID==2}">
                                                <c:set var="one" value=" Soft Sticky Rice "></c:set>
                                            </c:if>
                                            <h5>
                                                <strong>
                                                    <a href="" class="dark-grey-text">${one}

                                                    </a>
                                                </strong>
                                            </h5>
                                            <h5>
                                                <strong>
                                                    <a href="" class="dark-grey-text">${p.description}

                                                    </a>
                                                </strong>
                                            </h5>
                                            <h5>
                                                <strong>
                                                    <a href="" class="dark-grey-text">Unit In Stock 
                                                        <span class="badge badge-pill deep-orange">${p.unitInStock}</span>
                                                    </a>
                                                </strong>
                                            </h5>
                                            <h5>
                                                <strong>
                                                    <a href="" class="dark-grey-text">Create Date:
                                                        <span class="badge badge-pill success-color">${p.createDate}</span>
                                                    </a>
                                                </strong>
                                            </h5>
                                            <h5>
                                                <strong>
                                                    <a href="" class="dark-grey-text">Expire Date:
                                                        <span class="badge badge-pill danger-color">${p.expirationDate}</span>
                                                    </a>
                                                </strong>
                                            </h5>
                                            <h5>
                                                <strong>

                                                    <strong class="font-weight-bold blue-text">${p.price} $</strong>


                                                    <a href="${pageScope.add}" class="dark-grey-text">
                                                        <span class="badge badge-pill primary-color-dark">Add To Cart</span>
                                                    </a>
                                                </strong>
                                            </h5>




                                        </div>
                                        <!--Card content-->

                                    </div>
                                    <!--Card-->
                                </div>
                                <!--Grid column-->
                            </c:forEach>
                        </c:if>




                    </div>
                    <!--Grid row-->



                </section>
                <!--Section: Products v.3-->

                <!--Pagination-->
                <nav class="d-flex justify-content-center wow fadeIn">
                    <ul class="pagination pg-blue">

                        <!--Arrow left-->

                        <c:if test="${requestScope.save!=null and requestScope.LIST==null and requestScope.LIST2==null}">
                            <%                                  String search = (String) request.getAttribute("save");
                            %>
                            <c:set var="search1" value="${requestScope.save}"></c:set>                               
                            <c:forEach begin="1" end="${moonDao.getNumberPage(search1)}" var="c">
                                <c:set var="index" value="${param.index}"></c:set>
                                    <li class="page-item active">
                                        <a id="${c}"class="page-link" href="PagingController?index=${c}&search=${param.search}&cate=${cate}">${c}

                                    </a>
                                </li>
                            </c:forEach>
                        </c:if>
                        <c:if test="${requestScope.save==null and requestScope.index!=null}">
                            <c:forEach begin="1" end="${moonDao.numberPageByStatus}" var="c">
                                <c:set var="index" value="${param.index}"></c:set>
                                    <li class="page-item active">
                                        <a id="${c}"class="page-link" href="PagingController?index=${c}&search=${param.search}&cate=${cate}">${c}

                                    </a>
                                </li>
                            </c:forEach>
                        </c:if>
                        <c:if test="${requestScope.save==null and requestScope.index==null}">
                            <c:forEach begin="1" end="${moonDao.numberPageByStatus}" var="c">
                                <c:set var="index" value="${param.index}"></c:set>
                                    <li class="page-item active">
                                        <a id="${c}"class="page-link" href="PagingController?index=${c}&search=${param.search}&cate=${cate}">${c}

                                    </a>
                                </li>
                            </c:forEach>
                        </c:if>
                        <c:if test="${requestScope.check1!=null}">
                            <c:forEach begin="1" end="${moonDao.getNumberPageByLessPrice(30)}" var="c">
                                <c:set var="index" value="${param.index}"></c:set>
                                    <li class="page-item active">
                                        <a id="${c}"class="page-link" href="PagingController?search3=${param.search3}&index=${c}&search=${param.search}&cate=${cate}">${c}

                                    </a>
                                </li>
                            </c:forEach>
                        </c:if>
                        <c:if test="${requestScope.check2!=null}">
                            <c:forEach begin="1" end="${moonDao.getNumberPageByBetweenPrice(60)}" var="c">
                                <c:set var="index" value="${param.index}"></c:set>
                                    <li class="page-item active">
                                        <a id="${c}"class="page-link" href="PagingController?search3=${param.search3}&index=${c}&search=${param.search}&cate=${cate}">${c}

                                    </a>
                                </li>
                            </c:forEach>
                        </c:if>
                        <c:if test="${requestScope.check3!=null}">
                            <c:forEach begin="1" end="${moonDao.getNumberPageByBiggerPrice(60)}" var="c">
                                <c:set var="index" value="${param.index}"></c:set>
                                    <li class="page-item active">
                                        <a id="${c}"class="page-link" href="PagingController?search3=${param.search3}&index=${c}&search=${param.search}&cate=${cate}">${c}

                                    </a>
                                </li>
                            </c:forEach>
                        </c:if>
                        <c:if test="${requestScope.LIST2!=null }">

                            <%

                            %>
                            <c:set var="search1" value="${requestScope.save}"></c:set>
                            <c:forEach begin="1" end="${moonDao.getNumberPageByStatusAndCategoryIDAndSearch(search1,cate)}" var="c">
                                <c:set var="index" value="${param.index}"></c:set>
                                    <li class="page-item active">
                                        <a id="${c}"class="page-link" href="PagingController?index=${c}&search=${param.search}&cate=${cate}&cate2=${requestScope.cate2}">${c}

                                    </a>
                                </li>
                            </c:forEach>
                        </c:if>


                    </ul>
                </nav>
                <!--Pagination-->

            </div>
        </main>
        <!--Main layout-->

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
            <%                String mess1 = (String) request.getAttribute("MESS");
                if (mess1 != null) {
            %>
                                alert("${requestScope.MESS}");
            <%}%>
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
                                function hide()
                                {
            <%
                if (error1 != null) {
                    boolean check = session.isNew();
                    if (check == false) {

                    }
            %>
                                    alert("${check}");
            <%
                    session.removeAttribute("ERROR");
                    error1 = null;
                }%>

                                }

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
