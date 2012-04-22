package com.uiflows


class SecurityFilters {
	def filters = {
		roleMaintenance(controller: "account", action: "(edit|update)") {
		    before = {
		        accessControl {
		            role("ROLE_SIMPLE_USER")
		        }
		    }
		}
		roleMaintenance(controller: "account", action: "(delete)") {
		    before = {
		        accessControl {
		            role("ROLE_ADMIN")
		        }
		    }
		}				
		roleMaintenance(controller: "role", action: "(create|edit|save|update|delete)") {
		    before = {
		        accessControl {
		            role("ROLE_ADMIN")
		        }
		    }
		}
	    virtueEntryMaintenance(controller: "uiflow", action: "(create|edit|save|update|delete|newflow)") {
	        before = {
	            accessControl {
		            role("ROLE_SIMPLE_USER")
	            }
	        }
	    }
	}
}
