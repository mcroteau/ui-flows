

<%@ page import="com.uiflows.Uiflow" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'uiflow.label', default: 'Uiflow')}" />
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
            <g:hasErrors bean="${uiflowInstance}">
            <div class="errors">
                <g:renderErrors bean="${uiflowInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="uiflow.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: uiflowInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${uiflowInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="account"><g:message code="uiflow.account.label" default="Account" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: uiflowInstance, field: 'account', 'errors')}">
                                    <g:select name="account.id" from="${com.uiflows.Account.list()}" optionKey="id" value="${uiflowInstance?.account?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="passcode"><g:message code="uiflow.passcode.label" default="Passcode" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: uiflowInstance, field: 'passcode', 'errors')}">
                                    <g:textField name="passcode" value="${uiflowInstance?.passcode}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="privateUiflow"><g:message code="uiflow.privateUiflow.label" default="Private Uiflow" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: uiflowInstance, field: 'privateUiflow', 'errors')}">
                                    <g:checkBox name="privateUiflow" value="${uiflowInstance?.privateUiflow}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="uiFlow"><g:message code="uiflow.uiFlow.label" default="Ui Flow" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: uiflowInstance, field: 'uiFlow', 'errors')}">
                                    <g:textField name="uiFlow" value="${uiflowInstance?.uiFlow}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="uuid"><g:message code="uiflow.uuid.label" default="Uuid" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: uiflowInstance, field: 'uuid', 'errors')}">
                                    <g:textField name="uuid" value="${uiflowInstance?.uuid}" />
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
