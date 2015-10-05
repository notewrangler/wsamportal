class CreateShooks < ActiveRecord::Migration
  def change
    create_table :shooks do |t|
    	t.integer :shift_id
    	t.integer :agent_id
        t.integer :jhook_id
        t.date    :date
        t.string  :state         

    	t.timestamps
    end
  end
end
