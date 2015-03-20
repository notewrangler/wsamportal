class AgentsController < ApplicationController

	before_action :set_agent, only: [:show, :edit, :update, :destroy]
	
	def index
		@agents = Agent.all.order(:last_name)
	end

  def show
  end
  
  def edit
  end

	# PATCH/PUT /agents/1
  # PATCH/PUT /agents/1.json
  def update  
      if @agent.update(agent_params)
        flash[:notice] = 'agent was successfully updated.'
        redirect_to @agent        
      else
         render :edit 
      end   
  end

  def destroy
    @agent.destroy
    flash[:notice] = 'Agent was successfully deleted.'
    redirect_to jobs_url     
  end

	

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_agent
      @agent = Agent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agent_params
      params.require(:agent).permit(:last_name, :first_name, :username, :password, :password_confirmation, :address, :city, :state, :zip, :phone, :email) 
    end

end