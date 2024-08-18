<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giỏ hàng</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="templates/cart.css">
    </head>
    <%@include file="common/head.jsp" %>
    <body>
        <%@include file="common/header.jsp" %>
        <fmt:setLocale value="vi-VN"/>
        <div class="shopping-cart">
            <div class="px-4 px-lg-0">
                <div class="pb-5">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">

                                <!-- Shopping cart table -->
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="p-2 px-3 text-uppercase">Sản Phẩm</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Đơn Giá</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Số Lượng</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Thành tiền</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Xóa</div>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${list}" var="o">
                                                <tr>
                                                    <th scope="row">
                                                        <div class="p-2">
                                                            <img src="images/${o.productid.image}" alt="" width="70" class="img-fluid rounded shadow-sm">
                                                            <div class="ml-3 d-inline-block align-middle">
                                                                <h5 class="mb-0"> <a href="#" class="text-dark d-inline-block">${o.productid.name}</a></h5><span class="text-muted font-weight-normal font-italic"></span>
                                                            </div>
                                                        </div>
                                                    </th>
                                                    <td class="align-middle"><strong><fmt:formatNumber value="${o.productid.price}" type="currency"></fmt:formatNumber> / kg</strong></td>
                                                        <td class="align-middle">
                                                            <a href="sub?id=${o.productid.productid}"><button class="btnSub">-</button></a> 
                                                        <strong>${o.quantity}</strong>
                                                        <a href="addcart?id=${o.productid.productid}"><button class="btnAdd">+</button></a>
                                                    <td  class="align-middle"><strong><fmt:formatNumber value="${o.productid.price*o.quantity}" type="currency"/></strong></td>
                                                    </td>
                                                    <td class="align-middle"><a href="remove?id=${o.productid.productid}" class="text-dark">
                                                            <button type="button" class="btn btn-danger">Xóa</button>
                                                        </a>
                                                    </td>
                                                </tr> 
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- End -->
                            </div>
                        </div>
                        <div class="row d-flex justify-content-end">
                            <div class="p-4 rounded shadow-sm">
                                <a href="HomeControl" class="btn btn-success btn-block">Tiếp tục mua hàng</a>
                            </div>                           
                        </div>
                        <div class="row py-5 p-4 bg-white rounded shadow-sm">
                            <div class="col-lg-6">
                                <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Thông tin giao hàng
                                </div>
                                <div class="p-4">
                                    <c:if test="${sessionScope.order!=null}">
                                        <form action="order" method="post">
                                            <label>Tên khách hàng: </label>
                                            <input type="text" name="username" required="">
                                            <label>Địa chỉ giao hàng: </label>
                                            <input type="text" name="address" required="">
                                            <label>Số điện thoại: </label>
                                            <input type="text" name="sodienthoai" required="">
                                            <button class="order btn-success"type="submit" onclick="message()">Tiến hành mua hàng</button>
                                        </form>
                                    </c:if>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Thành tiền
                                </div>
                                <div class="p-4">
                                    <ul class="list-unstyled mb-4">
                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong
                                                class="text-muted">Tổng tiền hàng</strong><strong><fmt:formatNumber value="${total}" type="currency"/></strong>
                                        </li>
                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong
                                                class="text-muted">Phí vận chuyển</strong><strong>Free ship</strong>
                                        </li>
                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong
                                                class="text-muted">VAT</strong><strong><fmt:formatNumber value="${vat}" type="currency"/> (10%)</strong></li>
                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong
                                                class="text-muted">Tổng thanh toán</strong>
                                            <h5 class="font-weight-bold"><fmt:formatNumber value="${sum}" type="currency"/></h5>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
                integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
                integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
        <script src="templates/functionWeb.js"></script>
    </body>
    <%@include file="common/footer.jsp" %>
</html>
