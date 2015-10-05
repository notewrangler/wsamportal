class Ability
  include CanCan::Ability
  
  # def initialize(user)
  #   user = @current_user
    
  #   if user.role == "admin"
  #     can :manage,:all 
  #   else 
  #     can :read, Agents, :user_id => user.id
  #     can :update, , Agent.profile, :user_id => user.id
  #     cannot :update, User, User.office_use
  #     can :read, Jobs
  #     can :read, Shifts
  #     can :update, Jhooks, :state => open, :user_id => user.id
  #     can :update, Shooks, :state => open, :user_id => user.id

  #   end
  # end
end
