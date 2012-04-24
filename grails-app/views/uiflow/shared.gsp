<%@ page import="com.uiflows.Uiflow" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="fullscreen" />
    <g:set var="entityName" value="${message(code: 'uiflow.label', default: 'Uiflow')}" />
    <title>UI Flows : Edit Flow</title>

	
	<!--<link href='http://fonts.googleapis.com/css?family=Open+Sans:300' rel='stylesheet' type='text/css'>-->

	
	<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery.min.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery-ui.min.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery.jsPlumb-1.3.3-all.js')}"></script>
	
	
	<style type="text/css">
		#shareFlowWrapper a{
			text-decoration:none;
		}
	</style>
			
</head>

<body onunload="jsPlumb.unload();">
	
	<div id="shareFlowWrapper">
		<h2>View the Shared UI Flow</h2>
		<p class="sharedNote">Enter the code given to you below</p>
		
		<p>
		<input type="text" value="" id="passcodeEntered"/>
		<input type="hidden" value="${uiflowInstance?.uuid}" id="uuid" class="uuid"/>
		
		</p>
		
		<div class="buttons">
			<a href="javascript:" class="button small red" id="cancelShared">Cancel</a>
			<a href="javascript:" id="submitPasscode" class="button small blue">View Flow</a>
		</div>
	
	</div>
	
	
	
	
	
	
	<div id="uiflows">

		
		<div id="uiflow-persistence-data">	
			<span class="listingButton">Back to Listing</span>		
			<span class="form-element">Name : <em>${uiflowInstance?.name}</em></span>	
			
			<!--<span class="form-element">Open to Public <input type="checkbox" name="privateUiflow" class="privateUiflow" />${uiflow?.privateUiflow}</span>-->
			
			<input type="hidden" value="${uiflowInstance?.name}" id="nameShared"/>
			<input type="hidden" value="${uiflowInstance?.id}" id="uiflowIdShared"/>
			<input type="hidden" value="" id="passcodeShared"/>
			
		</div>
		
		
		<div id="uiflowactions">
			<a href="#" class="removeInteractions">Clear Canvas</a>
			<a href="#" class="removeConnections">- Remove All Connections</a>
			<a href="#" class="addNewInteraction"> + Add interaction</a>
			<a href="#" class="updateSharedFlow">Update</a>
		</div>
		
	</div>
	
	
	<script type="text/javascript" src="${resource(dir:'js/', 'Utilities.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js/lib/', 'mustache.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js/interactions/', 'UIFlow.ClickHandler.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js/interactions/', 'UIFlow.UserActions.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js/interactions/', 'UIFlow.Interactions.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js/interactions/', 'UIFlow.Outputter.js')}"></script>
	
	
	
	<script>
	
		$(document).ready(function(){
			
			var flows = ${uiflowInstance.uiFlow};
			loadUIFlows(flows);	
			
			
			UserActions.showSharedFlow();
			
			var loading = false;
			
			$('#submitPasscode').click(function(){
				
				
				var passcode = $('#passcodeEntered').val();
				var uuid = $('#uuid').val();
				
				
				if(passcode != "" && uuid != "" && !loading){
					loading = true;
					$.ajax({
						url   : '/uiflows/uiflow/enterpasscode',
						data  : 'passcode=' + passcode + '&uuid=' + uuid,
						error : function(){
							loading = false;
							$('#passcodeEntered').css("border", "solid 1px #ff0000");
							$('#shareFlowWrapper p.sharedNote').empty();
							$('#shareFlowWrapper p.sharedNote').html('Wrong passcode, please try again');
							
						}
						
					}).then(function(data){
						
						loading = false;
						
						$('#shareFlowWrapper').empty();
						$('#shareFlowWrapper').html('<h1>Correct Passcode</h1>');
						
						setTimeout(function() {
							UserActions.hideSharedFlow();
						}, 2000);
						
						console.log(data.flow.passcode + ' passcode' );
						$('#passcodeShared').val(data.flow.passcode);
						
					});
									
				}else{
					
					$('#passcodeEntered').css("border", "solid 1px #ff0000");
					$('#shareFlowWrapper p.sharedNote').empty();
					$('#shareFlowWrapper p.sharedNote').html('Please enter a passcode');
				}

			});
			
			
			
			$('#cancelShared').click(function(){
				window.location = '/uiflows/static/welcome';
			});
			
			
		});
		
		
		
		
		
		function getEventTarget(e){
			var e=e || window.event;
			return e.target || e.srcElement;
		}
		
		jsPlumb.Defaults.Container = $("body");
		
		var exampleDropOptions = {
			tolerance:'touch',
			hoverClass:'dropHover',
			activeClass:'dragActive'
		};
		var color2 = "#316b31";
		var exampleEndpoint2 = {
			endpoint:["Dot", { radius:5 }],
			paintStyle:{ fillStyle:color2 },
			isSource:true,
			scope:"green dot",
			connectorStyle:{ strokeStyle:color2, lineWidth:2 },
			connector: ["Bezier", { curviness:63 } ],
			maxConnections:10,
			isTarget:true,
			dropOptions : exampleDropOptions
		};
		
		
		$(window).bind('resize',function(){
			jsPlumb.repaintEverything();
		})


		
		foo = function(){
			jsPlumb.addEndpoint('window2', { anchor:[0,0.2,0,0] }, exampleEndpoint2);
		}
		
		
		
		/*
		$('.interaction').draggable({handle:'span.draggable'}).live('drag',function(e){
			jsPlumb.repaintEverything()
		});
		*/
		
		$('[contenteditable]').live('focus', function() {
		    var $this = $(this);
		    $this.data('before', $this.html());
		}).live('blur', function() {
		    var $this = $(this);
		    if($this.data('before') === $this.html()){
		    	console.info('there has not been a change')
		    }
		    if($this.html().length <= 4){
		    	$this.remove()
		    }
		}).live('keyup',jsPlumb.repaintEverything);
		
</script>
	
</body>
</html>

