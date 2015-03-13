module SessionsHelper

  
def flash_class(type)
    case type
    when :alert
      "alert-danger" 
    when :notice
      "alert-success" 
    else
      ""
    end
  end 

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
   @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_agent
    if current_user.role == 'agent'
      @current_agent ||= Agent.find_by(id: session[:user_id])
    end   
  end

  

  def current_user_body
    case current_user.role
    when 'agent'
      'sessions/agents_body'
    when 'admin'
      'sessions/admins_body'
    end
  end

  def current_agent_available_jobs
    Job.all.select { |j| !j.agents.include?(current_agent) && j.start_date >= Date.today }.count.to_s
  end

  
  def session_handle
    current_user.first_name + " " + current_user.last_name
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

end
