class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/uiflow/shared/$uuid"(controller: "uiflow", action:"shared")

		"/"(controller:"static", action:"welcome")
		"500"(view:'/error')
	}
}
