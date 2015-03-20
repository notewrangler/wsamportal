class RemoveWageRateFromShooksAndTimesheets < ActiveRecord::Migration
  def change
  	remove_column :shooks, :wage_rate, :decimal
  	remove_column :timesheets, :wage_rate, :decimal
  end
end
