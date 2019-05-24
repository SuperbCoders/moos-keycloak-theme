<#import "template.ftl" as layout>
<@layout.mainLayout active='password' bodyClass='password'; section>
    <form action="${url.passwordUrl}" method="post">
        <div class="restore-pass__title">${msg("allFieldsRequired")}</div>
        <input type="text" id="username" name="username" value="${(account.username!'')}" autocomplete="username" readonly="readonly" style="display:none;">

        <#if password.passwordSet>
            <div class="form-group">
                <span class="icon icon-eye"></span>
                <input type="password" class="form-control form-control--transporent" id="password" name="password" placeholder="${msg("password")}" autofocus autocomplete="current-password">
            </div>
        </#if>
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
        <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">


        <div class="form-group">
            <input type="text" class="form-control form-control--transporent" id="username" name="username"  placeholder="${msg("passwordNew")}" <#if !realm.editUsernameAllowed>disabled="disabled"</#if> value="${(account.username!'')}"/>
        </div>
        <div class="form-group">
            <input type="password" class="form-control form-control--transporent" id="password-confirm" name="password-confirm" placeholder="${msg("passwordConfirm")}" autocomplete="new-password">
        </div>

        <div class="form-group">
            <div class="">
                <button type="submit" class="btn btn-block btn-white" name="submitAction" value="Save">${msg("doSave")}</button>
            </div>
        </div>
    </form>
</@layout.mainLayout>
