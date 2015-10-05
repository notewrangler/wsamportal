class CompletedAgentController < ApplicationController

  def index
  	@shooks = Shook.completed.where(agent_id: current_agent).order(date: :desc)
  end
end
