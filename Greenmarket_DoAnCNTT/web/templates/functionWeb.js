function LoadMore() {
    var num=document.getElementsByClassName("card").length;
    $.ajax({
        url: "/WebShop/load",
        type: "get",
        data:{
            amount:num
        },
        success: function (data) {
           var row=document.getElementById("content");
           row.innerHTML+=data;
        },
        error: function (xhr) {
        }
    });
}
function message() {
    alert("Đặt hàng thành công!");
}
function messPass() {
    alert("Mật khẩu đã thay đổi. Vui lòng kiểm tra mail!");
}

