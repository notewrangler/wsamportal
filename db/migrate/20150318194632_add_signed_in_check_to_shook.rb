class AddSignedInCheckToShook < ActiveRecord::Migration
  def change
  	add_column :shooks, :signed_in, :boolean
  end
end
