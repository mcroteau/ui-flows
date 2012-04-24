

<html>
<head>
    <title>UI Flows : Privacy Policy</title>
    <meta name="layout" content="main" />
</head>


<body>
<div class="content welcome">
		
	<g:if test="${flash.message}">
		<p class="message error">${flash.message}</p>
	</g:if>
	
	<h1>Inspired by Ryan Singer's approach to designing ui flows</h1>
	

	<img src="/uiflows/images/325-login-flow.png"/>
	
	<div class="welcomelinks">
		<g:if test="${!shiro.principal()}">
			<g:link controller="static" action="what" class="button darkgrey large">What is a UI Flow?</g:link>
			<g:link controller="account" action="registration" class="button large blue">Start Creating Flows</g:link>	
		</g:if>	
		<g:else>
		
			<g:link controller="static" action="what" class="button darkgrey large">What is a UI Flow?</g:link>
			<g:link controller="uiflow" action="myuiflows" class="button large blue">My UI Flows</g:link>
			
		</g:else>	
	</div>

</div>


</body>
</html>