class Agent < User;

	has_many :jhooks
	has_many :jobs, :through => :jhooks
	has_many :shooks
	has_many :shifts, :through => :shooks
	has_many :timesheets
	has_many :timesheets, :through => :shooks

	scope :profile, -> { includes(:address, :city, :state, :zip, :phone, :email)}

	def handle
    self.first_name + " " + self.last_name
  end

  def alpha_handle
  	self.last_name + ", " + self.first_name
  end

  def duties
  	self.jhooks.where(team_lead: true).pluck(:job_id)
  end
    
end
