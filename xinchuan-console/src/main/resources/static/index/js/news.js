$(function () {
    //模糊图片
    var img = new Image();
    img.src = "/index/img/news/banner.png";
    img.onload = function() {
        $(".banner").css("transition","background-image 0.3s");
        $(".banner").css("background-image","url('/index/img/news/banner.png')");
    };

});