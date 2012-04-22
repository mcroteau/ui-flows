

<%@ page import="com.uiflows.Account" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'account.label', default: 'Account')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${accountInstance}">
            <div class="errors">
                <g:renderErrors bean="${accountInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${accountInstance?.id}" />
                <g:hiddenField name="version" value="${accountInstance?.version}" />
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
                                  <label for="permissions"><g:message code="account.permissions.label" default="Permissions" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: accountInstance, field: 'permissions', 'errors')}">
                                    
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
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="roles"><g:message code="account.roles.label" default="Roles" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: accountInstance, field: 'roles', 'errors')}">
                                    <g:select name="roles" from="${com.uiflows.Role.list()}" multiple="yes" optionKey="id" size="5" value="${accountInstance?.roles*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="uiflows"><g:message code="account.uiflows.label" default="Uiflows" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: accountInstance, field: 'uiflows', 'errors')}">
                                    
<ul>
<g:each in="${accountInstance?.uiflows?}" var="u">
    <li><g:link controller="uiflow" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="uiflow" action="create" params="['account.id': accountInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'uiflow.label', default: 'Uiflow')])}</g:link>

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
