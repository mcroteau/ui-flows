var UserActions = {};

//constants
UserActions.actionTemplate = '<li id="{{id}}" interactionid="{{interaction_id}}" class="userAction"><p contenteditable="true">What they do</p><span><a href="#" class="userActionDelete">delete</a><a href="#" class="userActionSever">sever</a></span></li>';
UserActions.dropOptions = {
	tolerance:'touch',
	hoverClass:'dropHover',
	activeClass:'dragActive'
};
UserActions.color = "#0396c6";
UserActions.endpoint = {
		endpoint:["Dot", { radius:8 }],
		//paintStyle:{ fillStyle:UserActions.color },
		paintStyle:{ fillStyle:""},
		isSource:true,
		scope:"dotEndPoint",
		connectorStyle:{ strokeStyle:UserActions.color, lineWidth:2 },
		//connector: ["Bezier", { curviness:200 } ],
		maxConnections:10,
		isTarget:false,
		dropOptions : UserActions.dropOptions
};

UserActions.color2 = "#ff9900";
UserActions.endpoint2 = {
		endpoint:["Dot", { radius:8 }],
		//paintStyle:{ fillStyle:UserActions.color2 },
		paintStyle:{ fillStyle:"" },
		isSource:false,
		scope:"dotEndPoint",
		connectorStyle:{ strokeStyle:UserActions.color2, lineWidth:2 },
		//connector: ["Bezier", { curviness:200 } ],
		maxConnections:10,
		isTarget:true,
		dropOptions : UserActions.dropOptions
};

UserActions.removeInteractions = function(){
	jsPlumb.reset();
	$('.interaction').remove();
}

UserActions.removeAllConnections = function(){
	jsPlumb.detachEverything();
}

UserActions.connect = function(){

}

UserActions.add = function(target_id){
	if(!target_id){ //no passed in target means we exit outta this bitch
		return;
	}
	var installation = $('#'+target_id);
	var arrgs = {};
	arrgs.interaction_id = installation.attr('id');
	arrgs.id = Utilities.getUUID();	
	installation.find('ul').append(Mustache.to_html(UserActions.actionTemplate,arrgs));
	console.info(arrgs.id);
	UserActions.createPoint(arrgs.id);
}

UserActions.remove = function(id){
	var interactionId = $('#'+id).attr('interactionId')
	console.info('shit '+interactionId)
	UserActions.removeEndpoints(id);
	$('#'+id).remove();
	UserActions.repaint(interactionId);
}

UserActions.repaint = function(id){
	UserActions.get(id).each(function(i,item){
		jsPlumb.repaint($(item).attr('id'));
	})
}

UserActions.hide = function(id){
	UserActions.get(id).each(function(i,item){
		jsPlumb.hide($(item).attr('id'),true);
	})
	jsPlumb.hide(id,true)
}

UserActions.show = function(id){
	UserActions.get(id).each(function(i,item){
		jsPlumb.show($(item).attr('id'),true);
	})
	jsPlumb.show(id,true)
	UserActions.repaint(id)
}

UserActions.removeEndpoints = function(id){
	//find all of the endpoints
	var endpoints = jsPlumb.getEndpoints(id);
	if(jsPlumb){
		for(var i in endpoints) {
			//console.info(endpoints[i].elementId)
			jsPlumb.removeEndpoint(id,endpoints[i])
		}
	}
	return;
}

UserActions.get = function(id){
	//loop through the interaction element and create a collection of user actions
	var targ = $('#'+id);
	return targ.find('li.userAction');
}

UserActions.removeAll = function(id){
	UserActions.get(id).each(function(i,item){
		UserActions.remove($(item).attr('id'));
	})
	UserActions.remove(id);
}

UserActions.severAll = function(id){
	UserActions.get(id).each(function(i,item){
		UserActions.sever($(item).attr('id'));
	})
	UserActions.sever(id);
}


UserActions.sever = function(id){
	if(jsPlumb){
		jsPlumb.detachAllConnections(id)
	}
}

UserActions.createPoint = function(id, isInteraction){

	if(jsPlumb){
		var anchors = [];
		var endpoint;
		if(isInteraction){
			anchors = ["TopLeft"];
			endpoint = UserActions.endpoint2;
		}else{
			anchors = ["RightMiddle", "LeftMiddle"];
			endpoint = UserActions.endpoint;
		}
		
		jsPlumb.addEndpoint(id,{uuid: id, anchor:anchors},endpoint);
	}
}