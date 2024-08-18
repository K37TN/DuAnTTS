<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>

    <%@include file="common/head.jsp" %>

    <body>
        <fmt:setLocale value="vi-VN"/>
        <!--begin of menu-->
        <%@include file="common/header.jsp" %>
        <section class="jumbotron">
            <div class="slideshow">
                <div class="slide-wrapper">
                    <div class="slide"><img 
                            src="images/panel1.jpg"
                            width=100%>
                    </div>
                    <div class="slide"><img
                            src="images/panel2.jpg"
                            width=100%>
                    </div>
                    <div class="slide"><img
                            src="images/panel3.jpg"
                            width=100%>
                    </div>
                    <div class="slide"><img
                            src="images/panel4.jpg"
                            width=100%>
                    </div>
                </div>
            </div>
        </section>
        <!--end of menu-->
        <div class="container">
            <div class="row">
                <div class="col">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="HomeControl">Trang chủ</a></li>
                            <li class="breadcrumb-item"><a href="CategoryDetail?categoryid=${tag}">${cname}</a></li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <div class="card bg-light mb-3">
                        <div class="card-header text-white text-uppercase"><i class="fa fa-list"></i> Danh mục</div>
                        <ul class="list-group category_block">
                            <c:forEach items="${listC}" var="c"> 
                                <li class="list-group-item text-white ${tag==c.categoryid ?"active bg-success":""}">
                                    <a href="CategoryDetail?categoryid=${c.categoryid}">${c.name}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>

                <div class="col-sm-9">
                    <div class="row" id="content">
                        <c:forEach items="${listP}" var="p"> 
                            <div class="col-12 col-md-6 col-lg-4">
                                <div class="card">
                                    <img class="card-img-top"
                                         src="images/${p.image}">
                                    <div class="card-body">
                                        <h4 class="card-title show_txt">${p.name}</h4>
                                        <p class="card-text show_txt"><fmt:formatNumber value="${p.price}" type="currency"/></p>
                                        <div class="row">
                                            <div class="col">
                                                <a href="detail?productid=${p.productid}" class="btn detail btn-danger btn-block">Chi tiết</a>
                                            </div>
                                            <c:if test="${sessionScope.usersession==null}">
                                                <div class="col">
                                                    <a href="login.jsp" class="btn btn-success btn-block">Thêm vào giỏ hàng</a>
                                                </div>
                                            </c:if>
                                            <c:if test="${sessionScope.usersession!=null}">
                                                <div class="col">
                                                    <a href="addcart?id=${p.productid}" class="btn btn-success btn-block">Thêm vào giỏ hàng</a>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
<!--        <div>
            <button onclick="LoadMore()"class="btn-success">Xem thêm các mặt hàng khác</button>
        </div>-->
<div class="d-flex justify-content-center">
<c:forEach begin="1" end="${endpage}" var="o">
    <a href="HomeControl?index=${o}" class="pl-20 pr-20 btn btn-light" >${o}</a> 
</c:forEach>
</div>
    </body>
    <button id="myBtn"><i class="fas fa-chevron-up"></i></button>
    <script>
        window.onscroll = function () {
            scrollFunction()
        };
        function scrollFunction() {

            if (document.body.scrollTop > 600 || document.documentElement.scrollTop > 600) {
                document.getElementById("myBtn").style.display = "block";
            } else {
                document.getElementById("myBtn").style.display = "none";
            }
        }

        document.getElementById('myBtn').addEventListener("click", function () {
            document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
        });
    </script>
    <script src="templates/functionWeb.js"></script>
    <%@include file="common/footer.jsp" %>
</html>
