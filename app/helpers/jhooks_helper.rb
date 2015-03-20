module JhooksHelper

	def check_availability(state)
		case state
		when "all"
			flash.now[:notice] = "all shifts marked as available"
		when "reject"	
			flash.now[:notice] = "all shifts marked as unavailable"
		# when "sel"
		end
	end

	def current_user_sview
		case current_user.role
		when 'admin'
			'admin_prompt'
		when 'agent'
			'agent_prompt'
		end
	end

	

	def splay_shooks

				i = self.job.shifts.first.id

				if self.state == "all_in"
					
					while i <= self.job.shifts.last.id
						Shook.create(shift_id: i, agent_id: self.agent_id, state: "opted")
						i += 1
					end

				# elsif self.state == "selshift"
				# 	redirect_to contractor_shift_calendar_path(job_id
				end
	end

	def splay_assignments

				i = self.job.shifts.first.id

				if self.state == "assigned"
					
					while i <= self.job.shifts.last.id
						Shook.create(shift_id: i, agent_id: self.agent_id, state: "assigned")
						i += 1
					end				
				end
	end

	def assign_all_shifts(agent_id, job_id)
			@agent_id = agent
			@job = job
			@shooks = Shook.where()
	end
	
end
