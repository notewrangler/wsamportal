class Job < ActiveRecord::Base
	
	has_many :shifts, dependent: :destroy
	has_many :jhooks, dependent: :destroy
	has_many :agents, :through => :jhooks
	
	validates	:project, presence: true
	validates	:store_num, presence: true
	validates	:store_name, presence: true
	validates	:address, presence: true
	validates :city, presence: true
	validates :state, presence: true	
	validates	:start_date, presence: true


	
	before_save :build_job_num

	after_create :splay	 

	# state_machine :state, :initial => :active do

	# 	event :report do
	# 		transition :active => :reported
	# 	end

	# 	event :complete do
	# 		transition :reported => :completed 
	# 	end
	# end


	def build_job_num
		d = self.start_date.to_s
		dcode = d.slice(2,2) + d.slice(5,2) + d.slice(8,2)
		scode = self.store_name.slice(0,2).upcase
		self.job_num = scode + self.store_num + dcode
	end
			
	def splay
			@now_date = self.start_date			 	
			 	def add_shift
			 		Shift.create(job_id: self.id, shift_date: @now_date, hours: self.sched_hrs )
			 	end 
	 	while @now_date <= self.end_date do
	 		if !@now_date.saturday? && !@now_date.sunday? 
	 			add_shift
	 		end

	 		if @now_date.saturday? && self.sat? 
	 		 add_shift
	 		end 

	 		if @now_date.sunday? && self.sun? 
	 		 add_shift
	 		end 

	 		@now_date += 1

	 	end
			 	
	end	
	
	def formatted_time
   return "" if time.blank?
    time.strftime("%I:%M%p")
  end

  def formatted_start_date
    return "" if start_date.blank?
    start_date.strftime("%m/%d/%y")
  end

  def formatted_end_date
    return "" if end_date.blank?
    end_date.strftime("%m/%d/%y")
  end

  def formatted_sat
  	if sat?  
  		"Yes"
  	else
  		"-"
  	end
  end

  def formatted_sun
  	if sun?  
  		"Yes"
  	else
  		"-"
  	end
  end

  def team_lead
  	j = self.jhooks.where(team_lead: true)
  	if j.exists?
	  	@jhook = Jhook.find(j)
	  	return @jhook.agent
  	end
  end

  def crew
  	c = self.jhooks.assigned.pluck(:agent_id)
  	@crew = Agent.find(c)
  end

  

end

