var prevScrollpos = window.pageYOffset;
window.onscroll = function () {
    var currentScrollPos = window.pageYOffset;
    if (prevScrollpos > currentScrollPos) {
        document.querySelector(".menu_opc").style.top = "0";
        document.querySelector("#qtd_manut_pendentes").style.top = "16px";
        document.querySelector(".main-menu-bars").style.top = "4px";
    } else if (prevScrollpos < currentScrollPos) {
        document.querySelector(".menu_opc").style.top = "-80px";
        document.querySelector("#qtd_manut_pendentes").style.top = "-80px";
        document.querySelector(".main-menu-bars").style.top = "-80px";
    } else {
        null;
    }

    prevScrollpos = currentScrollPos;
}