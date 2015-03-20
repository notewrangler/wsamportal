class Shook < ActiveRecord::Base

belongs_to :agent 
belongs_to :shift
belongs_to :jhook
has_one :timesheet
 
	

	scope :unavailable, -> { with_state(:unavailable) }
	scope :opted, -> { with_state(:opted) }
	scope :assigned, -> { with_state(:assigned) }
	scope :removed, -> { with_state(:removed)}
	scope :signed_in, -> { where(signed_in: true)}
	scope :reported, -> { with_state(:reported) }
	scope :completed, -> { with_state(:completed) }
	scope :dissaproved, -> { with_state(:dissaproved)}

		state_machine :state, :initial => :open do

			event :decline do 
				transition :open => :unavailable
			end

			event :opt do 
				transition :open => :opted
			end	

			event :uncheck do
				transition :opted => :unavailable
			end

			event :assign do
				transition :opted => :assigned		
			end

			event :report do
				transition :assigned => :reported
			end

			event :complete do
				transition :reported => :completed
			end

			event :remove do
				transition :assigned => :removed
			end

			event :disapprove do
				transition :reported => :disapproved
			end
		end

	def formatted_sign_in
		return "" if sign_in_time.blank?
			sign_in_time.strftime("%I:%M %p %Z")
	end	

	def formatted_date
    return "" if date.blank?
    date.strftime("%m/%d/%y")
  end

  def ts_formatted_date
    return "" if date.blank?
  	strftime("%^a %m/%d/%y")
  end

  

  


		# def map_feed
		# 	"https://www.google.com/maps/place/" + self.shift.job.address.gsub(/ /, '+') + ',' + self.shift.job.city.gsub(/ /, '+') + ',' + self.shift.job.state + '+' + self.shift.job.zip
		# end

	
end