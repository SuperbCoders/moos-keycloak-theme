<#import "secondary-template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "title">
        ${msg("updatePasswordTitle")}
    <#elseif section = "header">
        ${msg("updatePasswordTitle")}
    <#elseif section = "form">
        <form id="kc-passwd-update-form" action="${url.loginAction}" method="post">
            <input type="text" id="username" name="username" value="${username}" autocomplete="username" readonly="readonly" style="display:none;"/>
            <input type="password" id="password" name="password" autocomplete="current-password" style="display:none;"/>

            <div class="form-group">
                <input type="password" class="form-control form-control--transporent" id="password-new" name="password-new" placeholder="Пароль">
            </div>

            <div class="form-group">
                <input type="password" class="form-control form-control--transporent" id="password-confirm" name="password-confirm" placeholder="Подтвердить пароль">
            </div>

            <div class="form-group">
                <button type="submit" class="btn btn-block btn-white">Сменить пароль</button>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>
