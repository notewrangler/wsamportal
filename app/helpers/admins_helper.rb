module AdminsHelper

	def flash_class(type)
		case type
		when :alert
			"alert-danger" 
		when :notice
			"alert-success" 
		else
			""
		end
	end
	
end