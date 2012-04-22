<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
    <meta name="author" content=""/>
	
    <title><shiro:principal/>'s UI Flows : UI Flows</title> 

    <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />

    <link rel="stylesheet" href="${resource(dir:'css',file:'reset.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'buttons.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'messages.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'jquery.qtip.min.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'style-userloggedin.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css/jquery-ui/ui-lightness/',file:'jquery-ui-1.8.16.custom.css')}" />
		
</head>
<body>

	
	<div class="topbar">
		<div class="topcontent">
			<a href="" class="logo micro"></a>
			<g:link controller="auth" action="signOut" class="logout">Logout</g:link>
			<br class="clear"/>
		</div>
		
	</div>	
	
	<div class="header">
		
		<span class="welcome">Welcome back <shiro:principal/> <g:link controller="account" action="edit">edit</g:link></span>
		<nav class="usernav">
			
			<g:link controller="uiflow" class="${myuiflowsActive}" action="myuiflows" title="My UI Flows" params="[activeLink: 'myuiflows']">My UI Flows</g:link>
			<g:link controller="uiflow" class="${newflowActive}" action="newflow" title="New UI Flow" params="[activeLink: 'newflow']">New UI Flow</g:link>
		
		</nav>
		
		<br class="clear"/>
	</div>
	
	
	
	<g:layoutBody />
			
	<br class="clear"/>
	

	<div class="notes footernav" style="width:500px; margin:20px auto;">

		<g:link controller="static" action="welcome">Welcome</g:link>|	
		<g:link controller="static" action="what">What is a UI Flow</g:link>|
		<g:link controller="static" action="privacy">Privacy Policy</g:link>|
		<g:link controller="account" action="info">Account</g:link>
		
		<shiro:hasRole name="ROLE_ADMIN">
			<div id="adminpanel">
			    <ul>
	                <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
	                    <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
	                </g:each>
	            </ul>
			</div>
		</shiro:hasRole>		
	</div>
	
	
	
	<script type="text/javascript">
	

	</script>	
	
	
</body>
</html>
