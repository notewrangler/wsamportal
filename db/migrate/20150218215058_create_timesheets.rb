class CreateTimesheets < ActiveRecord::Migration
  def change
    create_table :timesheets do |t|
    t.integer  :agent_id
    t.integer  :shook_id
    t.date     :date 
    t.string   :state    
    t.time     :time_in
    t.time     :time_out
    t.integer  :break_minutes
    t.decimal  :total_hrs,     precision: 3, scale: 1    
    t.integer  :miles
    t.decimal  :drive_time,    precision: 3, scale: 1
    t.decimal  :expenses,      precision: 5, scale: 2
    t.text     :comments
    t.string   :contact    
    t.boolean  :team_lead_ok
    t.text     :team_lead_note
    t.boolean  :approved


    t.timestamps
    end
  end
end
