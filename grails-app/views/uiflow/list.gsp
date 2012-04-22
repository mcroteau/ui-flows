
<%@ page import="com.uiflows.Uiflow" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'uiflow.label', default: 'Uiflow')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'uiflow.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'uiflow.name.label', default: 'Name')}" />
                        
                            <th><g:message code="uiflow.account.label" default="Account" /></th>
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'uiflow.dateCreated.label', default: 'Date Created')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'uiflow.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="lastUpdated" title="${message(code: 'uiflow.lastUpdated.label', default: 'Last Updated')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${uiflowInstanceList}" status="i" var="uiflowInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${uiflowInstance.id}">${fieldValue(bean: uiflowInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: uiflowInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: uiflowInstance, field: "account")}</td>
                        
                            <td><g:formatDate date="${uiflowInstance.dateCreated}" /></td>
                        
                            <td>${fieldValue(bean: uiflowInstance, field: "description")}</td>
                        
                            <td><g:formatDate date="${uiflowInstance.lastUpdated}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${uiflowInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
