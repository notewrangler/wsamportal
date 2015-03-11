class ReportedAgentController < ApplicationController

  def index
  	@shooks = Shook.reported.where(agent_id: current_agent).order(date: :desc)
  end
end
