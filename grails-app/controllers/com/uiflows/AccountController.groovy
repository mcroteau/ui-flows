package com.uiflows

import groovy.text.Template
import groovy.text.SimpleTemplateEngine

import org.apache.shiro.authc.UsernamePasswordToken
import org.apache.shiro.crypto.hash.Sha512Hash
import org.apache.shiro.crypto.hash.Sha256Hash
import org.apache.shiro.crypto.hash.Sha1Hash


import org.apache.shiro.SecurityUtils
import java.util.UUID

class AccountController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def utilitiesService
	def mailService
	
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [accountInstanceList: Account.list(params), accountInstanceTotal: Account.count()]
    }

    def create = {
        def accountInstance = new Account()
        accountInstance.properties = params
        return [accountInstance: accountInstance]
    }

    def save = {
        def accountInstance = new Account(params)
        if (accountInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'account.label', default: 'Account'), accountInstance.id])}"
            redirect(action: "show", id: accountInstance.id)
        }
        else {
            render(view: "create", model: [accountInstance: accountInstance])
        }
    }

    def show = {
        def accountInstance = Account.get(params.id)
        if (!accountInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'account.label', default: 'Account'), params.id])}"
            redirect(action: "list")
        }
        else {
            [accountInstance: accountInstance]
        }
    }

    def edit = {
        def accountInstance = Account.get(params.id)
        if (!accountInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'account.label', default: 'Account'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [accountInstance: accountInstance]
        }
    }

    def update = {
        def accountInstance = Account.get(params.id)
        if (accountInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (accountInstance.version > version) {
                    
                    accountInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'account.label', default: 'Account')] as Object[], "Another user has updated this Account while you were editing")
                    render(view: "edit", model: [accountInstance: accountInstance])
                    return
                }
            }
            accountInstance.properties = params
            if (!accountInstance.hasErrors() && accountInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'account.label', default: 'Account'), accountInstance.id])}"
                redirect(action: "show", id: accountInstance.id)
            }
            else {
                render(view: "edit", model: [accountInstance: accountInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'account.label', default: 'Account'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def accountInstance = Account.get(params.id)
        if (accountInstance) {
            try {
                accountInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'account.label', default: 'Account'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'account.label', default: 'Account'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'account.label', default: 'Account'), params.id])}"
            redirect(action: "list")
        }
    }






	def registration = {
	
		def subject = SecurityUtils.getSubject();	
		if(!subject.authenticated){
			
			println "remote address -> ${request.getRemoteAddr()}"
		
		}else{
			redirect(controller : 'static', action : 'welcome' )
		}
	}





	def register = {
	
		if(Account.count() < 22){
		
			def shiroSubject = SecurityUtils.getSubject();
	    	
			if(!shiroSubject.authenticated){
			
				def accountInstance = new Account(params)
				
				def passwordHash = new Sha256Hash(params.passwordHash).toHex()
				accountInstance.passwordHash = passwordHash
				
				def simpleRole = Role.findByName("ROLE_SIMPLE_USER")
				accountInstance.addToRoles(simpleRole)
				
				println 'pass -> ' + params.passwordHash + '  hash->' + passwordHash 
				println 'params -> ' + params
				
				
    			if (accountInstance.save(flush: true)) {
    				
					println 'params -> ' + params
					println "email -> ${accountInstance.email}"
					
					
					
					def host = "localhost:8080"
						try{


							File templateFile = grailsAttributes.getApplicationContext().getResource( File.separator + "emailTemplates" + File.separator + "registrationConfirmation.gtpl").getFile();

							def binding = ["imageLocation" : "http://${host}/uiflows/images/logo.jpg"]
					        def engine = new SimpleTemplateEngine()
					        def template = engine.createTemplate(templateFile).make(binding)
					        def bodyString = template.toString()


							print 'send email'

							print bodyString

							
					
							accountInstance.addToPermissions("account:show,edit,update:${accountInstance.id}")
							accountInstance.save(flush:true)
							
							mailService.sendMail {
							   to accountInstance.email
							   from "uiflows@gmail.com"
							   subject "[UI Flows] Successfully Registered"
							   html bodyString
							}

							
							
							flash.message = "You have successfully registered... "
							
    						redirect(controller : 'auth', action: 'signIn', params : [accountInstance: accountInstance, username : params.username, password : params.passwordHash, newRegistration : true])


						}catch (Exception e){

							println e.printStackTrace();
							flash.message = "there was a problem with your registration, please try again or contact the administrator"
							view: 'registration'
						}

        		
        		
    			} else {
    				flash.message = "something went wrong while trying to register..."
					render(view: "registration", model: [accountInstance: accountInstance])
    			}
    		
			}else{
				redirect(controller : 'static', action : 'welcome' )
			}	
		
		} else {
			
			flash.message = "We have hit our limit.  Stay tuned, depending on user feedback, the site may be opened up to more users."
			redirect controller:"static", action:"welcome"
			
		}
			
	}



}
