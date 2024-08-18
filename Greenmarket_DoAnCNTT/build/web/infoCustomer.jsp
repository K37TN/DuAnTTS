<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Thông tin khách hàng</title>
    <link rel="icon"
        href="https://scontent.fsgn2-4.fna.fbcdn.net/v/t1.15752-9/245649683_296032139031123_8726178875137916058_n.png?_nc_cat=101&ccb=1-5&_nc_sid=ae9488&_nc_ohc=D04G5gZfD8IAX-Bq2Sh&_nc_ht=scontent.fsgn2-4.fna&oh=d83b75d6e4024bceecadd826bdbe7f5d&oe=6196055C"
        type="image/x-icon" />
    <link href="templates/infoCustomer.css" rel="stylesheet" type="text/css" />

<body>
     <a class="backhome" href="HomeControl">
            <i class="fas fa-home"></i> 
        </a>
    <div class="container">
        <div class="info">
            <h2 class="title-main">Thông tin khách hàng</h2>
            <div class="form-info">
                <div class="form-group">
                    <label>UserID</label>
                    <input name="userid" type="text" class="form-control" required readonly>
                </div>
                <div class="form-group">
                    <label>UserName</label>
                    <input name="username" type="text" class="form-control" required >
                </div>
                <div class="form-group">
                    <label>Email</label>
                    <input name="email" type="text" class="form-control" required>
                </div>
                <div class="form-footer">
                    <input type="submit" class="btn-save" value="Cập nhật thông tin">
                </div>
            </div>
        </div>
    </div>
</body>

</html>
