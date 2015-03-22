class JhooksController < ApplicationController
	# before_action :set_jhook, only: [:show, :edit, :update, :destroy]

	 def new
	 		@jhook = Jhook.new
	    @job = Job.find(params[:job_id])
	    @shifts_by_date = @job.shifts.all.group_by(&:shift_date)
	    @date = params[:date] ? Date.parse(params[:date]) : @job.start_date 
	 end

	 def available_agents
	 	@job = Job.find(params[:job_id])
	 	@jhooks = @job.jhooks.all
	 end
		
	
		def create
			@job = Job.find_by(params[:job_id])	
			@jhook = Jhook.new(jhook_params)		
										
			state = @jhook.state
			case state
			  when "all_in" 				  	
			  	@jhook.update_attributes(agent_id: current_agent.id)							  	
	  			@jhook.job.shifts.each { |shift| shift.increment!(:available_agents) }
	  			splay_opted(@jhook)	
	  			flash[:success] = 'Availability Successfully Updated'			  	
			  	redirect_to jobs_path 
			  when "unavailable"				  	
			  	@jhook.update_attributes(agent_id: current_agent.id)
			  	flash[:success] = 'Availability Successfully Updated'
			  	redirect_to jobs_path
			  when "selected_shifts"			  	
			  	@jhook.update_attributes(agent_id: current_agent.id)	
			  	splay_open(@jhook)			  				  	
			  	redirect_to	shift_calendar_job_jhooks_path(@jhook.job_id)	
			end 		  	
	 end

	  def assign_team_lead
	  	@job = Job.find(params[:job_id])
	  	@jhooks = @job.jhooks.all
	  	@agent_select = Agent.all.order(:last_name).map{|a| [ a.alpha_handle + ": " + a.username,  a.id] }
	  end

	  def team_lead_assignment
	  	@job = Job.find(params[:job_id])
	  	@agent = Agent.find(params[:agent_id])
		  	@jhook = Jhook.find_or_create_by(:agent_id => @agent.id, :job_id => @job.id)
		  	@jhook.update_attributes(team_lead: true, state: 'assigned')
	  		splay_assigned(@jhook)				
				redirect_to wage_setter_job_jhooks_path(@job)	  	
		end	  	
	  	
	  
	  def assign	  	
	  	@job = Job.find(params[:job_id])
		  @jhooks = Jhook.find(params[:ids])

		  if @jhooks.length <= @job.manpower
				  @jhooks.each do |jhook| 
				  	jhook.update_attributes(state: 'assigned')		    
				  	splay_assigned(jhook)				
					end				
				  	redirect_to wage_setter_job_jhooks_path(@job)	
			else
			 	flash[:danger] = 'Number of Assigned Agents exceeds Required Agents'
				redirect_to available_agents_job_jhooks_path
			end	

	  end

	  def remove_agents
	 	@job = Job.find(params[:job_id])
	 	@jhooks = @job.jhooks.all
	 end

	 def unassign	  	
	  	@job = Job.find(params[:job_id])
		  @jhooks = Jhook.find(params[:ids])
		  @jhooks.each do |jhook| 
		  	jhook.update_attributes(state: 'removed')		    
		  	splay_removed(jhook)				
			end	
				flash[:success] = 'Agent was Successfully Removed.'
		  	redirect_to jobs_path 				  					 	
	  end



	  def wage_setter
	  	@job = Job.find(params[:job_id])
	  	@jhooks = @job.jhooks.assigned.nopay	  	
	  end

	  def wage_setter_partial
	  	@job = Job.find(params[:job_id])
	  	@jhooks = @job.jhooks.partial.nopay
	  end

	  def set_wages
	  	Jhook.update(params[:jhooks].keys, params[:jhooks].values)
	  	flash[:success] = 'Agent was Successfully Assigned.'
	  	redirect_to jobs_path
	  end

	  def shift_calendar
	  	@job = Job.find(params[:job_id])
	   	@shifts_by_date = @job.shifts.all.group_by(&:shift_date)
	    @date = params[:date] ? Date.parse(params[:date]) : @job.start_date 
	  end

	  def shift_selections
	  	@job = Job.find(params[:job_id])
	  	@shifts = Shift.find(params[:ids])
	  		@shifts.each do |shift|
		  		@shook = Shook.find_or_create_by(:shift_id => shift.id, :agent_id => current_agent.id)
	  			@shook.opt!
	  		end	
	  		flash[:success] = 'Shifts were Successfully Selected'	 
		  	redirect_to jobs_path 
		 end

		def assign_manual
			@job = Job.find(params[:job_id])
			@agent_select = Agent.all.order(:last_name).map{|a| [ a.alpha_handle + ": " + a.username,  a.id] }
		end

		def manual_assignment			
			@job = Job.find(params[:job_id])
    	@agent = Agent.find(params[:agent_id]) 
     	@jhook =	Jhook.find_or_create_by(agent_id: @agent.id, job_id: @job.id)
     	@jhook.assign!
     	splay_assigned(@jhook)		 		   	 
      redirect_to wage_setter_job_jhooks_path(@job) 
		end 
		
		def destroy
		end

		private

		def splay_opted(jhook)			
			@jhook = jhook
			@shifts = @jhook.job.shifts.all
			@shifts.each do |shift|
				@shook = Shook.find_or_create_by(:shift_id => shift.id, :agent_id => @jhook.agent_id)
				@shook.update_attributes(jhook_id: @jhook.id, state: 'opted', date: shift.shift_date)
			end
		end	

		def splay_open(jhook)
			@jhook = jhook
			@shifts = @jhook.job.shifts.all
			@shifts.each do |shift| 
				@shook = Shook.find_or_create_by(:shift_id => shift.id, :agent_id => @jhook.agent.id) 
			  @shook.update_attributes(jhook_id: @jhook.id, state: 'open', date: shift.shift_date)
			end
		end	

		def splay_assigned(jhook)
			@jhook = jhook
			@shifts = @jhook.job.shifts.all
			@shifts.each do |shift|
				@shook = Shook.find_or_create_by(:shift_id => shift.id, :agent_id => @jhook.agent.id) 
				@shook.update_attributes(jhook_id: @jhook.id, state: 'assigned', date: shift.shift_date)
			end
		end

		def splay_removed(jhook)
			@jhook = jhook
			@shifts = @jhook.job.shifts.all
			@shifts.each do |shift|
				@shook = Shook.find_by(:shift_id => shift.id, :agent_id => @jhook.agent.id) 
				@shook.update_attributes(jhook_id: @jhook.id, state: 'removed', date: shift.shift_date)
			end
		end
			
		
		def set_jhook
			@jhook = Jhook.find(params[:id])
		end

		def jhook_params
	      params.require(:jhook).permit(:job_id, :agent_id, :state, :comment, :team_lead, :wage_rate)
	  end

end




