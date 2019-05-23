<#import "template.ftl" as layout>
<@layout.mainLayout active='account' bodyClass='user'; section>

    <form action="${url.accountUrl}" method="post">
        <div class="restore-pass__title">${msg("editAccountHtmlTitle")}</div>
        <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">

        <#if !realm.registrationEmailAsUsername>
            <div class="form-group">
                <input type="text" class="form-control form-control--transporent" id="username" name="username"  placeholder="${msg("username")}" <#if !realm.editUsernameAllowed>disabled="disabled"</#if> value="${(account.username!'')}"/>
            </div>
        </#if>
        <div class="form-group">
            <input type="text" class="form-control form-control--transporent" id="email" name="email" placeholder="${msg("email")}" autofocus value="${(account.email!'')}"/>
        </div>
        <div class="form-group">
            <input type="text" class="form-control form-control--transporent" id="firstName" name="firstName" placeholder="${msg("firstName")}" value="${(account.firstName!'')}"/>
        </div>
        <div class="form-group">
            <input type="text" class="form-control form-control--transporent" id="lastName" name="lastName" placeholder="${msg("lastName")}" value="${(account.lastName!'')}"/>
        </div>
        <div class="form-group">
                <div class="">
                    <#if url.referrerURI??><a href="${url.referrerURI}">${msg("backToApplication")?no_esc}/a></#if>
                    <button type="submit" class="btn btn-block btn-white" name="submitAction" value="Save">${msg("doSave")}</button>
                    <button type="submit" class="btn btn-block btn-white" name="submitAction" value="Cancel">${msg("doCancel")}</button>
                </div>
        </div>
    </form>

</@layout.mainLayout>