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

	# def map_feed
	# 		"https://www.google.com/maps/place/" + self.shift.job.address.gsub(/ /, '+') + ',' + self.shift.job.city.gsub(/ /, '+') + ',' + self.shift.job.state + '+' + self.shift.job.zip
	# 	end
	
end
