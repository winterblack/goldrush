class AddIndexToSitesName < ActiveRecord::Migration
  def change
  	add_index :sites, :name, unique: true
  end
end
