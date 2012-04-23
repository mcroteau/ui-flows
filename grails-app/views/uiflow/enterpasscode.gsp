<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="user" />
    <g:set var="entityName" value="${message(code: 'virtueEntry.label', default: 'VirtueEntry')}" />
    <title>UI Flows : To View Flow enter passcode</title>
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
			
		<h1>Enter passcode</h1>
		
		<p class="large">To View Flow : ${uiflowInstance.name}</p>	
		
		<input type="text" value="" name="passcode" class="passcode" id="passcode"/>
		<input type="hidden" value="${uiflowInstance.uuid}" name="uuid" class="uuid" id="uuid"/>
		
		<div class="buttons">
			<a href id="viewByPasscode" class="button large blue">View UI Flow</a>				
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

		
		console.log($('#uuid').val());

		$('#viewByPasscode').click(function(){
			
			
			if($('#passcode').val() && $('#uuid').val() ){
				window.location = '/uiflows/uiflow/edit?uuid=' + $('#uuid').val() + '&passcode='+ $('#passcode').val()
			}else{
				alert('enter passcode');
			}
		});
	});	
</script>
			
</body>
</html>

