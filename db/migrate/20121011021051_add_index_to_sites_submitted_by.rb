class AddIndexToSitesSubmittedBy < ActiveRecord::Migration
  def change
  	add_index :sites, :submitted_by
  end
end
