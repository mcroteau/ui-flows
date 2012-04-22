package com.uiflows

class Uiflow {

    String name
	String uiFlow
	
	boolean privateUiflow
	String passcode

	Date lastUpdated
	Date dateCreated
	
	Account account
    static belongsTo = Account

	String uuid


    static constraints = {
        name(nullable: false, blank: false)
    }
	
	static mapping = {
    	id generator: 'sequence', params:[sequence:'ID_UIFLOW_PK_SEQ']
  	}

	def String toString(){
		return name
	}

}
