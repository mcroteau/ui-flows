

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
	
	
	<div class="welcomelinks">
		<g:link controller="static" action="what" class="button darkgrey large">What is a UI Flow?</g:link>
		<g:if test="${!shiro.principal()}">
			<g:link controller="account" action="registration" class="button large blue">Start Creating Flows</g:link>	
		</g:if>		
	</div>

</div>


</body>
</html>