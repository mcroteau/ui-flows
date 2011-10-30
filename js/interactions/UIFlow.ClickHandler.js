
function delegateClickEvent(target){
	
	if($(target).hasClass('addNewInteraction')){
		addNewInteraction();
	}
	if($(target).hasClass('removeConnections')){
		UserActions.removeAllConnections();
	}
	if($(target).hasClass('removeInteractions')){
		UserActions.removeInteractions();
	}
	
	
	if($(target).hasClass('newUserAction')){
		var targ = $(target);
		UserActions.add(targ.attr('interactionid')) //pass in the UUID of the interaction container
	}
	
	if($(target).hasClass('interactionDelete')){
		deleteInteraction(target);
	}
	
	if($(target).hasClass('interactionSeverAll')){
		severAllUserActions(target);
	}
	
	if($(target).hasClass('userActionDelete')){
		deleteUserAction(target);
	}
	
	if($(target).hasClass('userActionSever')){
		severUserAction(target);
	}
	
	
	
	
	if($(target).hasClass('outputUIFlows')){
		outputUIFlows(target);
	}
	
	if($(target).hasClass('loadFakeUIFlows')){
		loadFakeUIFlows(target);
	}
	
}

$('#uiflows').bind('click', function(e){
	e.preventDefault();
	delegateClickEvent(Utilities.getEventTarget(e));
});