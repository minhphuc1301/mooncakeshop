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
        <jsp:useBean id="paging" class="controllers.PagingController2" scope="request"></jsp:useBean>
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
        <main>
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

                        <!-- Links -->
                        <ul class="navbar-nav mr-auto">

                            <li class="nav-item">
                                <a class="nav-link" href="#">Golden Baked Mooncake</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="#">Soft Sticky Rice Mooncake</a>
                            </li>

                        </ul>
                        <!-- Links -->

                        <form action="PagingController2"class="form-inline">


                            <div class="md-form my-0">
                                <input value="${param.search}"name="search"class="form-control mr-sm-2" type="text" placeholder="Search by name" aria-label="Search">
                                <input style="border:none;"class="fas fa-search" type="submit"  action="search">
                                <input type="hidden" name="index" value="1">
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
                            List<MoonCakeDTO> list1 = (List) moonDao.pageingAllProduct(1);
                            HttpSession session1 = request.getSession();
                            session.setAttribute("list", list1);

                        %>
                        <c:if test="${sessionScope.list !=null and requestScope.LIST==null}"> 


                            <c:url var="add" value="MainController">
                                <c:param name="productID" value="${p.productID}"></c:param>
                                <c:param name="productName" value="${p.productName}"></c:param>
                                <c:param name="price" value="${p.price}"></c:param>
                                <c:param name="unitInstock" value="${p.unitInStock}"></c:param>
                                <c:param name="index" value="${param.index}"></c:param>
                                <c:param name="search" value="${param.search}"></c:param>

                                <c:param name="action" value="Add"></c:param>
                            </c:url>
                            <!--Grid column-->


                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>Product ID</th>
                                        <th>Product Name</th>
                                        <th>Description</th>
                                        <th>Price
                                            <p style="color:red">${requestScope.ERROR.priceError}</p>
                                        </th>

                                        <th>Unit In Stock
                                            <p style="color:red">${requestScope.ERROR.unitInStockError}</p>
                                        </th>
                                        <th>Category</th>
                                        <th>Image Url
                                            <p style="color:red">${requestScope.ERROR.imgError}</p>
                                        </th>
                                        <th>Create Date
                                            <p style="color:red">${requestScope.ERROR.fromDateError}</p>
                                        </th>
                                        <th>Expire 
                                            <p style="color:red">${requestScope.ERROR.toDateError}</p>
                                        </th>
                                        <th>Status</th>
                                        <th>Action</th>



                                    </tr>
                                </thead>
                                <c:forEach items="${list}" var="p" varStatus="counter">
                                    <form action="EditController" method="post" enctype="multipart/form-data">
                                        <tbody>
                                            <tr>
                                                <td>${counter.count}</td>
                                                <c:set var="count" value="${counter.count}"></c:set>
                                                <td><input id="${counter.count}A" style="display:none;"type="text" name="productID" value="${p.productID}">
                                                    <span id="${counter.count}1">${p.productID}</span></td>
                                                <td><input id="${counter.count}B" style="display:none;"type="text" name="productName" value="${p.productName}">
                                                    <span id="${counter.count}2">${p.productName}</span>


                                                </td>
                                                <td><input id="${counter.count}C" style="display:none;"type="text" name="description" value="${p.description}">
                                                    <span id="${counter.count}3">${p.description}</span></td>
                                                <td><input id="${counter.count}D" style="display:none;"type="text" name="price" value="${p.price}">
                                                    <span id="${counter.count}4">${p.price}

                                                    </span>


                                                </td>

                                                <td><input id="${counter.count}E" style="display:none;"type="text" name="unit" value="${p.unitInStock}">
                                                    <span id="${counter.count}5">${p.unitInStock}</span></td>

                                                <c:if test="${p.categoryID==1}">
                                                    <c:set var="category" value="Golden Baked Mooncake"></c:set>
                                                        <td>
                                                            <select name="category">
                                                                <option value="${category}">${category}</option>
                                                            <option value="Soft Sticky Rice Mooncake">Soft Sticky Rice Mooncake</option>
                                                        </select>

                                                    </td>
                                                </c:if>
                                                <c:if test="${p.categoryID==2}">
                                                    <c:set var="category" value="Soft Sticky Rice Mooncake"></c:set>
                                                        <td>
                                                            <select name="category">
                                                                <option value="${category}">${category}</option>
                                                            <option value="Golden Baked Mooncake">Golden Baked Mooncake</option>
                                                        </select>

                                                    </td>
                                                </c:if>

                                                <td><img id="${counter.count}6"style="width:100px;"src="img/${p.imageUrl}">
                                                    <input id="${counter.count}F" style="display:none;"type="file" name="file">
                                                </td>

                                                <td><input type="date" name="from" value="${p.createDate}"></td>
                                                <td><input type="date" name="to" value="${p.expirationDate}"></td>
                                                <td> <c:if test="${p.status eq 'Active'}">
                                                        <select name="status">

                                                            <option value="${p.status}">${p.status}</option>
                                                            <option value="Deactive">Deactive</option>
                                                        </select></c:if>
                                                    <c:if test="${p.status eq 'Deactive'}">
                                                        <select name="status">
                                                            <
                                                            <option value="${p.status}">${p.status}</option>
                                                            <option value="Active">Active</option>
                                                        </select></c:if>
                                                    </td>

                                            <input type="hidden" name="index" value="${param.index}">
                                        <input type="hidden" name="search" value="${param.search}">
                                        <td style="display:none;"id="${counter.count}J">   
                                            <button onclick="
                                                    document.getElementById('${counter.count}8').style.display = 'none';

                                                    document.getElementById('${counter.count}B').style.display = 'block';
                                                    document.getElementById('${counter.count}C').style.display = 'block';
                                                    document.getElementById('${counter.count}D').style.display = 'block';
                                                    document.getElementById('${counter.count}E').style.display = 'block';
                                                    document.getElementById('${counter.count}F').style.display = 'block';
                                                    document.getElementById('${counter.count}J').style.display = 'block';

                                                    document.getElementById('${counter.count}2').style.display = 'none';
                                                    document.getElementById('${counter.count}3').style.display = 'none';
                                                    document.getElementById('${counter.count}4').style.display = 'none';
                                                    document.getElementById('${counter.count}5').style.display = 'none';
                                                    document.getElementById('${counter.count}6').style.display = 'none';
                                                    document.getElementById('${counter.count}7').style.display = 'none';


                                                    "class='btn btn-success'type='submit' value="Upload">Edit</button>
                                    </form>
                                    <input type="hidden" name="productID" value="${cart.productID}">
                                    <input type="hidden" name="index" value="${param.index}">
                                    <input type="hidden" name="search" value="${param.search}">
                                    <button onclick="
                                            document.getElementById('${counter.count}8').style.display = 'block';

                                            document.getElementById('${counter.count}B').style.display = 'none';
                                            document.getElementById('${counter.count}C').style.display = 'none';
                                            document.getElementById('${counter.count}D').style.display = 'none';
                                            document.getElementById('${counter.count}E').style.display = 'none';
                                            document.getElementById('${counter.count}F').style.display = 'none';
                                            document.getElementById('${counter.count}J').style.display = 'none';

                                            document.getElementById('${counter.count}2').style.display = 'block';
                                            document.getElementById('${counter.count}3').style.display = 'block';
                                            document.getElementById('${counter.count}4').style.display = 'block';
                                            document.getElementById('${counter.count}5').style.display = 'block';
                                            document.getElementById('${counter.count}6').style.display = 'block';
                                            document.getElementById('${counter.count}7').style.display = 'block';
                                            "class='btn btn-danger'type='submit' >X</a>

                                        </td>
                                        </form>
                                        <td id="${counter.count}8">   
                                            <button onclick="
                                                    document.getElementById('${counter.count}8').style.display = 'none';

                                                    document.getElementById('${counter.count}B').style.display = 'block';
                                                    document.getElementById('${counter.count}C').style.display = 'block';
                                                    document.getElementById('${counter.count}D').style.display = 'block';
                                                    document.getElementById('${counter.count}E').style.display = 'block';
                                                    document.getElementById('${counter.count}F').style.display = 'block';
                                                    document.getElementById('${counter.count}J').style.display = 'block';

                                                    document.getElementById('${counter.count}2').style.display = 'none';
                                                    document.getElementById('${counter.count}3').style.display = 'none';
                                                    document.getElementById('${counter.count}4').style.display = 'none';
                                                    document.getElementById('${counter.count}5').style.display = 'none';
                                                    document.getElementById('${counter.count}6').style.display = 'none';
                                                    document.getElementById('${counter.count}7').style.display = 'none';


                                                    " class='btn btn-success'>Edit</button>
                                        </td>
                                        </tr>                                         
                                        </tbody
                                        </form>

                                    </c:forEach>

                            </table>
                            <p>${requestScope.MESS}</p>
                            <!--Grid column-->

                        </c:if>
                        <c:if test="${requestScope.LIST !=null or not empty requestScope.LIST}"> 
                            <c:url var="add" value="MainController">
                                <c:param name="productID" value="${p.productID}"></c:param>
                                <c:param name="productName" value="${p.productName}"></c:param>
                                <c:param name="price" value="${p.price}"></c:param>
                                <c:param name="unitInstock" value="${p.unitInStock}"></c:param>
                                <c:param name="index" value="${param.index}"></c:param>
                                <c:param name="search" value="${param.search}"></c:param>

                                <c:param name="action" value="Add"></c:param>
                            </c:url>
                            <!--Grid column-->


                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>Product ID</th>
                                        <th>Product Name</th>
                                        <th>Description</th>
                                        <th>Price
                                            <p style="color:red">${requestScope.ERROR.priceError}</p>
                                        </th>

                                        <th>Unit In Stock
                                            <p style="color:red">${requestScope.ERROR.unitInStockError}</p>
                                        </th>
                                        <th>Category</th>
                                        <th>Image Url
                                            <p style="color:red">${requestScope.ERROR.imgError}</p>
                                        </th>
                                        <th>Create Date
                                            <p style="color:red">${requestScope.ERROR.fromDateError}</p>
                                        </th>
                                        <th>Expire 
                                            <p style="color:red">${requestScope.ERROR.toDateError}</p>
                                        </th>
                                        <th>Status</th>
                                        <th>Action</th>



                                    </tr>
                                </thead>
                                <c:forEach items="${LIST}" var="p" varStatus="counter">
                                    <form action="EditController" method="post" enctype="multipart/form-data">
                                        <tbody>
                                            <tr>
                                                <td>${counter.count}</td>
                                                <c:set var="count" value="${counter.count}"></c:set>
                                                <td><input id="${counter.count}A" style="display:none;"type="text" name="productID" value="${p.productID}">
                                                    <span id="${counter.count}1">${p.productID}</span></td>
                                                <td><input id="${counter.count}B" style="display:none;"type="text" name="productName" value="${p.productName}">
                                                    <span id="${counter.count}2">${p.productName}</span>


                                                </td>
                                                <td><input id="${counter.count}C" style="display:none;"type="text" name="description" value="${p.description}">
                                                    <span id="${counter.count}3">${p.description}</span></td>
                                                <td><input id="${counter.count}D" style="display:none;"type="text" name="price" value="${p.price}">
                                                    <span id="${counter.count}4">${p.price}

                                                    </span>


                                                </td>

                                                <td><input id="${counter.count}E" style="display:none;"type="text" name="unit" value="${p.unitInStock}">
                                                    <span id="${counter.count}5">${p.unitInStock}</span></td>

                                                <c:if test="${p.categoryID==1}">
                                                    <c:set var="category" value="Golden Baked Mooncake"></c:set>
                                                        <td>
                                                            <select name="category">
                                                                <option value="${category}">${category}</option>
                                                            <option value="Soft Sticky Rice Mooncake">Soft Sticky Rice Mooncake</option>
                                                        </select>

                                                    </td>
                                                </c:if>
                                                <c:if test="${p.categoryID==2}">
                                                    <c:set var="category" value="Soft Sticky Rice Mooncake"></c:set>
                                                        <td>
                                                            <select name="category">
                                                                <option value="${category}">${category}</option>
                                                            <option value="Golden Baked Mooncake">Golden Baked Mooncake</option>
                                                        </select>

                                                    </td>
                                                </c:if>

                                                <td><img id="${counter.count}6"style="width:100px;"src="img/${p.imageUrl}">
                                                    <input id="${counter.count}F" style="display:none;"type="file" name="file">
                                                </td>

                                                <td><input type="date" name="from" value="${p.createDate}"></td>
                                                <td><input type="date" name="to" value="${p.expirationDate}"></td>
                                                <td> <c:if test="${p.status eq 'Active'}">
                                                        <select name="status">

                                                            <option value="${p.status}">${p.status}</option>
                                                            <option value="Deactive">Deactive</option>
                                                        </select></c:if>
                                                    <c:if test="${p.status eq 'Deactive'}">
                                                        <select name="status">

                                                            <option value="${p.status}">${p.status}</option>
                                                            <option value="Active">Active</option>
                                                        </select></c:if>
                                                    </td>


                                                    <td style="display:none;"id="${counter.count}J">   
                                                    <input type="hidden" name="index" value="${param.index}">
                                                    <input type="hidden" name="search" value="${param.search}">
                                                    <button onclick="
                                                            document.getElementById('${counter.count}8').style.display = 'none';

                                                            document.getElementById('${counter.count}B').style.display = 'block';
                                                            document.getElementById('${counter.count}C').style.display = 'block';
                                                            document.getElementById('${counter.count}D').style.display = 'block';
                                                            document.getElementById('${counter.count}E').style.display = 'block';
                                                            document.getElementById('${counter.count}F').style.display = 'block';
                                                            document.getElementById('${counter.count}J').style.display = 'block';

                                                            document.getElementById('${counter.count}2').style.display = 'none';
                                                            document.getElementById('${counter.count}3').style.display = 'none';
                                                            document.getElementById('${counter.count}4').style.display = 'none';
                                                            document.getElementById('${counter.count}5').style.display = 'none';
                                                            document.getElementById('${counter.count}6').style.display = 'none';
                                                            document.getElementById('${counter.count}7').style.display = 'none';


                                                            "class='btn btn-success'type='submit' value="Upload">Edit</button>
                                    </form>
                                    <input type="hidden" name="productID" value="${cart.productID}">
                                    <button onclick="
                                            document.getElementById('${counter.count}8').style.display = 'block';

                                            document.getElementById('${counter.count}B').style.display = 'none';
                                            document.getElementById('${counter.count}C').style.display = 'none';
                                            document.getElementById('${counter.count}D').style.display = 'none';
                                            document.getElementById('${counter.count}E').style.display = 'none';
                                            document.getElementById('${counter.count}F').style.display = 'none';
                                            document.getElementById('${counter.count}J').style.display = 'none';

                                            document.getElementById('${counter.count}2').style.display = 'block';
                                            document.getElementById('${counter.count}3').style.display = 'block';
                                            document.getElementById('${counter.count}4').style.display = 'block';
                                            document.getElementById('${counter.count}5').style.display = 'block';
                                            document.getElementById('${counter.count}6').style.display = 'block';
                                            document.getElementById('${counter.count}7').style.display = 'block';
                                            "class='btn btn-danger'type='submit' >X</a>

                                        </td>
                                        </form>
                                        <td id="${counter.count}8">   
                                            <button onclick="
                                                    document.getElementById('${counter.count}8').style.display = 'none';

                                                    document.getElementById('${counter.count}B').style.display = 'block';
                                                    document.getElementById('${counter.count}C').style.display = 'block';
                                                    document.getElementById('${counter.count}D').style.display = 'block';
                                                    document.getElementById('${counter.count}E').style.display = 'block';
                                                    document.getElementById('${counter.count}F').style.display = 'block';
                                                    document.getElementById('${counter.count}J').style.display = 'block';

                                                    document.getElementById('${counter.count}2').style.display = 'none';
                                                    document.getElementById('${counter.count}3').style.display = 'none';
                                                    document.getElementById('${counter.count}4').style.display = 'none';
                                                    document.getElementById('${counter.count}5').style.display = 'none';
                                                    document.getElementById('${counter.count}6').style.display = 'none';
                                                    document.getElementById('${counter.count}7').style.display = 'none';


                                                    " class='btn btn-success'>Edit</button>
                                        </td>
                                        </tr>                                         
                                        </tbody
                                        </form>

                                    </c:forEach>

                            </table>
                            <p>${requestScope.MESS}</p>
                            <!--Grid column-->


                        </c:if>




                    </div>
                    <!--Grid row-->



                </section>
                <!--Section: Products v.3-->

                <!--Pagination-->
                <nav class="d-flex justify-content-center wow fadeIn">
                    <ul class="pagination pg-blue">

                        <!--Arrow left-->


                        <c:if test="${requestScope.save==null and requestScope.index1!=null}">
                            <c:forEach begin="1" end="${moonDao.numberPage}" var="c">
                                <c:set var="index" value="${param.index}"></c:set>
                                    <li class="page-item active">
                                        <a id="${c}"class="page-link" href="PagingController2?index=${c}&search=${param.search}">${c}

                                    </a>
                                </li>
                            </c:forEach>
                        </c:if>
                        <c:if test="${requestScope.save==null and requestScope.index1==null}">
                            <c:forEach begin="1" end="${moonDao.numberPage}" var="c">
                                <c:set var="index" value="${param.index}"></c:set>
                                    <li class="page-item active">
                                        <a id="1"class="page-link" href="PagingController2?index=${c}&search=${param.search}">${c}

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

    </form>
    <!--Footer-->
    <footer class="page-footer text-center font-small mt-4 wow fadeIn">



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
        <%            String mess = (String) request.getAttribute("MESSAGE1");
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
