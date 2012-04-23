class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/uiflow/flow/$uuid"(controller: "uiflow", action:"enterpasscode")

		"/"(view:"/index")
		"500"(view:'/error')
	}
}
