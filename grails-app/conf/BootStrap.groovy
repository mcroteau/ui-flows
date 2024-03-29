import org.apache.shiro.crypto.hash.Sha512Hash
import org.apache.shiro.crypto.hash.Sha256Hash
import org.apache.shiro.crypto.hash.Sha1Hash


import com.uiflows.Account
import com.uiflows.Role

class BootStrap {

	def adminPass
	def simpleUserPass
	
	def adminRole
	def simpleRole

	def utilitiesService
	def mailService
		
    def init = { servletContext ->
	
		createRoles()
    	createUsers()

	}
	
    def destroy = {
    }

	def createRoles = {
		
		if(Role.count() == 0){
			adminRole = new Role(name : "ROLE_ADMIN").save(flush:true)
			simpleRole = new Role(name : "ROLE_SIMPLE_USER").save(flush:true)
		}
		
		println 'Roles : ' + Role.count()
	}
	
	

	def createUsers = {
		
		
		if(Account.count() == 0){
		
			setPasswords()
			
			def adminAccount = new Account(displayName : "Admin User", username : 'admin', passwordHash : adminPass, email : 'admin@uiflows.com', active : true)
			adminAccount.addToRoles(adminRole)
			adminAccount.addToRoles(simpleRole)
			adminAccount.save(flush:true)
			
			
			
			def simpleAccountMale = new Account(displayName : "Mike", username : 'simpleuser', passwordHash : simpleUserPass, email : 'testingapp@uiflows.com', active : true)
			simpleAccountMale.addToRoles(simpleRole)
			simpleAccountMale.save(flush:true)

		
		}
		
		println 'Accounts : ' + Account.count()
		
	}
	
	
	
	def setPasswords = {	
		adminPass = new Sha256Hash('administrator').toHex()
		simpleUserPass = new Sha256Hash('simplepass').toHex()
	}

	
}
