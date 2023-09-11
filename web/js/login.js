/* 
 * @author: CARLOSHG
 */
/* global grecaptcha */

function Flogin() {

    if (document.getElementById("user").value === "" || document.getElementById("pass").value === "") {
        alert("Por favor llene todos los campos solicitados");
        document.getElementById("msj").innerHTML = "Por favor llene todos los campos solicitados";
        if (document.getElementById("user").value === "") {
            alert("Deebes ingresar tu nombre");
            document.getElementById("user").focus();
        } else {
            if (document.getElementById("pass").value === "" || document.getElementById("pass").value.length < 8) {
                alert("Debes ingresar tu contraseña");
                document.getElementById("pass").focus();
            }
        }

        return false;
    }
}
function Factivate() {

    if (document.getElementById("pass").value === "") {
        alert("Por favor llene todos los campos solicitados");
        document.getElementById("msj").innerHTML = "Por favor llene todos los campos solicitados";
            if (document.getElementById("pass").value === "" || document.getElementById("pass").value.length < 8) {
                alert("Debes ingresar tu contraseña");
                document.getElementById("pass").focus();
            }
        return false;
    } else{
        var grec = "";
        var grec = grecaptcha.getResponse("g-recaptcha");
        document.getElementById("grec").value = grec;
        if(grec === "" || grec === null){
            alert("Por favor llene todos los campos solicitados");
            document.getElementById("msj").innerHTML = "Por favor llene todos los campos solicitados";
            alert("Debes verificar el captcha");
            return false;
        } else{
            return true;
        }
    }
}
