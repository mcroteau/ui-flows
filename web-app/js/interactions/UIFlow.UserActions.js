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



UserActions.validateSaveUIFlow = function(){
	var nameVal = $('.name').val();
	var passcode = $('.passcode').val();
	var privateFlow = $('.privateUiflow').val();
	
	var interactionsCount = $('.interaction').length;
	
	if(interactionsCount > 0 &&
		nameVal != "" && passcode != ""){
		
		UserActions.showLoading();
		
		var uiflow = outputUIFlows();
		
		$.ajax({
			url : '/uiflows/uiflow/save',
			data : 'name=' + nameVal + '&passcode=' + passcode + '&privateUiflow=' + privateFlow + '&uiFlow=' + uiflow,
			type : 'post',
			error : UserActions.error
		}).then(UserActions.successfullySaved)	
		
	}else{	
		if(nameVal === "")$('.name').addClass('error');
		if(passcode === "")$('.passcode').addClass('error');
		
		if(passcode === "" || nameVal ==""){
			UserActions.showLoading();
			$('#loading').html('Fix Name & Passcode errors');

			$('#loading').css({"background" : "#f14621"});
			setTimeout(function() {

				$('#loading').css({"background" : "#3c4246"});
				UserActions.hideLoading();
		    }, 2000);
		}
		
		
		if(interactionsCount === 0){
			UserActions.showLoading();
			$('#loading').html('No interactions defined..');

			$('#loading').css({"background" : "#f14621"});
			setTimeout(function() {

				$('#loading').css({"background" : "#3c4246"});
				UserActions.hideLoading();
		    }, 2000);
		}
	}
	
};


UserActions.successfullySaved = function(responseObj){
	console.log('successfully saved');
	console.log(responseObj);
	
	// UserActions.hideLoading();
	$('#loading').html('successfully saved !');
	$('.error').removeClass('error');
	

	setTimeout(function() {
		$('.saveFlow').addClass('updateFlow').removeClass('saveFlow').html('Update');
		$('.uiflowId').val(responseObj.flow.id);
		UserActions.addInteractionLink('delete');
		UserActions.hideLoading();
    }, 2000);
		
}

UserActions.addInteractionLink = function(link){
	var html = '<a href="#" class="deleteFlow">Delete</a>';
	$('#uiflowactions').append(html);
};

UserActions.displayList = function(){
	window.location = '/uiflows/uiflow/myuiflows';
}





UserActions.validateUpdateUIFlow = function(){
	var nameVal = $('.name').val();
	var passcode = $('.passcode').val();
	var privateFlow = $('.privateUiflow').val();
	var uiflowId = $('.uiflowId').val();
	
	var interactionsCount = $('.interaction').length;
	
	if(interactionsCount > 0 &&
	    uiflowId != "" && nameVal != "" && passcode != ""){
		
		UserActions.showLoading();
		
		var uiflow = outputUIFlows();
		
		$.ajax({
			url : '/uiflows/uiflow/update',
			data : 'id=' + uiflowId + '&name=' + nameVal + '&passcode=' + passcode + '&privateUiflow=' + privateFlow + '&uiFlow=' + uiflow,
			type : 'post',
			error : UserActions.error
		}).then(UserActions.successfullyUpdated)	
		
	}else{
		console.warn('error : missing data');
		
		if(nameVal === "")$('.name').addClass('error');
		if(passcode === "")$('.passcode').addClass('error');
		if(uiflowId === "")console.warn('id not set');
		
	}
	
};

UserActions.successfullyUpdated = function(responseObj){
	console.log('successfully updated');
	console.log(responseObj);
	
	// UserActions.hideLoading();
	$('#loading').html('successfully updated');
	setTimeout(function() {
		UserActions.hideLoading();
    }, 2000);	
}


UserActions.deleteUIFlow = function(){
	
	var uiflowId = $('.uiflowId').val();
	if(uiflowId != ""){
		
		UserActions.showLoading();
			
		$.ajax({
			url : '/uiflows/uiflow/delete',
			data : 'id=' + uiflowId,
			type : 'post',
			error : UserActions.error
		}).then(UserActions.successfullyDeleted)	
		
	}else{	
		
	}	
}

UserActions.successfullyDeleted = function(){
	$('#loading').html('successfully deleted flow');
	setTimeout(function() {
		UserActions.hideLoading();
		window.location = '/uiflows/uiflow/myuiflows'
    }, 2000);	
}


UserActions.shareUIFlow = function(){
	// var uuid = $('#uuid');
	UserActions.showLoading();
	
	// var newURL = window.location.protocol + "://" + window.location.host + "/uiflows/uiflow/flow/"+uuid;
	
	$('#shareFlow').html(newURL);

	setTimeout(function() {

		$('#loading').css({"background" : "#3c4246"});
		UserActions.hideLoading();
	}, 2000);
}



UserActions.showLoading = function(){
	$('#modal').animate({
		"opacity" : 0.4,
		"z-index" : 1000
	}, 150, function(){
		$('#loading').animate({
			"opacity" : 1,
			"z-index" : 1001
		}, 50);
	});
};

UserActions.hideLoading = function(){
	$('#modal').animate({
		"opacity" : 0.0,
		"z-index" : -1
	}, 150, function(){
		$('#loading').animate({
			"opacity" : 0,
			"z-index" : -2
		}, 50);
	});
};



UserActions.error = function(responseObj){
	console.warn('error saving');
	console.warn(responseObj);
	$('#loading').html('<h1>Error</h1><p>There was a problem saving your flow data, please reload and try again</p>');
	
	$('#loading').css({"background" : "#f14621"});
	setTimeout(function() {
		
		$('#loading').css({"background" : "#3c4246"});
		UserActions.hideLoading();
    }, 2000);
	
	
}

