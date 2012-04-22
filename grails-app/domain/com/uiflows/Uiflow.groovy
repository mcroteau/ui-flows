package com.uiflows

class Uiflow {

    String name
	String description
	String uiFlow
	
	boolean privateUiflow
	String passcode

	Date lastUpdated
	Date dateCreated
	
	Account account
    static belongsTo = Account


    static constraints = {
        name(nullable: false, blank: false, unique: true)
    }
	
	static mapping = {
    	id generator: 'sequence', params:[sequence:'ID_UIFLOW_PK_SEQ']
  	}

	def String toString(){
		return name
	}

}
