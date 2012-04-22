<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="user" />
    <g:set var="entityName" value="${message(code: 'virtueEntry.label', default: 'VirtueEntry')}" />
    <title>UI Flows : No Flows created yet</title>
</head>

<body>

	<div class="content confirmation notes" style="">	
			
		<g:if test="${flash.message}">
			<div class="message info" id="">
				<span class="messageHeader">Message : </span>
				<span class="messageDetails">${flash.message}</span>
				<a href="#" class="closeButton closeMessage"></a>
			</div>
	    </g:if>
		
		<g:hasErrors bean="${uiflow}">
			<div class="errors">
		    	<g:renderErrors bean="${uiflow}" as="list" />
			</div>
		</g:hasErrors> 
			
		<h1>No UI Flows created yet</h1>
		
		<p class="large">Start creating UI Flows. </p>	
	
		
		<div class="buttons">
			<g:link controller="uiflow" action="newflow" id="" class="button small blue"  params="[activeLink: 'newflow']">New UI Flow</g:link>				
		</div>
	</div>

<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery.min.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery-ui-custom.min.js')}"></script>

<script type="text/javascript">

	$(document).ready(function(){

		var Messages = function(){
			var self = this;


			self.init = function(){
				bindClickEvent();
			}

			function bindClickEvent(){
				$('.message .closeButton').click(function(event){
					event.preventDefault();
					$(event.target).parent().remove();
				});
			}

			return {
				init : self.init
			}
		}


		var messages = new Messages();
		messages.init();


	});	
</script>
			
</body>
</html>

