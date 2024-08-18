<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<nav class="navbar navbar-expand-md navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="HomeControl">
            <img src="images/logo_header.png">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault"
                aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end d-flex" id="navbarsExampleDefault">
            <form action="search" method="get" class="form-inline my-2 my-lg-0">
                <div class="input-group input-group-sm">
                    <input name="search" value="${txtsearch}" type="text" class="form-control" aria-label="Small"
                           aria-describedby="inputGroup-sizing-sm" placeholder="Tìm kiếm trên Green Market . . .">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary btn-number">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
                
            </form>
                <a class="btn btn-success btn-sm ml-3" href="print">
                    <i class="fa fa-shopping-cart"></i>
                    <span class="badge badge-light">${sessionScope.qcart}</span>
                </a>
            <ul class="navbar-nav login">
                <c:if test="${sessionScope.usersession==null}">
                    <li class="nav-item">
                        <a class="nav-link" href="register.jsp">Đăng ký</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Đăng nhập</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.usersession.role==1}">
                    <li class="nav-item" style="inline-size: max-content;"><a class="nav-link" href="manager.jsp">Quản lý</a></li>
                </c:if> 
            </ul>

            <div class="info_user">
                <c:if test="${sessionScope.usersession!=null}">
                    <ul class="user">
                       <li class="nav-item">
                           <a class="nav-link d-flex">
                               <i class="fas fa-user-circle"></i>
                               <span class="ml-3 text-white mt-1" style="inline-size: max-content;" >
                                   ${sessionScope.usersession.username}
                               </span>
                           </a>
                            <ul class="sub_user">
                                <li><a href="changePassword.jsp">Đổi mật khẩu</a></li>
                                <li><a href="logout">Đăng xuất<i class="fas fa-sign-out-alt"></i></a></li>
                            </ul>
                        </li>
                    </ul>
                </c:if>
            </div>
        </div>
    </div>
</nav>
