module ShooksHelper

	def current_user_prompt
		case current_user.role
		when 'admin'
			'admin_prompt'
		when 'agent'
			'agent_prompt'
		end
	end

	def current_user_links
		case current_user.role
		when 'admin'
			'admin_links'
		when 'agent'
			'agent_links'
		end
	end

	def confirmation_status(shook)
		@shook = shook
		case @shook.state
		when 'assigned' 
			'confirmation_button'
		when 'confirmed'
			'checked_in'
		end
	end
	
	def current_state_links(shook)
		@shook = shook
		case @shook.state
		when 'confirmed'
			'sign_in_link'
		when 'signed_in'
			'report_link'
		end
	end


	# def map_feed
	# 		"https://www.google.com/maps/place/" + self.shift.job.address.gsub(/ /, '+') + ',' + self.shift.job.city.gsub(/ /, '+') + ',' + self.shift.job.state + '+' + self.shift.job.zip
	# 	end
	
end
