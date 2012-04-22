

<%@ page import="com.uiflows.Account" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'account.label', default: 'Account')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${accountInstance}">
            <div class="errors">
                <g:renderErrors bean="${accountInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="username"><g:message code="account.username.label" default="Username" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: accountInstance, field: 'username', 'errors')}">
                                    <g:textField name="username" value="${accountInstance?.username}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="account.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: accountInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${accountInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="recoveryUUID"><g:message code="account.recoveryUUID.label" default="Recovery UUID" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: accountInstance, field: 'recoveryUUID', 'errors')}">
                                    <g:textField name="recoveryUUID" value="${accountInstance?.recoveryUUID}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="recoveries"><g:message code="account.recoveries.label" default="Recoveries" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: accountInstance, field: 'recoveries', 'errors')}">
                                    <g:textField name="recoveries" value="${fieldValue(bean: accountInstance, field: 'recoveries')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="logins"><g:message code="account.logins.label" default="Logins" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: accountInstance, field: 'logins', 'errors')}">
                                    <g:textField name="logins" value="${fieldValue(bean: accountInstance, field: 'logins')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="active"><g:message code="account.active.label" default="Active" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: accountInstance, field: 'active', 'errors')}">
                                    <g:checkBox name="active" value="${accountInstance?.active}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="displayName"><g:message code="account.displayName.label" default="Display Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: accountInstance, field: 'displayName', 'errors')}">
                                    <g:textField name="displayName" value="${accountInstance?.displayName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="passwordHash"><g:message code="account.passwordHash.label" default="Password Hash" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: accountInstance, field: 'passwordHash', 'errors')}">
                                    <g:textField name="passwordHash" value="${accountInstance?.passwordHash}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="privateAccount"><g:message code="account.privateAccount.label" default="Private Account" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: accountInstance, field: 'privateAccount', 'errors')}">
                                    <g:checkBox name="privateAccount" value="${accountInstance?.privateAccount}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
