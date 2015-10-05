class User < ActiveRecord::Base

	has_secure_password
	
   
  scope :office_use, -> { includes(:username, :role, :last_name, :first_name, :password_digest, :type)}
  
  
  def handle
  	 self.first_name + " " + self.last_name
  end

  def admin?
       self.role == "admin" ? true : false
  end

  def agent?
      self.role == "agent" ? true : false
  end
  
  

	
end
