<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Quản lý đơn hàng</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="icon"
              href="https://scontent.fsgn2-4.fna.fbcdn.net/v/t1.15752-9/245649683_296032139031123_8726178875137916058_n.png?_nc_cat=101&ccb=1-5&_nc_sid=ae9488&_nc_ohc=D04G5gZfD8IAX-Bq2Sh&_nc_ht=scontent.fsgn2-4.fna&oh=d83b75d6e4024bceecadd826bdbe7f5d&oe=6196055C"
              type="image/x-icon" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="templates/orderManager.css" rel="stylesheet" type="text/css" />

    <body>
        <fmt:setLocale value="vi-VN"/>
<!--        <h2 class="title-main">Quản lý đơn hàng</h2>
        <div class="form-group">
            <label>Tình trạng</label>
            <select name="tinhtrang" class="form-select" aria-label="Default select example">
                <option value="0" selected="">
                <a href="status?id=0">Chưa giao</a>
                 </option>
                <option value="1"> <a href="status?id=1">Đã giao</a>
               </option>
            </select>
        </div>-->
        <div class="container">
            <div class="table-wrapper">
                <a class="return" href="HomeControl">Trang chủ | </a>
                <a class="return" href="manager.jsp">Trang quản lý</a>
                <a href="#addEmployeeModal" class="btn" data-toggle="modal"><i class="material-icons">&#xE147;</i>
                    <span>Thêm đơn hàng</span></a>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Mã đơn hàng</th>
                            <th>Sản phẩm</th>
                            <th>Đơn giá</th>
                            <th>Số lượng</th>
                            <th>Thành tiền</th>
                            <th>Mã giỏ hàng</th>
                            <th>Ngày mua</th>
                            <th>Tên người dùng</th>
                            <th>Thông tin giao hàng</th>
                           
                            <th>Chỉnh sửa</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listC}" var="o">
                            <tr>
                                <td>${o.id}</td>
                                <td>${o.productid.name}</td>
                                <td><fmt:formatNumber value="${o.productid.price}" type="currency"/></td>
                                <td>${o.quantity}</td>
                                <td><fmt:formatNumber value="${o.productid.price*o.quantity}" type="currency"/></td>
                                <td>${o.cartid.cartid}</td>
                                <td><fmt:formatDate value="${o.cartid.buydate}" type="date"/></td>
                                <td>${o.cartid.userid.username}</td>
                                <td>${o.cartid.info}</td>
                              
                                <td>
                                    <a href="#editEmployeeModal" class="edit" data-toggle="modal"><i class="material-icons"
                                                                                                     data-toggle="tooltip" title="Chỉnh sửa sản phẩm">&#xE254;</i></a>
                                    <a href="#deleteEmployeeModal" class="delete" data-toggle="modal"><i
                                            class="material-icons" data-toggle="tooltip"
                                            title="Xóa sản phẩm">&#xE872;</i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="total">
                    <form action="">
                        <p>Tổng cộng: </p>
                        <input type="text">
                    </form>
                </div>
            </div>
        </div>
        <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="add" method="post">
                        <div class="modal-header">
                            <h4 class="modal-title">Thêm đơn hàng</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Mã đơn hàng</label>
                                <input name="id" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Tên khách hàng</label>
                                <input name="name" type="text" class="form-control" required
                                       placeholder="Ví dụ: Nguyễn Văn A">
                            </div>
                            <div class="form-group">
                                <label>Số điện thoại</label>
                                <input name="phone" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Tên sản phẩm</label>
                                <input name="product" type="text" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Số lượng</label>
                                <input name="quantity" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Đơn giá</label>
                                <input name="price" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Tổng giá tiền</label>
                                <input name="total-price" type="text" class="form-control" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn-cancel" data-dismiss="modal" value="Hủy">
                            <input type="submit" class="btn-add" value="Thêm">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Edit Modal HTML -->
        <div id="editEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">
                            <h4 class="modal-title">Chỉnh sửa đơn hàng</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Mã đơn hàng</label>
                                <input name="id" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Tên khách hàng</label>
                                <input name="name" type="text" class="form-control" required
                                       placeholder="Ví dụ: Nguyễn Văn A">
                            </div>
                            <div class="form-group">
                                <label>Số điện thoại</label>
                                <input name="phone" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Tên sản phẩm</label>
                                <input name="product" type="text" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Số lượng</label>
                                <input name="quantity" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Đơn giá</label>
                                <input name="price" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Tổng giá tiền</label>
                                <input name="total-price" type="text" class="form-control" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn-cancel" data-dismiss="modal" value="Hủy">
                            <input type="submit" class="btn-save" value="Lưu">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Delete Modal HTML -->
        <div id="deleteEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">
                            <h4 class="modal-title">Xóa đơn hàng hàng</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <p>Bạn có chắc chắn muốn xóa đơn hàng này không ?</p>
                            <p class="text-warning"><small>Đây là hành động không thể khôi phục</small></p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn-cancel" data-dismiss="modal" value="Hủy">
                            <input type="submit" class="btn-delete" value="Xóa">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>

</html>
