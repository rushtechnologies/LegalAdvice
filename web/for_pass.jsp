<%-- 
    Document   : for_pass
    Created on : 15/09/2018, 09:42:11 PM
    Author     : CARLOSHG
--%>
<!--
    @author: Carlos Huerta García
    Material Design Lite
    Copyright 2015 Google Inc. All rights reserved.
    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at
    https://www.apache.org/licenses/LICENSE-2.0
    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
-->
<%@page contentType="text/html" pageEncoding="UTF-8" session="true" import="com.Legal_Advice.Database.Encrypt, org.owasp.esapi.ESAPI, com.Legal_Advice.Models.Abogado, com.Legal_Advice.Models.Usuario, com.Legal_Advice.DAO.iAbogado, com.Legal_Advice.DAO.iUsuario, com.Legal_Advice.ImpDAO.ImpUsuario, com.Legal_Advice.ImpDAO.ImpAbogado, com.Legal_Advice.Mail.Email"%>
<!DOCTYPE html>
<html land="es">
    <head>
        <title>¿Olvidó su Contraseña?</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="A front-end template that helps you build fast, modern mobile web apps.">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
        <meta name="mobile-web-app-capable" content="yes">
        <link rel="icon" sizes="192x192" href="images/android-desktop.png">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="apple-mobile-web-app-title" content="Material Design Lite">
        <link rel="apple-touch-icon-precomposed" href="images/ios-desktop.png">
        <meta name="msapplication-TileImage" content="images/touch/ms-touch-icon-144x144-precomposed.png">
        <meta name="msapplication-TileColor" content="#3372DF">
        <link rel="shortcut icon" href="images/favicon.png">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.red-pink.min.css" />
        <link rel="stylesheet" href="css/styles_login.css">
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            iAbogado impabogado = new ImpAbogado();
            iUsuario impusuario = new ImpUsuario();
            Encrypt cifrado = new Encrypt();
            String error = "http://localhost:"+request.getLocalPort()+"/com.Legal_Advice/login.html";
            String locationu = "http://localhost:"+request.getLocalPort()+"/com.Legal_Advice/home.jsp";
            String locationa = "http://localhost:"+request.getLocalPort()+"/com.Legal_Advice/l_home.jsp";
            int empty = 0;
            int id = 0;
            String nombre = "";
            String pregunta = "";
            String tipo = "";
            String login = "";
            if(request.getParameter("user") != null && !request.getParameter("user").equals("")){
                nombre = ESAPI.encoder().encodeForHTML(cifrado.decrypt(request.getParameter("user")));
                sesion = request.getSession(true);
                sesion.setAttribute("nombre", ESAPI.encoder().decodeForHTML(nombre));
            }
            else{
                nombre=sesion.getAttribute("nombre").toString();
                id=Integer.parseInt(sesion.getAttribute("id").toString());
                if(nombre.equals("")||nombre==null){
                    response.sendRedirect(error);
                }
            }
            String error2 = "http://localhost:"+request.getLocalPort()+"/com.Legal_Advice/for_pass.jsp?user="+cifrado.encryptst(ESAPI.encoder().decodeForHTML(nombre));
            if (request.getParameter("submitla") != null) {
                if (request.getParameter("submitla").equals("Recuperar")) {
                    if (!request.getParameter("ans").equals("")&&request.getParameter("ans")!=null) {
                        String respuestaIngresada = ESAPI.encoder().encodeForHTML(request.getParameter("ans"));
                        String respuestaCorrecta = "";
                        String contra = "";
                        String correo = "";
                        String de = "rushtechnologiessadecv@gmail.com";
                        String clave = "Rt2018cecyt9";
                        String mensaje = "";
                        String asunto = "Legal Advice por Rush Technologies, recuperar contraseña";
                        nombre = sesion.getAttribute("nombre").toString();
                        id = Integer.parseInt(sesion.getAttribute("id").toString());
                        tipo = sesion.getAttribute("tipo").toString();
                        if (tipo.equals("a")) {
                            respuestaCorrecta = impabogado.readAbogado(id).getA_respuesta();
                            if(ESAPI.encoder().decodeForHTML(respuestaIngresada).equalsIgnoreCase(ESAPI.encoder().decodeForHTML(respuestaCorrecta))){
                                contra=ESAPI.encoder().decodeForHTML(impabogado.readAbogado(id).getA_contra());
                                correo=ESAPI.encoder().decodeForHTML(impabogado.readAbogado(id).getA_correo());
                                mensaje = "Hola estimado: "+nombre+"\n"+"\n"+"Se ha recibido su solicitud para recuperar su contraseña y en respuesta,"+"\n"+"Su contraseña es: "+contra+" (Obtenida a partir del descifrado de su contraseña ingresada)"+"\n"+"\n"+"No la olvide ;-)"+"\n"+"\n"+"Atte. Rush Tecnologies S.A. de C.V.";
                                Email email = new Email();
                                try{
                                    boolean envio=email.enviarCorreo(de, clave, correo, mensaje, asunto);
                                    login = "ok";
                                    if(envio){
                                        out.println("<script>mailpass()</script>");
                                        if(login.equals("ok")){
                                            response.sendRedirect(locationa + "?abogado_id=" + cifrado.encryptid(id));
                                        }
                                    }
                                    else{
                                        out.println("<script>error()</script>");
                                        response.sendRedirect(error2);
                                    }
                                }
                                catch(Exception e){
                                    System.out.println(e.getMessage());
                                }
                            }
                        } else {
                            if (tipo.equals("u")) {
                                respuestaCorrecta = impusuario.readUsuario(id).getU_respuesta();
                                if(ESAPI.encoder().decodeForHTML(respuestaIngresada).equalsIgnoreCase(ESAPI.encoder().decodeForHTML(respuestaCorrecta))){
                                    contra = ESAPI.encoder().decodeForHTML(impusuario.readUsuario(id).getU_contra());
                                    correo = ESAPI.encoder().decodeForHTML(impusuario.readUsuario(id).getU_correo());
                                    mensaje = "Hola estimado: "+nombre+"\n"+"\n"+"Se ha recibido su solicitud para recuperar su contraseña y en respuesta,"+"\n"+"Su contraseña es: "+contra+" (Obtenida a partir del descifrado de su contraseña ingresada)"+"\n"+"\n"+"No la olvide ;-)"+"\n"+"\n"+"Atte. Rush Tecnologies S.A. de C.V.";
                                    Email email = new Email();
                                    try{
                                        boolean envio=email.enviarCorreo(de, clave, correo, mensaje, asunto);
                                        login = "ok";
                                        if(envio){
                                            out.println("<script>mailpass()</script>");
                                            if(login.equals("ok")){
                                                response.sendRedirect(locationu + "?usuario_id=" + cifrado.encryptid(id));
                                            }
                                        }
                                        else{
                                            out.println("<script>error()</script>");
                                            response.sendRedirect(error2);
                                        }
                                    }
                                    catch(Exception e){
                                        System.out.println(e.getMessage());
                                    }
                                }
                            }
                        }
                    } else {
                        response.sendRedirect(error2);
                    }
                }
            } else {
                if (!request.getParameter("user").equals("")&& request.getParameter("user") != null) {
                    nombre = ESAPI.encoder().encodeForHTML(cifrado.decrypt(request.getParameter("user")));
                    sesion = request.getSession(true);
                    sesion.setAttribute("nombre", nombre);
                } else {
                    ++empty;
                }
                if (empty > 0) {
                    response.sendRedirect(error);
                } else {
                    id = impabogado.existanceAbogado(nombre);
                    sesion.setAttribute("id", id);
                    if (id == 0) {
                        id = impusuario.existanceUsuario(nombre);
                        sesion.setAttribute("id", id);
                        if (id == 0) {
                            response.sendRedirect(error);
                        } else {
                            tipo = "u";
                            sesion.setAttribute("tipo", tipo);
                        }
                    } else {
                        tipo = "a";
                        sesion.setAttribute("tipo", tipo);
                    }
                    if (tipo.equals("a")) {
                        nombre = impabogado.readAbogado(id).getA_nombre();
                        pregunta = impabogado.readAbogado(id).getA_pregunta();
                    } else {
                        if (tipo.equals("u")) {
                            nombre = impusuario.readUsuario(id).getU_nombre();
                            pregunta = impusuario.readUsuario(id).getU_pregunta();
                        }
                    }
                }
            }
        %>
        <div class="demo-layout mdl-layout mdl-layout--fixed-header mdl-js-layout mdl-color--grey-100">
            <header class="demo-header mdl-layout__header mdl-layout__header--scroll mdl-color--grey-100 mdl-color-text--grey-800">
                <div class="mdl-layout__header-row">
                    <span class="mdl-layout-title">¿Olvidó su Contraseña?</span>
                    <div class="mdl-layout-spacer"></div>
                </div>
            </header>
            <div class="demo-ribbon"></div>
            <main class="demo-main mdl-layout__content">
                <div class="demo-container mdl-grid">
                    <div class="mdl-cell mdl-cell--2-col mdl-cell--hide-tablet mdl-cell--hide-phone"></div>
                    <div class="demo-content mdl-color--white mdl-shadow--4dp content mdl-color-text--grey-800 mdl-cell mdl-cell--8-col">
                        <div class="demo-crumbs mdl-color-text--grey-500">
                            Legal Advice
                        </div>
                        <table border="0" width="100%">
                            <tr><td colspan="2" width="100%"><center><p><img src="images/logo.png" width="225" alt="Logo"></p></center></td></tr>
                            <tr>
                                <td width="50%">
                                    <h3>Recuperar Contraseña</h3>
                                    <h4><%=nombre%></h4>
                                    <br/>
                                    <p id="msj"></p>
                                    <form action="for_pass.jsp" method="post" name="recover" id='recover'>
                                        <div class="demo-crumbs mdl-color-text--grey-800">
                                            Conteste su pregunta de seguridad
                                        </div>
                                        <h5><%=pregunta%></h5>
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input" type="text" name="ans" id="ans" autocomplete="off" onkeypress="alpha()" pattern="[a-zA-Z]+(\s*[a-zA-Z]*)*[a-zA-Z]">
                                            <label class="mdl-textfield__label" for="ans">Respuesta</label>
                                        </div>
                                        <div class="demo-crumbs mdl-color-text--grey-800">
                                            Se le enviará su contraseña a al correo electrónco con el que se registró a Legal Advice.
                                        </div>
                                        <br/>
                                        <br/>
                                        <!--<input type="hidden" name="user" value='<%=nombre%>'>-->
                                        <button type="submit" id="login" onclick="return Frecover();" name="submitla" value="Recuperar" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">Recuperar</button>
                                    </form>
                                </td>
                                <td width="50%"><center><p><img src="images/la2.fw.png" width="350" alt="Logo"></p></center></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div style="height: 42vh; width: 100%"></div>
                <footer class="demo-footer mdl-mini-footer">
                    <div class="mdl-mini-footer--left-section">
                        <ul class="mdl-mini-footer--link-list">
                            <li><a href="index.html">Página de inicio</a></li>
                            <li><a href="about.html">Acerca de</a></li>
                            <li><a href="login.html">Acceder</a></li>
                            <li><a href="signin.html">Nuevo Usuario</a></li>
                            <li><a href="l_signin.html">Nuevo abogado</a></li>
                        </ul>
                    </div>
                    <div class="mdl-mini-footer--right-section">
                        Rush Techologies
                    </div>
                </footer>
            </main>
        </div>
        <script src="js/legal_advice.js"></script>
        <script src="js/recover.js"></script>
        <script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    </body>
</html>