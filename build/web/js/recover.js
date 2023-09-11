/* 
 * @author: CARLOSHG
 */
function Frecover(){
    
    if(document.getElementById("ans").value===""){
        alert("Por favor llene todos los campos solicitados");
        document.getElementById("msj").innerHTML = "Por favor llene todos los campos solicitados";
        return false;
    }
    if(document.getElementById("ans").value===""){
        alert("Respuesta");
        document.getElementById("ans").focus();
        return false;
    }
}