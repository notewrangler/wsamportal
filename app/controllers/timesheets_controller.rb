class TimesheetsController < ApplicationController

	def new
		@timesheet = Timesheet.new
		@shook = Shook.find(params[:shook_id])
	end

	def create
		@timesheet = Timesheet.new(timesheet_params)
		@shook = Shook.find(params[:shook_id])
		if @timesheet.save
			@timesheet.update_attributes(agent_id: @shook.agent_id, shook_id: @shook.id, date: @shook.date, state: 'submitted')
    	@shook.report!
    	redirect_to shooks_path, notice: 'Time Report Successfully Saved'     
    else
      render :new, shook: @shook
    end
	end

	
	def weekly
		@agent = Agent.find(params[:id])
		@count = check_time_sheet_scope(@agent)
		@timesheets = @agent.timesheets.first(@count)
	end

	def show
	end

	def index
		@shooks = Shook.reported
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	


	def timesheet_params
      params.require(:timesheet).permit(:shook_id, :time_in, :time_out, :break_minutes, :total_hrs, 
      	:contact, :miles, :drive_time, :expenses, :comments)
  end
end
