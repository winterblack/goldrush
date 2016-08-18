class AddIndexToSitesEditedBy < ActiveRecord::Migration
  def change
  	add_index :sites, :edited_by
  end
end
