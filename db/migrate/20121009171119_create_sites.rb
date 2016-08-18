class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string  :name
      t.string  :tag
      t.text  :description
      t.float   :latitude
      t.float   :longitude
      t.integer :submitted_by
      t.integer :edited_by

      t.timestamps
    end
  end
end
