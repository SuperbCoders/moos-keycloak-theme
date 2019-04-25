<#import "secondary-template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "title">
    ${message.summary}
    <#elseif section = "header">
    ${message.summary}
    <#elseif section = "form">
    <div class="centred-message-container centred-message-container--sm">
        <div class="centred-message-container__icon">
            <svg xmlns="http://www.w3.org/2000/svg" width="78" height="70" viewBox="0 0 78 70">
                <path fill="#FFF" fill-rule="evenodd" d="M74.75.25c-.063.016-.125.04-.188.063a2.022 2.022 0 0 0-1.25.937L32.438 64.625 4.311 39.25a2.007 2.007 0 0 0-2.085-.695 1.993 1.993 0 0 0-1.461 1.64c-.118.79.242 1.57.921 1.992l29.813 27a1.998 1.998 0 0 0 3-.438L76.688 3.376A2 2 0 0 0 74.75.25z"/>
            </svg>
        </div>
        <div class="centred-message-container__text">
            ${message.summary} <#if requiredActions??><#list requiredActions>: <b><#items as reqActionItem>${msg("requiredAction.${reqActionItem}")}<#sep>, </#items></b></#list><#else></#if>
        </div>
        <#if skipLink??>
        <#else>
            <#if pageRedirectUri??>
            <div class="centred-message-container__buttons">
                <a href="${pageRedirectUri}" class="btn btn-white">
                    ${msg("backToApplication")?no_esc}
                </a>
            </div>
            <#elseif actionUri??>
            <div class="centred-message-container__buttons">
                <a href="${actionUri}" class="btn btn-white">
                    ${msg("proceedWithAction")?no_esc}
                </a>
            </div>
            <#elseif client.baseUrl??>
            <div class="centred-message-container__buttons">
                <a href="${client.baseUrl}" class="btn btn-white">
                    ${msg("backToApplication")?no_esc}
                </a>
            </div>
            </#if>
        </#if>

    </div>
    </#if>
</@layout.registrationLayout>
