/* 
 * @author: CARLOSHG
 */
function Fl_signin() {

    if (document.getElementById("user").value === "" || document.getElementById("pass").value === "" || document.getElementById("pass2").value === "" || document.getElementById("mail").value === "" || document.getElementById("ced").value === "" || document.getElementById("ph").value === "" || document.getElementById("q").value === "" || document.getElementById("ans").value === "") {
        alert("Por favor llene todos los campos solicitados");
        document.getElementById("msj").innerHTML = "Por favor llene todos los campos solicitados";
        if (document.getElementById("user").value === "") {
            alert("Debes ingresar tu nombre");
            document.getElementById("user").focus();
        }
        if (document.getElementById("pass").value === "" || document.getElementById("pass").value.length < 8) {
            alert("Debes ingresar tu contraseña");
            document.getElementById("pass").focus();
        }
        if (document.getElementById("pass2").value === "" || document.getElementById("pass2").value.length < 8) {
            alert("Debes repetir tu contraseña");
            document.getElementById("pass2").focus();
        }
        if (document.getElementById("mail").value === "") {
            alert("Debes ingresar tu correo");
            document.getElementById("mail").focus();
        } else {
            if (document.getElementById("mail").value.length < 6) {
                alert("Correo de la forma (x@x.x)");
                document.getElementById("mail").focus();
            } else {
                if (document.getElementById("mail").value.indexOf('@') === -1 || document.getElementById("mail").value.indexOf('.') === -1) {
                    alert("Correo de la forma (x@x.x)");
                    document.getElementById("mail").focus();
                }
            }
        }
        if (document.getElementById("ced").value === "") {
            alert("Debes ingresar tu cedula");
            document.getElementById("ced").focus();
        }
        if (document.getElementById("ph").value === "") {
            alert("Debes ingresar tu numero telefónico");
            document.getElementById("ph").focus();
        }
        if (document.getElementById("q").value === "" || (document.getElementById("q").value !== "friend" || document.getElementById("q").value !== "pet" || document.getElementById("q").value !== "col")) {
            alert("Debes seleccionar tu pregunta de seguridad");
            document.getElementById("q").focus();
        }
        if (document.getElementById("ans").value === "") {
            alert("Debes ingresar tu respuesta");
            document.getElementById("ans").focus();
        }
        return false;
    } else {
        if (document.getElementById("pass").value !== document.getElementById("pass2").value) {
            alert("Las contraseñas no coinciden");
            document.getElementById("pass2").focus();
            document.getElementById("msj").innerHTML = "Las contraseñas no coinciden";
            return false;
        }
    }

}
function Fl_updatedata(){
    
    if (document.getElementById("user").value === "" || document.getElementById("mail").value === "" || document.getElementById("ced").value === "" || document.getElementById("ph").value === "" || document.getElementById("q").value === "" || document.getElementById("ans").value === "") {
        alert("Por favor llene todos los campos solicitados");
        document.getElementById("msj").innerHTML = "Por favor llene todos los campos solicitados";
        if (document.getElementById("user").value === "") {
            alert("Debes ingresar tu nombre");
            document.getElementById("user").focus();
        }
        if (document.getElementById("mail").value === "") {
            alert("Debes ingresar tu correo");
            document.getElementById("mail").focus();
        } else {
            if (document.getElementById("mail").value.length < 6) {
                alert("Correo de la forma (x@x.x)");
                document.getElementById("mail").focus();
            } else {
                if (document.getElementById("mail").value.indexOf('@') === -1 || document.getElementById("mail").value.indexOf('.') === -1) {
                    alert("Correo de la forma (x@x.x)");
                    document.getElementById("mail").focus();
                }
            }
        }
        if (document.getElementById("ced").value === "") {
            alert("Debes ingresar tu cedula");
            document.getElementById("ced").focus();
        }
        if (document.getElementById("ph").value === "") {
            alert("Debes ingresar tu numero telefónico");
            document.getElementById("ph").focus();
        }
        if (document.getElementById("q").value === "") {
            alert("Debes seleccionar tu pregunta de seguridad");
            document.getElementById("q").focus();
        }
        if (document.getElementById("ans").value === "") {
            alert("Debes ingresar tu respuesta");
            document.getElementById("ans").focus();
        }
        if (document.getElementById("pass").value === "" || document.getElementById("pass").value.length < 8) {
            alert("Debes ingresar tu contraseña");
            document.getElementById("pass").focus();
        }
        return false;
    }
    
}
function Fl_updatepass(){
    
    if (document.getElementById("npass").value === "" || document.getElementById("pass2").value === "" || document.getElementById("npass2").value === "") {
        alert("Por favor llene todos los campos solicitados");
        document.getElementById("msj").innerHTML = "Por favor llene todos los campos solicitados";
        if (document.getElementById("pass2").value === "" || document.getElementById("pass2").value.length < 8) {
            alert("Debes ingresar tu contraseña correctamente");
            document.getElementById("pass2").focus();
        }
        if (document.getElementById("npass").value === "" || document.getElementById("npass").value.length < 8) {
            alert("Debes ingresar tu contraseña correctamente");
            document.getElementById("npass").focus();
        }
        if (document.getElementById("npass2").value === "" || document.getElementById("npass2").value.length < 8) {
            alert("Debes ingresar tu contraseña correctamente");
            document.getElementById("npass2").focus();
        }
        return false;
    } else {
        if (document.getElementById("npass").value !== document.getElementById("npass2").value) {
            alert("Las contraseñas no coinciden");
            document.getElementById("npass2").focus();
            document.getElementById("msj").innerHTML = "Las contraseñas no coinciden";
            return false;
        }
    }
    
}
function Fl_sug(){
    if (document.getElementById("categoria").value === "" || document.getElementById("sugerencia").value === "" || document.getElementById("titulo").value === "") {
        alert("Por favor llene todos los campos solicitados");
        document.getElementById("msj").innerHTML = "Por favor llene todos los campos solicitados";
        if (document.getElementById("titulo").value === "") {
            alert("Debes ingresar el titulo de la sugerencia en un máximo de 10 caracteres.");
            document.getElementById("titulo").focus();
        }
        if (document.getElementById("categoria").value === "") {
            alert("Debes seleccionar la categoria de la sugerencia.");
            document.getElementById("categoria").focus();
        }
        if (document.getElementById("sugerencia").value === "") {
            alert("Debes ingresar el contenido de la sugerencia en un máximo de 1000 caracteres.");
            document.getElementById("sugerencia").focus();
        }
        return false;
    }
}