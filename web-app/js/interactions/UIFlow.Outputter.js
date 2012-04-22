
var fakeFlowsThree = {"uiflows":[{"x":59,"y":55,"interactionId":"94cbec83-34dc-426f-f7df-2d653c63e165","userSees":"EDIT : This is what the user sees2","userActions":[{"userActionId":"37be964b-f553-911c-1a1c-e2dabefc9e82","description":"2What they do"}]},{"x":424,"y":60,"interactionId":"00fc4246-5b6f-9b38-7d58-497bc2867eee","userSees":"EDIT : This is what the user sees","userActions":[{"userActionId":"aa7685af-9cef-204b-f534-0cd80119132d","description":"2What they do"},{"userActionId":"5fe2812d-9344-29c3-77cf-b52b839dd1fc","description":"22What they do"},{"userActionId":"b61596f3-4243-745b-ea7c-be19ee67fdf2","description":"222What they do"}]},{"x":849,"y":60,"interactionId":"60b5b6b3-0570-98f1-298d-179ac0785705","userSees":"EDIT : This is what the user sees","userActions":[]},{"x":849,"y":190,"interactionId":"80421e5f-9500-cfa0-a1b5-51956a6d89da","userSees":"EDIT : This is what the user sees","userActions":[]},{"x":849,"y":330,"interactionId":"08f87622-b7b7-2c3e-d6fe-e53d19212a1f","userSees":"EDIT : This is what the user sees","userActions":[]}],"connections":[{"sourceId":"aa7685af-9cef-204b-f534-0cd80119132d","targetId":"60b5b6b3-0570-98f1-298d-179ac0785705"},{"sourceId":"5fe2812d-9344-29c3-77cf-b52b839dd1fc","targetId":"80421e5f-9500-cfa0-a1b5-51956a6d89da"},{"sourceId":"b61596f3-4243-745b-ea7c-be19ee67fdf2","targetId":"08f87622-b7b7-2c3e-d6fe-e53d19212a1f"},{"sourceId":"37be964b-f553-911c-1a1c-e2dabefc9e82","targetId":"00fc4246-5b6f-9b38-7d58-497bc2867eee"}]};

var fakeFlowsFour = {"uiflows":[{"x":424,"y":60,"interactionId":"00fc4246-5b6f-9b38-7d58-497bc2867eee","userSees":"EDIT : This is what the user sees","userActions":[{"userActionId":"aa7685af-9cef-204b-f534-0cd80119132d","description":"2What they do"},{"userActionId":"b61596f3-4243-745b-ea7c-be19ee67fdf2","description":"222What they do"}]},{"x":849,"y":330,"interactionId":"08f87622-b7b7-2c3e-d6fe-e53d19212a1f","userSees":"EDIT : This is what the user sees","userActions":[]}],"connections":[{"sourceId":"b61596f3-4243-745b-ea7c-be19ee67fdf2","targetId":"08f87622-b7b7-2c3e-d6fe-e53d19212a1f"}]}
var fakeFlowsFive = {"uiflows":[{"x":164,"y":120,"interactionId":"57c815d0-9266-3c91-cb83-ddb9153ed073","userSees":"New Interaction","userActions":[{"userActionId":"3e014039-ff30-6a23-36bd-103f9b4f4824","description":"another action"},{"userActionId":"4aa7799e-1696-e570-8788-9cf579ffa213","description":"second action"}]},{"x":679,"y":185,"interactionId":"e6c9d605-8273-44c9-37f5-454532995306","userSees":"Second Interaction","userActions":[{"userActionId":"e485a904-bfbe-a457-c7d9-2d5ea847a508","description":"first action"}]},{"x":679,"y":335,"interactionId":"177f9dc8-5777-7369-0109-4e15b76e6237","userSees":"Third Interaction","userActions":[{"userActionId":"342c2412-77b0-71f4-08eb-663e9b9d023b","description":"second action"}]}],"connections":[{"sourceId":"3e014039-ff30-6a23-36bd-103f9b4f4824","targetId":"e6c9d605-8273-44c9-37f5-454532995306"},{"sourceId":"4aa7799e-1696-e570-8788-9cf579ffa213","targetId":"177f9dc8-5777-7369-0109-4e15b76e6237"}]};

var fakeflowsTwo = {
	"uiflows" : [
		{
			"x" : "50",
			"y" : "80",
			"interactionId" : "test1",
			"userSees" : "user sees this in test 1",
			"userActions" : [
				{
					"userActionId" : "uid1",
					"description"  : "this is a test user action"
				}
				
			]
			
		},
		{
			"x" : "555",
			"y" : "180",
			"interactionId" : "test2",
			"userSees" : "user sees this in test 2",
			"userActions" : [
				{
					"userActionId" : "uid2",
					"description"  : "user action one"
				},					
				{
					"userActionId" : "uid3",
					"description"  : "user action two"
				},					
				{
					"userActionId" : "uid4",
					"description"  : "user action three"
				}
				
			]
			
		},
		{
			"x" : "1000",
			"y" : "450",
			"interactionId" : "test3",
			"userSees" : "user sees another connection",
			"userActions" : [
				{
					"userActionId" : "uid5",
					"description"  : "user action one"
				}
				
			]
			
		},
		{
			"x" : "1000",
			"y" : "190",
			"interactionId" : "test4",
			"userSees" : "user sees connection4",
			"userActions" : [
				{
					"userActionId" : "uid6",
					"description"  : "last connection"
				}
				
			]
			
		}		
	],
	
	"connections" : [
		{
			"sourceId" : "uid1",
			"targetId" : "test2"
		},
		{
			"sourceId" : "uid2",
			"targetId" : "test4"
		},
		{
			"sourceId" : "uid3",
			"targetId" : "test3"
		}						
	]	
	
	
};



var currentUIFlows = { "uiflows" : [], "connections": []};

var outputUIFlows = function(){
	
	var interactions = $('.interaction');
	
	if(interactions){
		$.each(interactions, function(index, interaction){
			
			var interactionX = $(interaction)
			var position = interactionX.position();
			
			var interactionObj = {
				"x"             : position.left,
				"y"             : position.top,
				"interactionId" : interactionX.attr('id'),
				"userSees"      : interactionX.find('.userSees').html(),
				"userActions"   : []
			};
			
			var userActions = interactionX.find('.userAction');
			$.each(userActions, function(index, userAction){
				
				var userActionX = $(userAction);
				var userActionObj = {
					"userActionId" : userActionX.attr('id'),
					"description"  : userActionX.find('p').html()	
				};
				
				interactionObj.userActions.push(userActionObj);
				
			});
			
			currentUIFlows.uiflows.push(interactionObj);
			
		});		
	}
	
	
	var connections = jsPlumb.getAllConnections();
	console.info(connections);
	
	if(!$.isEmptyObject(connections)){
		
		$.each(connections.dotEndPoint, function(index, connection){

			console.info('connection -> ');
			console.info(connection);
			currentUIFlows.connections.push({"sourceId" : connection.sourceId, "targetId" : connection.targetId});

		});		
	}

	
	console.info(JSON.stringify(currentUIFlows));
	
	return JSON.stringify(currentUIFlows);
}


var interactionTemplateWith = '<div class="window interaction" id="{{interactionId}}"  interactionId="{{interactionId}}">\
	<div class="">\
		<div class="interactionActions"  interactionId="{{interactionId}}">\
			<span class="interactionSeverAll"  interactionId="{{interactionId}}">DT</span>\
			<span class="interactionDelete"  interactionId="{{interactionId}}">DL</span>\
			<span class="interactionDraggable"  interactionId="{{interactionId}}">DR</span>\
		</div>\
		<p contenteditable="true" class="userSees">{{userSees}}</p>\
		<ul class="userActions" interactionId="{{interactionId}}">\
		</ul>\
		<a href="#" class="newUserAction" interactionId="{{interactionId}}">Add User Action</a>\
	</div>\
</div>';


UserActions.actionTemplateWithContent = '<li id="{{id}}" interactionid="{{interaction_id}}" class="userAction"><p contenteditable="true">{{description}}</p><span><a href="#" class="userActionDelete">delete</a><a href="#" class="userActionSever">sever</a></span></li>';

var allConnections = [];

var loadUIFlows = function(uiflowsData){
	
	$.each(uiflowsData.uiflows, function(index, flow){
		
		var interactionHtml = Mustache.to_html(interactionTemplateWith, {interactionId : flow.interactionId, userSees : flow.userSees});
		var css = {
			"position" : "absolute",
			"left" : flow.x + "px",
			"top"  : flow.y + "px"
		}
		
		$(interactionHtml).appendTo('#uiflows');

		console.log('appended new interaction -> ' + flow.userSees);
		$('#' + flow.interactionId).css(css);
		$('#' + flow.interactionId).draggable({handle:'span.interactionDraggable',grid:[5,5]}).live('drag',function(e){
			jsPlumb.repaintEverything();
			//UserActions.repaint(flow.interactionId);
		});
		
		
		//create point
		UserActions.createPoint(flow.interactionId, true);
		
		
		//add actions
		$.each(flow.userActions, function(index, userAction){
			
			//create jquery hook on interaction dom element
			var interaction = $('#'+flow.interactionId);
			
			//set up args to pass to mustache
			var args =  {interaction_id : flow.interactionId, id : userAction.userActionId, description : userAction.description};
			console.log('args -> ' + JSON.stringify(args));
			
			//create html using the template and args json obj
			var userActionHtml = Mustache.to_html(UserActions.actionTemplateWithContent, args);
			
			//append new user action html element
			interaction.find('ul').append(userActionHtml);
			
			//add point
			UserActions.createPoint(args.id);
			//jsPlumb.setDraggable(args.id, false);

		});
		
	});
	
	addAllConnections(uiflowsData.connections);
	
};



var addAllConnections = function(connections){
	console.info('add all connections -> ');	
	$.each(connections, function(index, connection){
		console.info('connection -> ' + connection.sourceId + '   ->   ' + connection.targetId);
		jsPlumb.connect({
			uuids: [connection.sourceId, connection.targetId]
		});		
		jsPlumb.setDraggable(connection.sourceId, false);
	});

};








