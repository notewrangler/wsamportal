class Timesheet < ActiveRecord::Base

	belongs_to :agent
	belongs_to :shook

	validates :time_in, :time_out, :break_minutes, :total_hrs, :contact, presence: true
	validates :break_minutes, :total_hrs, numericality: true

  before_save :check_state
 


  scope :submitted, -> { with_state(:submitted)}
  scope :okayed, -> { with_state(:okayed)}
  scope :admin_approved, -> { with_state(:admin_approved) }
  scope :rejected, -> { with_state(:rejected) }

  state_machine :state, :initial => :submitted do

    event :okay do 
      transition :submitted => :okayed
    end

    event :admin_approve do
      transition :okayed => :admin_approved
    end

    event :reject do
      transition :submitted => :rejected
    end

  end

  def check_state          
    if self.submitted? && self.team_lead_ok?
      self.okay!   
    elsif 
      self.okayed? && self.approved?
      self.admin_approve!   
      self.shook.complete!   
    end
  end

    def week_beginning
      @date_code = self.date.wday - 1
      @beginning_date = self.date - @date_code        
      return @beginning_date.strftime("%a %b %d %Y")
      end
  

    def week_ending
      @date_code = 7 - self.date.wday
      @ending_date = self.date + @date_code
       return @ending_date.strftime("%a %b %d %Y")
     end


	def formatted_time_in
   return "" if time_in.blank?
    time_in.strftime("%I:%M%p")
  end

  def formatted_time_out
   return "" if time_out.blank?
    time_out.strftime("%I:%M%p")
  end

  def formatted_date
    return "" if date.blank?
    date.strftime("%m/%d/%y")
  end

  def formatted_report_time
  	return "" if created_at.blank?
  	created_at.in_time_zone('US/Pacific').strftime('%a, %b %-d, %I:%M %p')
  end

  def team_lead_ok_chk
  	case team_lead_ok
  	when true
  		"OK"
  	when false
  		"no"
  	else
  		"--"
  	end
  end

  def computed_wages
    self.shook.jhook.wage_rate * self.total_hrs
  end

end
