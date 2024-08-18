<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon"
              href="https://scontent.fsgn2-4.fna.fbcdn.net/v/t1.15752-9/245649683_296032139031123_8726178875137916058_n.png?_nc_cat=101&ccb=1-5&_nc_sid=ae9488&_nc_ohc=qmsZI3_V4SIAX-wTaVI&_nc_ht=scontent.fsgn2-4.fna&oh=1eb1567687eb5da4f30314f6e84ec20b&oe=61BD925C"
              type="image/x-icon" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="templates/login.css">
        <title>Đăng nhập - Green Market</title>
    </head>

    <body>
        <a class="backhome" href="HomeControl">
            <i class="fas fa-home"></i> 
        </a>
        <div id="background">
            <div class="login">
                <div class="logo-login">
                    <img src="https://scontent.fsgn2-4.fna.fbcdn.net/v/t1.15752-9/245649683_296032139031123_8726178875137916058_n.png?_nc_cat=101&ccb=1-5&_nc_sid=ae9488&_nc_ohc=qmsZI3_V4SIAX-wTaVI&_nc_ht=scontent.fsgn2-4.fna&oh=1eb1567687eb5da4f30314f6e84ec20b&oe=61BD925C">
                </div>
                <div class="title-login">
                    <h2>Chào mừng đến với Green Market</h2>
                    <p style="color:red">${message}</p>
                </div>
                <form action="login" method="post">
                    <div class="input-user">
                        <i class="fas fa-user"></i>
                        <input name ="user" type="text" placeholder="Tên đăng nhập">
                    </div>
                    <div class="input-password">
                        <i class="fas fa-key"></i>
                        <input name="password" type="password" placeholder="Mật khẩu">
                    </div>
                    <div class="btn-login">
                        <button type="submit">
                            Đăng nhập
                        </button>
                    </div>
                    <div class="link-register">
                        Bạn chưa có tài khoản?
                        <a href="register.jsp">Đăng ký</a>
                    </div>
                    <div class="link-register">
                        <a href="forgotPassword.jsp">Quên mật khẩu?</a>
                    </div>
                </form>

            </div>
        </div>
    </body>

</html>