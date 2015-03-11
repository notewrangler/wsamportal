class ShooksController < ApplicationController
	

	def show
	end

	def create
		@shook = Shook.new(shook_params)
	end


	def index
		@shooks = Shook.assigned.where(agent_id: current_agent).order(:date)		
	end

	 # def assign_single_shift
  #   @shift = Shift.find(params[:id])
  #   @agent_select = Agent.all.order(:last_name).map{|a| [ a.alpha_handle + ": " + a.username,  a.id] }
  # end

	
	def map_feed
		@shook = Shook.find(params[:id])
			"https://www.google.com/maps/place/" + @shook.shift.job.address.gsub(/ /, '+') + ',' + @shook.shift.job.city.gsub(/ /, '+') + ',' + @shook.shift.job.state + '+' + @shook.shift.job.zip

	end

	
	def destroy
	end
	
	private

		def shook_params
	      params.require(:shook).permit(:agent_id, :shift_id, :state)
	  end

end

