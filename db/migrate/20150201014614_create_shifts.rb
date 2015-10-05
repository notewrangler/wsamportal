class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|    	
      t.integer :job_id
      t.date :shift_date
      t.integer :hours
      t.integer :available_agents
      

      t.timestamps
    end
  end
end
