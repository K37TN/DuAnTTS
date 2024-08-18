<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <link rel="icon"
              href="https://scontent.fsgn2-4.fna.fbcdn.net/v/t1.15752-9/245649683_296032139031123_8726178875137916058_n.png?_nc_cat=101&ccb=1-5&_nc_sid=ae9488&_nc_ohc=D04G5gZfD8IAX-Bq2Sh&_nc_ht=scontent.fsgn2-4.fna&oh=d83b75d6e4024bceecadd826bdbe7f5d&oe=6196055C"
              type="image/x-icon" />
        <link href="templates/manager.css" rel="stylesheet" type="text/css" />
        <title>Trang quản lý</title>
    </head>
    <body>
        <section>
            <div class="container">
                <div class="title">Chào mừng bạn đến với trang quản lý của Admin của GREENMARKET</div>
                <div class="card" >
                    <a class="backhome" href="HomeControl">
                        <i class="fas fa-home"></i> 
                    </a>
                    <ul>
                        <li class="card-item">
                            <a href="ProductManager">
                                <div class="icon">
                                    <i class="fab fa-product-hunt"></i>
                                </div>
                                <p>Quản lý sản phẩm</p>
                            </a>
                        </li>
                        <li class="card-item">
                            <a href="UserManager">
                                <div class="icon">
                                    <i class="fas fa-user-alt"></i>
                                </div>
                                <p>Quản lý người dùng</p>
                            </a>
                        </li>
                        <li class="card-item">
                            <a href="OrderManager">
                                <div class="icon">
                                    <i class="fas fa-shopping-basket"></i>
                                </div>
                                <p>Quản lý đơn hàng</p>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </section>
    </body>
</html>
