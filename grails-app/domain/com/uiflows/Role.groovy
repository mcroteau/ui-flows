package com.uiflows

class Role {

    String name

    static hasMany = [ users: Account, permissions: String ]
    static belongsTo = Account

    static constraints = {
        name(nullable: false, blank: false, unique: true)
    }
	
	static mapping = {
    	id generator: 'sequence', params:[sequence:'ID_ROLE_PK_SEQ']
  	}

	def String toString(){
		return name
	}
}
