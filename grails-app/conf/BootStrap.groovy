import blog.*

class BootStrap {

    def init = { servletContext ->
		
		def adminRole = Role.findByAuthority("ROLE_ADMIN") ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)
		def userRole = Role.findByAuthority("ROLE_USER") ?: new Role(authority: 'ROLE_USER').save(failOnError: true)
		def blogger = User.findByUsername('JBloom') ?: new User(username: "JBloom", password: "rarrar33", enabled: true).save(failOnError: true)
		
		if(!blogger.authorities.contains(adminRole)){
			UserRole.create blogger, adminRole
		}
		
		def user = User.findByUsername('user') ?: new User(username: "user", password: "password", enabled: true).save(failOnError: true)
		
		if(!user.authorities.contains(userRole)){
			UserRole.create user,userRole	
		}
		
		UserRole.withSession {
			it.flush()
			it.clear()
			
		assert Role.count() == 2
		assert User.count() == 2
		assert UserRole.count() == 2
			
		}
		
    }
    def destroy = {
    }
}
