<#import "secondary-template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("registerWithTitle",(realm.displayName!''))}
    <#elseif section = "header">
        ${msg("registerWithTitleHtml",(realm.displayNameHtml!''))?no_esc}
    <#elseif section = "form">
        <form action="${url.registrationAction}" method="post">
            <div class="restore-pass__title">Регистрация</div>

            <div class="form-group">
              <input class="${properties.kcFormInputClassTransparent}" type="text" id="firstName" name="firstName" value="${(register.formData.firstName!'')}" aria-describedby="firstName" placeholder="Имя" />
            </div>

            <div class="form-group">
              <input class="${properties.kcFormInputClassTransparent}" type="text" id="lastName" name="lastName" value="${(register.formData.lastName!'')}" aria-describedby="lastName" placeholder="Фамилия" />
            </div>

            <div class="form-group">
              <input class="${properties.kcFormInputClassTransparent}" type="text" id="email" name="email" value="${(register.formData.email!'')}" autocomplete="email" aria-describedby="email" placeholder="Email" />
            </div>

            <#if !realm.registrationEmailAsUsername>
              <div class="form-group">
                <input class="${properties.kcFormInputClassTransparent}" type="text" id="username" name="username" value="${(register.formData.username!'')}" autocomplete="username" aria-describedby="username" placeholder="Логин" />
              </div>
            </#if>

            <#if passwordRequired>
              <div class="form-group">
                <input class="${properties.kcFormInputClassTransparent}" type="password" id="password" name="password" autocomplete="new-password" aria-describedby="password" placeholder="Пароль" />
              </div>
              <div class="form-group">
                <input class="${properties.kcFormInputClassTransparent}" type="password" id="password-confirm" name="password-confirm" aria-describedby="password-confirm" placeholder="Подтверждение пароля" />
              </div>
            </#if>

            <#if recaptchaRequired??>
              <div class="form-group">
                  <div class="${properties.kcInputWrapperClass!}">
                      <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                  </div>
              </div>
            </#if>

            <div class="form-group">
              <a href="${url.loginUrl}">Назад к авторизации</a>
            </div>
            <div class="form-group">
              <button type="submit" class="btn btn-block btn-white">Зарегестрироваться</button>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>