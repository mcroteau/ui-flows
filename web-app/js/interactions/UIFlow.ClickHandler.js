
function delegateClickEvent(e){
	var target = Utilities.getEventTarget(e)
	var $target = $(target);
	
	if($target.hasClass('addNewInteraction')){
		e.preventDefault();
		addNewInteraction();
	}
	if($target.hasClass('removeConnections')){
		e.preventDefault();
		UserActions.removeAllConnections();
	}
	if($target.hasClass('removeInteractions')){
		e.preventDefault();
		UserActions.removeInteractions();
	}
	
	
	if($target.hasClass('newUserAction')){
		e.preventDefault();
		UserActions.add($target.attr('interactionid')) //pass in the UUID of the interaction container
	}
	
	if($target.hasClass('interactionDelete')){
		e.preventDefault();
		deleteInteraction(target);
	}
	
	if($target.hasClass('interactionSeverAll')){
		e.preventDefault();
		severAllUserActions(target);
	}
	
	if($target.hasClass('userActionDelete')){
		e.preventDefault();
		deleteUserAction(target);
	}
	
	if($target.hasClass('userActionSever')){
		e.preventDefault();
		severUserAction(target);
	}
	
	
	if($target.hasClass('saveFlow')){
		e.preventDefault();
		UserActions.validateSaveUIFlow();
	};
	
	if($target.hasClass('updateFlow')){
		e.preventDefault();
		UserActions.validateUpdateUIFlow();
	}
	
	
	if($target.hasClass('listingButton')){
		e.preventDefault();
		UserActions.displayList();
	}
	
	if($target.hasClass('outputUIFlows')){
		e.preventDefault();
		outputUIFlows(target);
	}
	
	if($target.hasClass('loadFakeUIFlows')){
		e.preventDefault();
		loadFakeUIFlows(target);
	}
	
}

$('#uiflows').bind('click', function(e){
	delegateClickEvent(e);
});