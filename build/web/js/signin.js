/* 
 * @author: CARLOSHG
 */
function Fsignin() {

    if (document.getElementById("user").value === "" || document.getElementById("pass").value === "" || document.getElementById("pass2").value === "" || document.getElementById("mail").value === "" || document.getElementById("q").value === "" || document.getElementById("ans").value === "") {
        alert("Por favor llene todos los campos solicitados");
        document.getElementById("msj").innerHTML = "Por favor llene todos los campos solicitados";
        if (document.getElementById("user").value === "") {
            alert("Debes ingresar tu nombre correctamente");
            document.getElementById("user").focus();
        }
        if (document.getElementById("pass").value === "" || document.getElementById("pass").value.length < 8) {
            alert("Debes ingresar tu contraseña correctamente");
            document.getElementById("pass").focus();
        }
        if (document.getElementById("pass2").value === "" || document.getElementById("pass2").value.length < 8) {
            alert("Debes repetir tu contraseña correctamente");
            document.getElementById("pass2").focus();
        }
        if (document.getElementById("mail").value === "") {
            alert("Debes ingresar tu correo  correctamente");
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
        if (document.getElementById("q").value === "" || (document.getElementById("q").value !== "friend" || document.getElementById("q").value !== "pet" || document.getElementById("q").value !== "col")) {
            alert("Debes seleccionar tu pregunta de seguridad");
            document.getElementById("q").focus();
        }
        if (document.getElementById("ans").value === "") {
            alert("Debes ingresar tu respuesta correctamente");
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
function Fupdatedata(){
    
    if (document.getElementById("user").value === "" || document.getElementById("pass").value === "" || document.getElementById("mail").value === "" || document.getElementById("q").value === "" || document.getElementById("ans").value === "") {
        alert("Por favor llene todos los campos solicitados");
        document.getElementById("msj").innerHTML = "Por favor llene todos los campos solicitados";
        if (document.getElementById("user").value === "") {
            alert("Debes ingresar tu nombre correctamente");
            document.getElementById("user").focus();
        }
        if (document.getElementById("mail").value === "") {
            alert("Debes ingresar tu correo  correctamente");
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
        if (document.getElementById("q").value === "") {
            alert("Debes seleccionar tu pregunta de seguridad");
            document.getElementById("q").focus();
        }
        if (document.getElementById("ans").value === "") {
            alert("Debes ingresar tu respuesta correctamente");
            document.getElementById("ans").focus();
        }
        if (document.getElementById("pass").value === "" || document.getElementById("pass").value.length < 8) {
            alert("Debes ingresar tu contraseña");
            document.getElementById("pass").focus();
        }
        return false;
    }
    
}
function Fupdatepass(){
    
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