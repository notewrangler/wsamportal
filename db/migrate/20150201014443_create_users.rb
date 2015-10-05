class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :username
      t.string :role, null: false,  default: "agent"
      t.string :type, null: false,  default: "Agent"
      t.string :password_digest
      t.string :last_name
      t.string :first_name
      t.string :address
      t.string :city
      t.string :state, limit: 2
      t.string :zip, limit: 10
      t.string :phone, limit: 15
      t.string :email, limit: 50
      
      t.timestamps null: false
    end
  end
end
