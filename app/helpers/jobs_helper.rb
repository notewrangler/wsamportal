module JobsHelper

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

	def current_jobs_user_body
		case current_user.role
		when 'admin'
			'job_admin'
		when 'agent'
			'job_agent'
		end
	end

 end
