class AddSignInTimeToShooks < ActiveRecord::Migration
  def change
  	add_column :shooks, :sign_in_time, :datetime
  end
end
