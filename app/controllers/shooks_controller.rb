class ShooksController < ApplicationController
	

	def show
	end

	def create
		@shook = Shook.new(shook_params)
	end


	def index
		@shooks = Shook.assigned.where(agent_id: current_agent.id ).order(:date)		
	end	

	def update
	end
	

	def sign_in_page
		@shook = Shook.find(params[:id])
	end

	def signed_in
		@shook = Shook.find(params[:id])
		@shook.sign_in_time = Time.zone.now
		@shook.signed_in = true
		@shook.save
		flash[:success] = 'You have successfully signed in for your Shift.'
		redirect_to session_logout_path 
	end

	
	def map_feed
		@shook = Shook.find(params[:id])
			"https://www.google.com/maps/place/" + @shook.shift.job.address.gsub(/ /, '+') + ',' + @shook.shift.job.city.gsub(/ /, '+') + ',' + @shook.shift.job.state + '+' + @shook.shift.job.zip
	end

	
	def destroy
		@shook = Shook.find(params[:id])
		@shook.destroy 
	end
	
	private

		def shook_params
	      params.require(:shook).permit(:agent_id, :shift_id, :state)
	  end

end

