class TimesheetWeeksController < ApplicationController

		def index
			@agents = Agent.all.select{ |a| a.timesheets.okayed.count > 0}
		end


		def weekly_timesheet
			@agent = Agent.find(params[:agent_id])
			@count = check_time_sheet_scope(@agent)
			@timesheets = @agent.timesheets.first(@count)
				
		end

		def check_time_sheet_scope(agent)
			@agent = agent
			@timesheets = @agent.timesheets.okayed.first(7)
			count = 0
			w_starter = @timesheets.first.date.cweek
			@timesheets.each do |t|
				w_this_one = t.date.cweek
				count += 1 unless w_this_one > w_starter
				end	
				return count
			end			
		

			def admin_approve
				Timesheet.update(params[:timesheets].keys, params[:timesheets].values)
				redirect_to timesheet_weeks_path	
			end


	end
