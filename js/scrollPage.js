var prevScrollpos = window.pageYOffset;
window.onscroll = function () {
    var currentScrollPos = window.pageYOffset;
    if (tem_conexao()) {
        if (prevScrollpos > currentScrollPos) {
            document.querySelector(".menu_opc").style.top = "0";
            document.querySelector("#qtd_manut_pendentes").style.top = "16px";
            document.querySelector(".main-menu-bars").style.top = "4px";
        } else if (prevScrollpos < currentScrollPos) {
            document.querySelector(".menu_opc").style.top = "-80px";
            document.querySelector("#qtd_manut_pendentes").style.top = "-80px";
            document.querySelector(".main-menu-bars").style.top = "-80px";
        } else {
            console.log('entrou');
        }

        prevScrollpos = currentScrollPos;
    }
}

function tem_conexao() {
    if (navigator.connection.type == 0 || navigator.connection.type == 'none') {
        return false;
    } else {
        return true;
    }
}