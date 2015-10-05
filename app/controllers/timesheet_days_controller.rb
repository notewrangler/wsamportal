class TimesheetDaysController < ApplicationController

	def index	
		@jobs = Job.find(current_agent.duties)
	end

	def team_lead_ok
		@job = Job.find(params[:job_id])
		@crew = @job.crew		 
	end

	def ok_by_team_lead
		Timesheet.update(params[:timesheets].keys, params[:timesheets].values)
		redirect_to sessions_path		
	end

	private

	

	def timesheet_days_params
		params.require(:timesheet_day).permit(:team_lead_ok)
	end

end
