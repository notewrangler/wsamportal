class Shift < ActiveRecord::Base

	belongs_to :job 

	has_many :shooks, dependent: :destroy	
	has_many :agents, :through => :shooks

	scope :active, -> { where("shift_date >= ?", Date.today) }

	def formatted_time
    return "" if time.blank?
    time.in_time_zone.strftime("%I:%M%p")
  end
		

end
