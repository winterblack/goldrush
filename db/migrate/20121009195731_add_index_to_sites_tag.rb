class AddIndexToSitesTag < ActiveRecord::Migration
  def change
  	add_index :sites, :tag
  end
end
