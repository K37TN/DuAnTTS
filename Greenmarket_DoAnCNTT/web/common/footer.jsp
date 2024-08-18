<%@page contentType="text/html" pageEncoding="UTF-8"%>
<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-6">
                <h3>Green Market</h3>
                <p>Hãy đến với Green Market, nơi mua sắm các thực phẩm sạch và an toàn cho gia đình của bạn.</p>
            </div>
            <div class="col-md-3 col-sm-6">
                <h3>Sản phẩm</h3>
                <ul>
                    <c:forEach items="${listC}" var="c"> 
                        <li><a href="CategoryDetail?categoryid=${c.categoryid}">${c.name}</a></li>
                    </c:forEach>
                </ul>
            </div>
            <div class="col-md-3 col-sm-6">
                <h3>Theo dõi chúng tôi</h3>
                <div class="follow-us">
                    <ul>
                        <li><a href="#"><i class="fab fa-facebook-f"></i> Facebook</a></li>
                        <li><a href="#"><i class="fab fa-twitter"></i> Twitter</a></li>
                        <li><a href="#"><i class="fab fa-instagram"></i> Instagram</a></li>
                        <li><a href="#"><i class="fab fa-youtube"></i> Youtube</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <h3>Địa chỉ liên hệ</h3>
                <ul>
                    <li><a href="#"><i class="fas fa-map-marker-alt"></i> Số 1, Võ Văn Ngân, TP.Thủ Đức, TP.HCM</a></li>
                    <li><a href="#" class="d-flex"><i class="far fa-envelope"></i>greenmarket827@gmail.com</a></li>
                    <li><a href="#"><i class="fa fa-phone"></i> +0702 345 123</a></li>
                    <li><a href="#"><i class="fas fa-mobile-alt"></i> +84 939 87 345</a></li>
                </ul>
            </div>
        </div>
    </div>
    <!-- Copyright Text -->
    <div class="copyright-txt">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <p>GREENMARKET &#169;Copyright. All Rights Reserved</p>
                </div>
            </div>
        </div>
    </div>
</footer>
