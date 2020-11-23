var prevScrollpos = window.pageYOffset;
window.onscroll = function () {
    var currentScrollPos = window.pageYOffset;
    if (prevScrollpos > currentScrollPos) {
        document.querySelector(".main-menu-bottom").style.bottom = "0";
    } else {
        document.querySelector(".main-menu-bottom").style.bottom = "-80px";
    }
    prevScrollpos = currentScrollPos;
}