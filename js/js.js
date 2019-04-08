$(function () {
   $("#creditos").on("click",function () {
       $("#creditos h2").css("padding-bottom",0);
       $("#creditos h2:hover").css("background-color","rgba(66,66,66,0.95)");
       $("#creditos h2:hover").css("color","white");
       $("#js").html("Adrián Calvo"+"<br>"+"Jorge García");
   });
});
$(function () {
    $("#desplegar").on("click",function () {

        if ($("#menu").hasClass("quitar")) {
            $("#portada").css("left", "17%");
            $("#portada").css("width", "83%");
            $("#menu").removeClass("quitar");
            $(".conten").addClass("contenjs");
        }else{
            $("#portada").css("left", "");
            $("#portada").css("width", "100%");
            $("#menu").addClass("quitar");
            $(".conten").removeClass("contenjs");
        }
    });
})