<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
        ${msg("loginTitle",(realm.displayName!''))}
    <#elseif section = "header">
        ${msg("loginTitleHtml",(realm.displayNameHtml!''))?no_esc}
    <#elseif section = "form">
        <#if realm.password>
            <form class="${properties.kcFormClass!}" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                <div class="form-group">
                    <div class="form-group__row-input">
                        <span class="icon icon-user-1"></span>
                        <input id="username" name="username" type="text" class="form-control form-control--login" aria-describedby="login" placeholder="<#if !realm.loginWithEmailAllowed>${msg('username')}<#elseif !realm.registrationEmailAsUsername>${msg('usernameOrEmail')}<#else>${msg('email')}</#if>" value="${(login.username!'')}" autocomplete="off" aria-autocomplete="none">
                    </div>
                    <div class="form-group__row-input">
                        <span class="icon icon-locker"></span>
                        <span class="icon icon-eye"></span>
                        <input id="password" name="password" type="password" class="form-control form-control--password" aria-describedby="password" placeholder="${msg('password')}" autocomplete="off" aria-autocomplete="none">
                    </div>
                    <script type="text/javascript">
                        const classname = document.querySelector('.icon-eye');
                        classname.addEventListener("click", function() {
                            const $password = document.getElementById("password");
                            if ($password.type === 'password') {
                                $password.type = 'text';
                            } else {
                                $password.type = 'password';
                            }
                        }, false);
                    </script>
                </div>
                <div class="form-group mr-tp2">
                    <button class="btn btn-danger btn-block" type="submit" name="login" id="kc-login">${msg('doLogIn')} <span class="icon icon-chevron-right"></span></button>
                    <!--<button class="btn btn-dark btn-block">Вход с помощью Электронной подписи <span class="icon icon-chevron-right"></span></button>-->
                </div>
                <div class="form-login-bottom">
                    <#if realm.resetPasswordAllowed>
                        <a href="${url.loginResetCredentialsUrl}">${msg('doForgotPassword')}</a>
                    </#if>
                </div>

                <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
                    <div class="form-login-bottom">
                        <span>${msg('noAccount')}</span>
                        <a tabindex="6" href="${url.registrationUrl}">${msg('doRegister')}</a>
                    </div>
                </#if>
            </form>
        </#if>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
            <div id="kc-registration">
                <span>${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
            </div>
        </#if>

        <#if realm.password && social.providers??>
            <div id="kc-social-providers">
                <ul>
                    <#list social.providers as p>
                        <li><a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId}"> <span class="text">${p.displayName}</span></a></li>
                    </#list>
                </ul>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout>
