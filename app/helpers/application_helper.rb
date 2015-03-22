module ApplicationHelper

	# def flash_class(type)
	# 	case type
	# 	when :alert
	# 		"alert-danger" 
	# 	when :notice
	# 		"alert-success" 
	# 	else
	# 		""
	# 	end
	# end

	def current_user_nav
		case current_user.role 
    when 'agent'
         'sessions/agents_nav'
    when 'admin'
         'sessions/admins_nav' 
    end  
       
  end

end
