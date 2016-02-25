require 'page-object'

class ShowEntryPage
	include PageObject
	
	
	div(:response, :xpath => '//div[@class="message"]')
end