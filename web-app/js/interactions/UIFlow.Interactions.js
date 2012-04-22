

var interactionTemplate = '<div class="window interaction" id="{{interactionId}}"  interactionId="{{interactionId}}">\
	<div class="">\
		<div class="interactionActions"  interactionId="{{interactionId}}">\
			<span class="interactionSeverAll"  interactionId="{{interactionId}}">DT</span>\
			<span class="interactionDelete"  interactionId="{{interactionId}}">DL</span>\
			<span class="interactionDraggable"  interactionId="{{interactionId}}">DR</span>\
		</div>\
		<p contenteditable="true" class="userSees">EDIT : This is what the user sees</p>\
		<ul class="userActions" interactionId="{{interactionId}}">\
		</ul>\
		<a href="#" class="newUserAction" interactionId="{{interactionId}}">Add User Action</a>\
	</div>\
</div>';


var addNewInteraction = function(){
	console.log(' create interaction ');
	var interactionId = Utilities.getUUID();
	var options = { interactionId : interactionId};
	var interactionHtml = Mustache.to_html(interactionTemplate, options);
	
	var css = {
		"position" : "absolute",
		"right"    : "15px",
		"top"      : "30px"
	};
	//console.log('append new interaction -> ' + interactionHtml);
	$(interactionHtml).appendTo('#uiflows');
	
	console.log('appended');
	$('#' + interactionId).css(css);
	$('#' + interactionId).draggable({handle:'span.interactionDraggable',grid:[5,5]}).live('drag',function(e){
		jsPlumb.repaintEverything();		
	});
	
	UserActions.createPoint(interactionId, true);

};

var deleteInteraction = function(target){

	var interactionId = $(target).attr('interactionId');
	console.log('delete interaction -> ' + interactionId);	
	UserActions.removeAll(interactionId);

};


var severAllUserActions = function(target){
	
	var interactionId = $(target).attr('interactionId');
	console.log('delete interaction -> ' + interactionId);

	UserActions.sever(interactionId);
};




var deleteUserAction = function(target){
	console.info('delete user action -> ');
	var userActionId = $(target).parents(".userAction").attr('id');
	UserActions.remove(userActionId);
}



var severUserAction = function(target){
	console.info('sever user action -> ');
	var userActionId = $(target).parents(".userAction").attr('id');
	UserActions.sever(userActionId);
}





$('.interaction').hover(function(){
	
	
}, function(){
	
})