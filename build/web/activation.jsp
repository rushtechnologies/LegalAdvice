<%-- 
    Document   : activation
    Created on : 16/02/2019, 05:41:28 PM
    Author     : CARLOSHG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true" import="org.owasp.esapi.ESAPI, com.Legal_Advice.Database.Encrypt, com.Legal_Advice.Models.Abogado, com.Legal_Advice.ImpDAO.ImpAbogado, com.Legal_Advice.DAO.iAbogado, com.Legal_Advice.Models.Usuario, com.Legal_Advice.DAO.iUsuario, com.Legal_Advice.ImpDAO.ImpUsuario, net.tanesha.recaptcha.ReCaptcha;, net.tanesha.recaptcha.ReCaptchaFactory, net.tanesha.recaptcha.ReCaptchaImpl, net.tanesha.recaptcha.ReCaptchaResponse"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Activación de Usuario</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Legal Advice">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
        <meta name="mobile-web-app-capable" content="yes">
        <link rel="icon" sizes="192x192" href="images/android-desktop.png">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="white">
        <meta name="apple-mobile-web-app-title" content="Material Design Lite">
        <link rel="apple-touch-icon-precomposed" href="images/ios-desktop.png">
        <meta name="msapplication-TileImage" content="images/touch/ms-touch-icon-144x144-precomposed.png">
        <meta name="msapplication-TileColor" content="#3372DF">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.red-pink.min.css" />
        <link rel="stylesheet" href="css/styles_login.css">
    </head>
    <body>
        <%
            HttpSession sesion;
            iAbogado impabogado = new ImpAbogado();
            iUsuario impusuario = new ImpUsuario();
            Encrypt cifrado = new Encrypt();
            String error = "http://localhost:" + request.getLocalPort() + "/com.Legal_Advice/login.html";
            String encrypted = "";
            int id = 0;
            String nombre = "";
            String decrypted = "";
            if (request.getParameter("id") != null && !request.getParameter("id").equals("")) {
                encrypted = request.getParameter("id");
                decrypted = cifrado.decrypt(encrypted);
                if (decrypted != null) {
                    id = Integer.parseInt(decrypted);
                    if (impusuario.readUsuario(id) != null) {
                        Usuario usuario = impusuario.readUsuario(id);
                        nombre = usuario.getU_nombre();
                        sesion = request.getSession(true);
                        sesion.setAttribute("id", id);
                        if (usuario.isU_activacion()){
                            response.sendRedirect(error);
                        }
                    } else {
                        if (impabogado.readAbogado(id) != null) {
                            Abogado abogado = impabogado.readAbogado(id);
                            nombre = abogado.getA_nombre();
                            sesion = request.getSession(true);
                            sesion.setAttribute("id", id);
                            if (abogado.isA_activacion()){
                                response.sendRedirect(error);
                            }
                        } else {
                            out.println("<script>failedLogin();</script>");
                            response.sendRedirect(error);
                        }
                    }
                } else {
                    out.println("<script>failedLogin();</script>");
                    response.sendRedirect(error);
                }
            } else {
                out.println("<script>failedLogin();</script>");
                response.sendRedirect(error);
            }
        %>
        <div class="demo-layout mdl-layout mdl-layout--fixed-header mdl-js-layout mdl-color--grey-100">
            <header class="demo-header mdl-layout__header mdl-layout__header--scroll mdl-color--grey-100 mdl-color-text--grey-800">
                <div class="mdl-layout__header-row">
                    <span class="mdl-layout-title">Activación de Usuario</span>
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
                            <tr><td colspan="2" width="100%"><center><p><img src="images/logo.png" width="25%" alt="Logo"></p></center></td></tr>
                            <tr>
                                <td width="70%">
                                    <h3>Activación de Usuario</h3>
                                    <p class="mdl-color-text--primary-dark" id="msj"></p>
                                    <form action="Controller" method="post" name="activate">
                                        <h4><%=nombre%></h4>
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input" type="password" name="pass" id="pass" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"/>
                                            <label class="mdl-textfield__label" for="pass">Contraseña</label>
                                        </div>
                                        <div class="mdl-tooltip mdl-tooltip--large" for="pass">Ingrese su contraseña.</div>
                                        <br/>
                                        <br/>
                                        <p id="fp">¿Olvidó su contraseña?</p>
                                        <div class="mdl-tooltip mdl-tooltip--large" for="fp">Intente ingresar su contraseña y de ser usuario podrá recuperar su contraseña.</div>
                                        <br/>
                                        <div id="g-recaptcha" class="g-recaptcha" data-sitekey="6LdM9pEUAAAAALBEK1DUwfgdZQjMTVGDvr4YMBO-"></div>
                                        <input type="hidden" name="grec" value="" id="grec"/>
                                        <br/><br/>
                                        <button type="submit" id="activate" onclick="return Factivate();" name="submitla" value="Activacion" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">Activar cuenta</button>
                                    </form>
                                </td>
                                <td class="mdl-layout--large-screen-only" width="30%"><center><p><img src="images/la2.fw.png" width="90%" alt="Logo"></p></center></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div style="height: 42vh; width: 100%"></div>
                <footer class="demo-footer mdl-mini-footer">
                    <div class="mdl-mini-footer--left-section">
                        <ul class="mdl-mini-footer--link-list">
                            <li><a href="index.html">Pagina de inicio</a></li>
                            <li><a href="login.html">Acceder</a></li>
                            <li><a href="signin.html">Nuevo Usuario</a></li>
                            <li><a href="l_signin.html">Nuevo abogado</a></li>
                            <li><a href="about.html">Acerca de</a></li>
                        </ul>
                    </div>
                    <div class="mdl-mini-footer--right-section">
                        Rush Techologies
                    </div>
                </footer>
            </main>
        </div>
        <script async defer src="https://www.google.com/recaptcha/api.js"></script>
        <script src="js/legal_advice.js"></script>
        <script src="js/login.js"></script>
        <script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    </body>
</html>
