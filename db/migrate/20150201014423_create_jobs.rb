class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
    	t.string :job_num
      t.string :project
      t.string :store_num
      t.string :store_name
      t.string :address
      t.string :city
      t.string :state, limit: 2
      t.string :zip, limit: 10
      t.string :phone, limit: 15
      t.date :start_date
      t.date :end_date
      t.boolean :sat, :default => false
      t.boolean :sun, :default => false
      t.time :time
      t.string :timezone
      t.integer :sched_hrs
      t.integer :manpower
      
      t.timestamps null: false
    end
  end
end
