class CreateJhooks < ActiveRecord::Migration
  def change
    create_table :jhooks do |t|
    	t.integer :job_id
    	t.integer :agent_id
    	t.string :state
    	t.text   :comment
    	t.boolean :team_lead
        t.decimal :wage_rate

    	t.timestamps 

    end
  end
end
