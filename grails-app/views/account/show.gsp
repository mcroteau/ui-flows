
<%@ page import="com.uiflows.Account" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'account.label', default: 'Account')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: accountInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.username.label" default="Username" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: accountInstance, field: "username")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.email.label" default="Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: accountInstance, field: "email")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.recoveryUUID.label" default="Recovery UUID" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: accountInstance, field: "recoveryUUID")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.recoveries.label" default="Recoveries" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: accountInstance, field: "recoveries")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.logins.label" default="Logins" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: accountInstance, field: "logins")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.active.label" default="Active" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${accountInstance?.active}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.displayName.label" default="Display Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: accountInstance, field: "displayName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.passwordHash.label" default="Password Hash" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: accountInstance, field: "passwordHash")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.permissions.label" default="Permissions" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: accountInstance, field: "permissions")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.privateAccount.label" default="Private Account" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${accountInstance?.privateAccount}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.roles.label" default="Roles" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${accountInstance.roles}" var="r">
                                    <li><g:link controller="role" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.uiflows.label" default="Uiflows" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${accountInstance.uiflows}" var="u">
                                    <li><g:link controller="uiflow" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${accountInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
