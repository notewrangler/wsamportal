module UsersHelper

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
