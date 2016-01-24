class SessionsController < ApplicationController

  def new
    render layout: false
  end

  def index

  end



  def create
  	user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to sessions_path
    else
      flash[:danger] = 'Invalid username/password combination'
      redirect_to root_url
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end


end

# if current_user.role == 'agent'
#   hot = Shook.try(:assigned)
#   ourHero = hot.try(current_agent.id)
#   today = ourHero.try(date: Date.today)
#   if today
#     @today = today.pluck(:id)
#   end
#   # @today = Shook.assigned.select.(['agent_id = ? and date = ?', current_agent.id,  Date.today]).pluck(:id) || false
# end
