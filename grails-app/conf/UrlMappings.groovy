class UrlMappings {

	
	
	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
				
				
            }
        }

        "/"(controller:"home")
        "500"(view:'/error')
		
		name blog: "/blogEntry/$id/$year/$month/$day/$title" {
			controller = "blogEntries"
			action = "show"
		}
	}
}
