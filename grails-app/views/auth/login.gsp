<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="layout" content="main" />
  <title>Login</title>
</head>
<body>

	<div class="content loginContainer">
		<g:if test="${flash.message}">
	    	<div class="message info">${flash.message}</div>
	  	</g:if>
	
  		<g:form action="signIn">
		
		<h1>Account Login</h1>
		
		<!-- <div class="icon"></div> -->
		
		<div class="loginWrapper notes">

			<input type="hidden" name="targetUri" value="${targetUri}" />
			
			<div class="loginForm">
				<p class="">
					<label for="username">Username</label>
					<input type="text" name="username" value="${username}" class=""/>
				</p>
				<p class="">
					<label for="password">Password</label>
					<input type="password" name="password" value=""/>
				</p>
				<p class="">
		          <label for="rememberMe">Remember me?:</label>
		          <g:checkBox name="rememberMe" value="${rememberMe}" />
				</p>
			</div>
			
			<div class="buttons">
				<span>Forgot <g:link controller="account" action="beginResetPage">Password</g:link>?</span>
				<!-- <a href="#" class="button blue small">Login</a> -->
				<g:submitButton name="Login" class="button blue small" value="Login"/>
			</div>
			
			
  			</g:form>

		</div>
		
		<br class="clear"/>
		
	</div>		
</body>
</html>
