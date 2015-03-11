module TimesheetDaysHelper

	def team_lead_current_job
		Job.select{ |j| j.team_lead == current_agent}.last

	end

end


