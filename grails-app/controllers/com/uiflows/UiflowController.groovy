package com.uiflows

import grails.converters.*

import org.apache.shiro.SecurityUtils

class UiflowController {


    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [uiflowInstanceList: Uiflow.list(params), uiflowInstanceTotal: Uiflow.count()]
    }

    def create = {
        def uiflowInstance = new Uiflow()
        uiflowInstance.properties = params
        return [uiflowInstance: uiflowInstance]
    }

    def save = {

		def subject = SecurityUtils.getSubject();
		def account
		if(subject?.getPrincipal()){
			account = Account.findByUsername(subject?.getPrincipal())
		}
		
		def responseObj = [:]
		
		if(account){
		
			println 'account here ... '
		
			
			params.privateUiflow = true
			
    	    def uiflowInstance = new Uiflow(params)
			uiflowInstance.account = account
			uiflowInstance.privateUiflow = true
			uiflowInstance.uuid = UUID.randomUUID().toString()

			
    	    if (uiflowInstance.validate() && 
					uiflowInstance.save(flush: true)) {
				
				println 'saved flow ' 
				
				account.addToPermissions("Uiflow:show,edit,delete,update:" + uiflowInstance.id)
				account.save(flush:true)
				
				responseObj["status"]  =  'success'
				responseObj["type"]    = 'success'
				responseObj["message"] = 'Successfully saved Flow'
				responseObj["flow"] = uiflowInstance
			
				println responseObj
				render responseObj as JSON
				
    	    } else {
			
				response.status = 500
				responseObj["status"]  =  'error'
				responseObj["type"]    = 'baddata'
				responseObj["message"] = 'There was a problem saving, try again'
				responseObj["flow"] = uiflowInstance
				responseObj["errors"] = uiflowInstance.errors.allErrors
			
				render responseObj as JSON
				
    	    }

    	}else{	
			
			response.status = 500
			responseObj["status"]  =  'error'
			responseObj["type"]    = 'auth'
			responseObj["message"] = 'You must be logged in to view your UI Flows' 
			responseObj["flow"] = uiflowInstance
			
			
			render responseObj as JSON
			
		}

		
		

	}

    def show = {
	
	
        def uiflowInstance = Uiflow.get(params.id)
        if (!uiflowInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'uiflow.label', default: 'Uiflow'), params.id])}"
            redirect(action: "list")
        }
        else {
            [uiflowInstance: uiflowInstance]
        }
    }







    def edit = {


		println 'edit uuid -> ' + params.uuid 
		println 'edit passcode -> ' + params?.passcode
		
		if(params?.passcode && params?.uuid){
		
			println 'have both'
			println "passcode : ${params.passcode}      uuid : ${params.uuid}"
			def uiflowInstance = Uiflow.findByPasscodeAndUuid(params.passcode, params.uuid)
			
			if (!uiflowInstance) {
			
				println 'CANNOT FIND FLOW'
    		    flash.message = params.passcode + " is the wrong passcode for " + params.uuid
    		    
			    redirect(action: "enterpasscode")
    		} else {
			
				println 'Found Flow.. render'
				[uiflowInstance: uiflowInstance]
    		    render(view : 'edit')
				
    		}
		
		}else{
			if(params.id && SecurityUtils.subject.isPermitted("Uiflow:update:"+params.id)){
			
        	
    			def uiflowInstance = Uiflow.get(params.id)
    			if (!uiflowInstance) {
    			    flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'uiflow.label', default: 'Uiflow'), params.id])}"
    			    
				    redirect(action: "myuiflows")
    			}
    			else {
    			    return [uiflowInstance: uiflowInstance]
    			}
			
			}else{
    		 
				flash.message = "You are not authorized to Edit this UI Flow"
			 	redirect action:"myuiflows"
    		 
			}		
		
		}
	

    }









    def update = {



		def subject = SecurityUtils.getSubject();
		def account
		if(subject?.getPrincipal()){
			account = Account.findByUsername(subject?.getPrincipal())
		}
		
		def responseObj = [:]
		
		if(account){
		
			println 'account here ... '
			
			
			params.privateUiflow = true
	        def uiflowInstance = Uiflow.get(params.id.toLong())
	        
			if (uiflowInstance) {
	            if (params.version) {
	                def version = params.version.toLong()
	                if (uiflowInstance.version > version) {

	                    uiflowInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'uiflow.label', default: 'Uiflow')] as Object[], "Another user has updated this Uiflow while you were editing")
	
	
						response.status = 500
						responseObj["status"]  =  'error'
						responseObj["type"]    = 'baddata'
						responseObj["message"] = 'There was a problem saving, try again'
						responseObj["flow"] = uiflowInstance
						responseObj["errors"] = uiflowInstance.errors.allErrors

						render responseObj as JSON
	
	                }
	            }
	
	            uiflowInstance.properties = params
	            if (!uiflowInstance.hasErrors() && uiflowInstance.save(flush: true)) {

					responseObj["status"]  =  'success'
					responseObj["type"]    = 'success'
					responseObj["message"] = 'Successfully updated Flow'
					responseObj["flow"] = uiflowInstance
			    	
					println responseObj
					render responseObj as JSON


	            } else {
					response.status = 500
					responseObj["status"]  =  'error'
					responseObj["type"]    = 'baddata'
					responseObj["message"] = 'There was a problem saving, try again'
					responseObj["flow"] = uiflowInstance
					responseObj["errors"] = uiflowInstance.errors.allErrors
			    	
					render responseObj as JSON
	
	            }
	
	
	        } else {
	
			
				response.status = 500
				responseObj["status"]  =  'error'
				responseObj["type"]    = 'notfound'
				responseObj["message"] = 'UI Flow not found'
	    		
				render responseObj as JSON
	
	        }
	
	
    	
		}else{	
			
			response.status = 500
			responseObj["status"]  =  'error'
			responseObj["type"]    = 'auth'
			responseObj["message"] = 'You must be logged in to view your UI Flows' 
			responseObj["flow"] = uiflowInstance
			
			render responseObj as JSON
			
		}
	
    }



    def delete = {

		println 'edit -> ' + params.id 
	
		def responseObj = [:]
		
		if(params.id && SecurityUtils.subject.isPermitted("Uiflow:delete:"+params.id)){
    	    def uiflowInstance = Uiflow.get(params.id)
    	    if (uiflowInstance) {
    	        try {
    	            uiflowInstance.delete(flush: true)

					responseObj["status"]  =  'success'
					responseObj["type"]    = 'success'
					responseObj["message"] = 'Successfully deleted flow' 
					responseObj["flow"] = uiflowInstance

					render responseObj as JSON
					
    	        } catch (org.springframework.dao.DataIntegrityViolationException e) {
				
					response.status = 500
					responseObj["status"]  =  'error'
					responseObj["type"]    = 'baddata'
					responseObj["message"] = 'Data integrity issue' 
					responseObj["flow"] = uiflowInstance

					render responseObj as JSON
					
    	        }
    	    }
    	    else {
			
				response.status = 500			
				responseObj["status"]  =  'error'
				responseObj["type"]    = 'auth'
				responseObj["message"] = 'You are not authorized to delete this UI Flow' 
				responseObj["flow"] = uiflowInstance
			
				render responseObj as JSON


    	    }
		}
    }


	def myuiflows = {
	
	
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
	
		def subject = SecurityUtils.getSubject();
		def account
		if(subject?.getPrincipal()){
			account = Account.findByUsername(subject?.getPrincipal())
		}
		
		
		if(account){
		
			println 'account -> ' + account
			def uiflows = Uiflow.findAllByAccount(account, [sort:"dateCreated", order:"desc", max : params.max])
		
			def totalFlows = Uiflow.countByAccount(account)

			if(totalFlows && totalFlows >= 1){
				
				
				[uiflows: uiflows, uiflowsTotal: totalFlows, historyActive:"active"]
				
		
			}else{
			
				redirect(controller:'uiflow', action:'noflows')
			
			}
			
			
		}else{
			
			flash.message = "You must be logged in to view your UI Flows"
			redirect(controller:"auth", action:"login")
		
		}
	
	}
	
	def noflows = {}
	
	def newflow = {}
	
	def enterpasscode = {
		
		println 'uuid -> ' + params?.uuid
		
		if(params?.uuid){
			
			def uiflowInstance = Uiflow.findByUuid(params.uuid)
			
			if(!uiflowInstance){
				
				flash.message = "Cannot find Flow."
				redirect(controller:"auth", action:"login")
				
			}else{
				
				request.uiflowInstance = uiflowInstance
				request.uuid = params.uuid
			
			}
			
			
		}else{	
			flash.message = "You must be logged in to view your UI Flows"
			redirect(controller:"auth", action:"login")
		}
	
	}
	
	
	
}
