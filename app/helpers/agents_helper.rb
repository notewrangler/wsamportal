module AgentsHelper

	def handle
    self.first_name + " " + self.last_name
  end

  def current_user_edit_links
  	case current_user.role
  	when 'admin'
  		'admin_edit_links'
  	when 'agent'
  		'agent_edit_links'
  	end
  end

  def current_user_show_links
  	case current_user.role
  	when 'admin'
  		'admin_show_links'
  	when 'agent'
  		'agent_show_links'
  	end
  end
  		

end
