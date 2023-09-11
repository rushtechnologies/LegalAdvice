/* 
 * @author: CARLOSHG
 */
window.onload = function () {
    var firstInput = document.getElementById("pass");
    var myInput = document.getElementById('pass2');
    firstInput.oncopy = function (e) {
        e.preventDefault();
        alert("No puedes copiar y pegar en campos de contraseña");
        document.getElementById("msj").innerHTML = "No puedes copiar y pegar en campos de contraseña";
    };
    firstInput.onpaste = function (e) {
        e.preventDefault();
        alert("No puedes copiar y pegar en campos de contraseña");
        document.getElementById("msj").innerHTML = "No puedes copiar y pegar en campos de contraseña";
    };
    myInput.onpaste = function (e) {
        e.preventDefault();
        alert("No puedes copiar y pegar en campos de contraseña");
        document.getElementById("msj").innerHTML = "No puedes copiar y pegar en campos de contraseña";
    };
    myInput.oncopy = function (e) {
        e.preventDefault();
        alert("No puedes copiar y pegar en campos de contraseña");
        document.getElementById("msj").innerHTML = "No puedes copiar y pegar en campos de contraseña";
    };
};