<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <title>Chi tiết sản phẩm</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="main.css" />
    <link rel="stylesheet" href="templates/detail.css" />

    <%@include file="common/head.jsp" %>
    <body>
        <%@include file="common/header.jsp" %>
        <section id="main">
            <div class="product">
                <div class="product-img">
                    <img src="images/${detail.image}"
                         alt="" />
                   
                </div>
                <div class="product-listing">
                    <div class="content">
                        <div class="content_list">
                            <lable class="name">Loại sản phẩm: ${detail.categoryid.name} </lable>
                        </div>
                        <div class="content_list">
                            <lable class="name">Tên sản phẩm: ${detail.name}</lable>
                        </div>
<!--                        <div class="content_list">
                            <lable class="name">Số lượng: </lable>
                            <input class="quantity" name="quantity"type="text" value="1">
                        </div>-->
                        <div class="content_list">
                            <lable class="name">Giá: ${detail.price} đ</lable>
                        </div>
                        <div class="content_list">
                            <lable class="name"><i class="fas fa-truck"></i>Vận chuyển: Miễn phí trên toàn quốc</lable>
                        </div>
                        
                        <form>
                            <div class="btn2">
                                <div>
                                      <c:if test="${sessionScope.usersession!=null}">
                                    <a href="addcart?id=${detail.productid}" class="btn btn-success btn-block">
                                        <i class="fas fa-cart-plus"></i>Thêm vào giỏ hàng</a>
                                      </c:if>
                                       <c:if test="${sessionScope.usersession==null}">
                                    <a href="login.jsp" class="btn btn-success btn-block">
                                        <i class="fas fa-cart-plus"></i>Thêm vào giỏ hàng</a>
                                      </c:if>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </body>
    <%@include file="common/footer.jsp" %>
</html>
