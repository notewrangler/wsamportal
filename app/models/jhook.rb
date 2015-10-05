class Jhook < ActiveRecord::Base
	
	
	belongs_to :job
	belongs_to :agent
	has_many :shooks, dependent: :destroy

	# validate :date_cannot_already_be_assigned, only: [:manual_assignment]
	# validate :dates_cannot_already_be_assigned, only: [:assign]
	validates :state, presence: true


	scope :open, -> { with_state(:open)}
	scope :unavailable, -> { with_state(:unavailable) }
	scope :all_in, -> { with_state(:all_in) }
	scope :selected_shifts, -> { with_state(:selected_shifts) }
	scope :partial, -> { with_state(:partial)}
	scope :assigned, -> { with_state(:assigned) }
	scope :removed, -> { with_state(:removed)}
	scope :reported, -> { with_state(:reported)}
	scope :completed, -> { with_state(:completed)}
	scope :nopay, -> { where wage_rate: nil}
	scope :team_lead, -> { where team_lead: true}
		
		state_machine :state, :initial => :open do

			event :decline do 
				transition :open => :unavailable
			end

			event :all do 
				transition :open => :all_in
			end	

			event :selected_shifts do
				transition :open => :selected_shifts
			end

			event :partial_assign do
				transition :selected_shifts => :partial
			end

			event :assign do
				transition :all_in => :assigned
			end

			event :partial_report do
				transition :partial => :reported
			end

			event :report do
				transition :assigned => :reported
			end	

			event :complete do
				transition :reported => :completed
			end

			event :my_bad do
				transition :all_in => :unavailable
			end
			
			event :remove do
			 	transition :assigned => :removed
			 end
			
		end

		def wage_rate_in_dollars
			wage_rate_in_cents.to_d / 100 if wage_rate_in_cents
		end

		def wage_rate_in_dollars=(dollars)
			self.wage_rate_in_cents = dollars.to_d * 100 if dollars.present?
		end

# def date_cannot_already_be_assigned
# 	require 'set'
# 	@agent = self.agent
# 	@shifts = self.job.shifts.all
# 	if self.shooks.any?
# 		@shooks = Shook.all.where("agent_id = ? and state = ?", @agent.id, 'assigned')
# 		a = Set.new
# 		@shifts.each do |shift|
# 			a.add(shift.shift_date)
# 		end
# 		b = Set.new
# 		@shooks.each do |shook|
# 			b.add(shook.date)
# 		end
# 		if !a.intersection(b).empty? 		
# 			errors.add(@agent.handle  "is already assigned to another job on one or more of these dates")
# 		end
# 	end	
# end

# def dates_cannot_already_be_assigned
# 	@jhooks = Jhook.find(params[:ids])
# 		@jhook.each do |jhook|
# 			require 'set'
# 			@agent = jhook.agent
# 			@shifts = jhook.job.shifts.all
# 			@shooks = Shook.all.where("agent_id = ? and state = ?", @agent.id, 'assigned')
# 			a = Set.new
# 			@shifts.each do |shift|
# 				a.add(shift.shift_date)
# 			end
# 			b = Set.new
# 			@shooks.each do |shook|
# 				b.add(shook.date)
# 			end
# 			if !a.intersection(b).empty? 		
# 				errors.add(@agent.handle  "is already assigned to another job on one or more of these dates")
# 			end
# 		end
# end




	# def agent
	# 	a = self.agent_id
	# 	@agent = Agent.find(a)
	# 	return @agent
	# end


end