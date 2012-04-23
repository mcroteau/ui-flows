<%@page import="com.uiflows.*"%>

<!doctype html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
	
	
    <title>UI Flows</title> 

    <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
	
    <link rel="stylesheet" href="${resource(dir:'css',file:'reset.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'jsPlumbDemo.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'draggableConnectorsDemo.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'UIFlow.UserActions.css')}" />
	
	
    <link rel="stylesheet" href="${resource(dir:'css',file:'buttons.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'messages.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'style.css')}" />


	<style type="text/css">
		body,html{
			padding:0px !important;
			margin:0px !important;
			min-width:100%;
			width:100%;
		}
		
		#modal {
			opacity: 0.0;
			z-index: -1;
			width: 100%;
			height: 100%;
			background: #3c4246;
			position: fixed;
			top: 0px;
			left: 0px;
		}
		
		#loading{
			opacity:0.0;
			z-index: -2;
			position:absolute;
			left:50%;
			top:50px;
			padding:20px;
			height:20px;
			width:200px;
			margin-left:-100px;
			color:#fff;
			font-size:11px;
			text-shadow:0px 0px 1px #333;
			background:#607079;
			border:solid 2px #dbe3e5;
			-moz-border-radius:3px;
			border-radius:3px;
			
	        -webkit-box-shadow:  1px 1px 5px 5px rgba(0, 0, 0, .2);
	        -moz-box-shadow:  1px 1px 5px 5px rgba(0, 0, 0, .2);
	        box-shadow:  1px 1px 5px 5px rgba(0, 0, 0, .2);
	
		}


		#shareFlowWrapper{
			opacity:1.0;
			z-index: 200;
			position:absolute;
			left:50%;
			top:50px;
			padding:15px;
			width:250px;
			margin-left:-125px;
			color:#333;
			font-size:11px;
			text-shadow:0px 0px 1px #efefef;
			background:#efefef;
			border:solid 2px #ddd;
			-moz-border-radius:3px;
			border-radius:3px;
			
	        -webkit-box-shadow:  1px 1px 5px 5px rgba(0, 0, 0, .2);
	        -moz-box-shadow:  1px 1px 5px 5px rgba(0, 0, 0, .2);
	        box-shadow:  1px 1px 5px 5px rgba(0, 0, 0, .2);
	
		}
		
				

		#uiflows{

		}
		
		#uiflow-persistence-data{
			background:#f0f6f2;
			position:fixed;
			top:5px;
			left:0px;
			padding:3px 3px 3px 3px;
			font-size:10px;
			
			border:solid 1px #ddd;
			
	        -webkit-box-shadow:  1px 1px 5px 1px rgba(0, 0, 0, .1);
	        -moz-box-shadow:  1px 1px 5px 1px rgba(0, 0, 0, .1);
	        box-shadow:  1px 1px 5px 1px rgba(0, 0, 0, .1);
			
		}
		
		#uiflow-persistence-data .listingButton{
			display:inline-block;
			text-decoration:none;
			color:#fff;
			font-size:10px;
			margin:2px 5px;
			background:#6f7e87;
			float:left;
			height:17px;
			margin:0px;
			padding:4px 10px 2px 10px;
			border-right:solid 1px #5b6b74;
			border-left:solid 1px #848d94;
			cursor:hand;
			cursor:pointer;
		}
		#uiflow-persistence-data .listingButton:hover{
			background:#607079;
		}
		
		#uiflow-persistence-data .form-element{
			display:inline-block;
			margin:2px 7px;
			font-size:10px;
			color:#3c4246;
			font-weight:bold;
		}
				
		#uiflow-persistence-data input[type="text"]{
			height:17px;
			border:solid 1px #ddd !important;
			font-size:10px;
			padding:1px;
		}
		#uiflow-persistence-data input[type="text"]{
			border:solid 1px #ddd;
		}
	
		#uiflow-persistence-data input[type="text"].name{
			width:175px;
		}
			
		#uiflow-persistence-data input[type="text"].passcode{
			width:75px;
		}
	
		#uiflow-persistence-data input[type="text"].error{
			border:solid 1px #f14621 !important;
		}
	
		
		#uiflowactions{
			background:#6f7e87;
			padding:0px 0px;
			position:fixed;
			top:10px;
			right:0px;
			z-index:500;
			
	        -webkit-box-shadow:  1px 1px 5px 1px rgba(0, 0, 0, .2);
	        -moz-box-shadow:  1px 1px 5px 1px rgba(0, 0, 0, .2);
	        box-shadow:  1px 1px 5px 1px rgba(0, 0, 0, .2);

		}
		#uiflowactions a{
			display:inline-block;
			text-decoration:none;
			color:#fff;
			font-size:10px;
			margin:2px 5px;
			background:#6f7e87;
			float:left;
			height:17px;
			margin:0px;
			padding:4px 10px 2px 10px;
			border-right:solid 1px #5b6b74;
			border-left:solid 1px #848d94;
		}
		#uiflowactions a:hover{
			background:#607079;
		}
		
		#uiflowactions a.saveFlow{
			background:#2eb880;
			border-right:solid 1px #009f5f;
			border-left:solid 1px #3dc68f;
		}
		
		#uiflowactions a.saveFlow:hover{
			background:#009f5f;
		}
				
		#uiflowactions a.deleteFlow{
			background:#f14621;
			border-right:solid 1px #eb3e19;
			border-left:solid 1px #f34823;
		}
		
		#uiflowactions a.deleteFlow:hover{
			background:#bf5b30;
		}
			
			
		#uiflowactions a.updateFlow,
		#uiflowactions a.editFlow{
			background:#357cb7;
			border-right:solid 1px #2d72ac;
			border-left:solid 1px #0c8af4;
		}
		
		#uiflowactions a.updateFlow:hover,
		#uiflowactions a.editFlow:hover{
			background:#04589f;
		}
			
		.interaction .userAction p::selection,
		.interaction .userAction p:focus,
		.interaction .userAction p:active {
			background: #fff;
			border:solid 1px #ddd;
			color:#333;
		}
		
		.interaction .userAction p::-moz-selection{
			background: #fff;
			border:solid 1px #ddd;
			color:#333;
		}
		
		
		p.interaction .userAction::-webkit-selection{
			background: #fff;
			border:solid 1px #ddd;
			color:#333;
		}
		 
		#shareFlow{
			margin:10px auto;
		}
	</style>
	
	<div id="modal" class="modal"></div>
	<div id="loading">Saving ...</div>
	
	
	
	
	
    <g:layoutHead />

		
</head>
<body>

	
	<g:layoutBody />


</body>
</html>