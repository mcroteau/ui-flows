<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="user" />
    <g:set var="uiflow" value="${message(code: 'uiflow.label', default: 'Uiflow')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>


<div class="content history">

	<g:if test="${flash.message}">
		<div class="message info" id="">
			<span class="header">Message : </span>
			<span class="messageDetails">${flash.message}</span>
			<a href="#" class="closeButton closeMessage"></a>
		</div>
		
    </g:if>


	<h1>My UI Flows <span>A complete list of all flows created to date</span></h1>
	
	
	<div id="entriesListWrapper" class="entrieslistWrapper" style="">
		
		<g:if test="${uiflows}">
			<h3>List View <span>All entries listed</span></h3>
			<table class="entries">
				<thead>
					<tr>
						<th nowrap>Date Created</th>
						<th>Name</th>
						<th>Passcode<th>
					</tr>
				</thead>
				<tbody>
					
        	        <g:each in="${uiflows}" status="i" var="uiflow">
						<g:if test="${i % 2 == 0}">
							<tr class="even">
						</g:if>
						<g:else>
							<tr class="">
						</g:else>
						
								<td class="entryDate" style="vertical-align:middle"><g:formatDate format="dd MMM yyyy" date="${uiflow.dateCreated}"/></td>
								<td style="text-align:left; padding-left:5px;"><em class="highlight">${uiflow.name}</em></td>
								<td style="text-align:left"><em class="highlight">${uiflow.passcode}</em></td>
								<td><g:link controller="uiflow" action="edit" id="${uiflow.id}" class="button small grey">Edit</g:link></td>
						</tr>
					</g:each>
																									        											
				</tbody>
			</table>
        	
        	<div class="paginateButtons">
        	    <g:paginate total="${uiflowsTotal}"  params="[activeLink: 'myuiflows']"/>
        	</div>
		</g:if>
		<g:else>
			<h2>No flows created yet  <g:link controller="uiflow" action="newflow" id="" class="button small blue"  params="[activeLink: 'newflow']">Create a new UI Flow</g:link></h2>
		</g:else>
	</div>

				
	<br class="clear"/>
	
	
</div>


<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery.min.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery.qtip.min.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery-ui.min.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jtruncate.js')}"></script>


<!-- MOCK DATA -->

<script type="text/javascript">

$(document).ready(function(){

	
	var FlowsList = function(){
	
		var self = this;
		var $notes;
		
		self.init = function(){
			$('.entrieslistWrapper').fadeIn(300);
		};

	};


	

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

	var flows = new FlowsList();
	flows.init();

	
});


</script>
	

</body>
</html>
