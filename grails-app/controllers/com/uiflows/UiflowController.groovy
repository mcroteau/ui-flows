package com.uiflows

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
        def uiflowInstance = new Uiflow(params)
        if (uiflowInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'uiflow.label', default: 'Uiflow'), uiflowInstance.id])}"
            redirect(action: "show", id: uiflowInstance.id)
        }
        else {
            render(view: "create", model: [uiflowInstance: uiflowInstance])
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
        def uiflowInstance = Uiflow.get(params.id)
        if (!uiflowInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'uiflow.label', default: 'Uiflow'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [uiflowInstance: uiflowInstance]
        }
    }

    def update = {
        def uiflowInstance = Uiflow.get(params.id)
        if (uiflowInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (uiflowInstance.version > version) {
                    
                    uiflowInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'uiflow.label', default: 'Uiflow')] as Object[], "Another user has updated this Uiflow while you were editing")
                    render(view: "edit", model: [uiflowInstance: uiflowInstance])
                    return
                }
            }
            uiflowInstance.properties = params
            if (!uiflowInstance.hasErrors() && uiflowInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'uiflow.label', default: 'Uiflow'), uiflowInstance.id])}"
                redirect(action: "show", id: uiflowInstance.id)
            }
            else {
                render(view: "edit", model: [uiflowInstance: uiflowInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'uiflow.label', default: 'Uiflow'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def uiflowInstance = Uiflow.get(params.id)
        if (uiflowInstance) {
            try {
                uiflowInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'uiflow.label', default: 'Uiflow'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'uiflow.label', default: 'Uiflow'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'uiflow.label', default: 'Uiflow'), params.id])}"
            redirect(action: "list")
        }
    }
}
