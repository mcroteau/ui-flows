
Utilities = {

	getUUID : function() {
		console.log('Utilities : get uuid -> ');
	    var S4 = function() {
	       return (((1+Math.random())*0x10000)|0).toString(16).substring(1);
	    };
	    return (S4()+S4()+"-"+S4()+"-"+S4()+"-"+S4()+"-"+S4()+S4()+S4());
	},	
	
	getEventTarget : function(e){
		var e=e || window.event;
		return e.target || e.srcElement;
	}
	
}



