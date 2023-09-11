/* 
 * @author: CARLOSHG
 */
function alpha() {
    var letras = "ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz";
    var x = event.keyCode;
    var letra = String.fromCharCode(x);
    var n = letras.indexOf(letra);
    if (n === -1) {
        if (x === 13) {
            event.returnValue = true;
        } else {
            event.returnValue = false;
            alert("Ingresa sólo letras de la A-Z o a-z");
            document.getElementById("msj").innerHTML = "Ingresa sólo letras de la A-Z o a-z";
        }
    }
}
function alphap(){
    var letras = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz,:;.-_()/&"';
    var x = event.keyCode;
    var letra = String.fromCharCode(x);
    var n = letras.indexOf(letra);
    if (n === -1) {
        if (x === 13) {
            event.returnValue = true;
        } else {
            event.returnValue = false;
            alert("Ingresa sólo letras de la A-Z o a-z");
            document.getElementById("msj").innerHTML = "Ingresa sólo letras de la A-Z o a-z";
        }
    }
}
function numeric() {
    if (event.keyCode < 48 || event.keyCode > 57) {
        if (event.keyCode === 13){
            event.returnValue = true;
        } else{
            event.returnValue = false;
            alert("Ingresa sólo números");
            document.getElementById("msj").innerHTML = "Ingresa sólo números";
        }
    }
}
function alphanumeric() {
    var letras = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    var x = event.keyCode;
    var letra = String.fromCharCode(x);
    var n = letras.indexOf(letra);
    if (n === -1) {
        if (x === 13) {
            event.returnValue = true;
        } else {
            event.returnValue = false;
            alert("Ingresa sólo letras de la A-Z o a-z");
            document.getElementById("msj").innerHTML = "Ingresa sólo letras de la A-Z o a-z";
        }
    }
}
function email() {
    var letras = "@._-1234567890ABCDEFGHIKKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    var x = event.keyCode;
    var letra = String.fromCharCode(x);
    var n = letras.indexOf(letra);
    if (n === -1) {
        if (x === 13) {
            event.returnValue = true;
        } else {
            event.returnValue = false;
            alert("Ingresa sólo letras de la A-Z o a-z");
            document.getElementById("msj").innerHTML = "Ingresa sólo letras de la A-Z o a-z";
        }
    }
}
function invalid(){
    alert("Campos solicitados inválidos");
}
function failedlogin(){
    alert("Usuario o contraseña incorrectos, revise sus datos");
}
function exists(){
    alert("El usuario que se intenta registrar ya existe, intenta con Acceder");
}
function error() {
    alert("Ocurrió un error, active su cuenta con el correo que le enviaremos, si el error persiste intente más tarde");
    document.getElementById("msj").innerHTML = "Ocurrió un error, intente más tarde";
}
function mailContact() {
    alert("Se ha enviado un correo electrónico notificando el contacto");
}
function mailpass() {
    alert("Ya puede recuperar su contraseña en su correo electrónico, a continuación accederá a Legal Advice");
}
function checked(){
    alert("Revisado");
}
function updated(){
    alert("Sus datos han sido actualizados");
}
function updatedPass(){
    alert("Su contraseña ha sido actualizada");
}
function contactar(){
    var contactar = confirm("¿Está seguro de contactar al abagado en cuestión? Se le enviará un correo electrónico notificándole su contacto");
    if (contactar === true) {
        return true;
    } else {
        return false;
    }
}
function revisar(){
    var revisar = confirm("¿Está seguro de revisar el contacto en cuestión? Se le enviará un correo electrónico al usuario notificándole su revisión");
    if (revisar === true) {
        return true;
    } else {
        return false;
    }
}
function aprobar(){
    var aprobar = confirm("¿Está seguro de aprobar la sugerencia en cuestión? (Sólo se registra una aprobación por abogado)");
    if (aprobar === true) {
        return true;
    } else {
        return false;
    }
}
function ns(){
    alert("Sugerencia registrada exitosamente.");
}
function as(){
    alert("Sugerencia aprobada exitosamente.");
}
/*function fill(){
    var heightHeader = $('header').height();
    var heightFooter = $('footer').height();
    var mainHeight = heightHeader + heightFooter;
    var divHeight = 'calc(100vh - ' + mainHeight + 'px)';
    $('.main-content').css('min-height', divHeight);
}*/