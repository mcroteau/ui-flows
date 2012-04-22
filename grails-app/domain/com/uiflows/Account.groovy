package com.uiflows

class Account {

	String username
	String passwordHash
	
	String displayName
	
	
	String email	
	boolean active
	
	boolean privateAccount
	
	String recoveryUUID
	int recoveries
	
	int logins
		
	static hasMany = [ roles: Role, permissions: String, uiflows: Uiflow]
		
		
	static constraints = {
	    username(unique:true, nullable: false, blank: false)
		email(unique:true, nullable:false, blank:false, email:true)
		recoveryUUID(nullable:true, blank: true)
		recoveries(nullable:true, blank: true)
		logins(nullable:true, blank:true)
	}
	
	
	static mapping = {
		id generator: 'sequence', params:[sequence:'ID_ACCOUNT_PK_SEQ']
	}
	
	
	def String toString(){
		return this.username		
	}

}
