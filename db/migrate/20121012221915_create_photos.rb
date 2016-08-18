class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :site_id
      t.date    :taken_on
      t.string  :owner
      t.string  :provider
      t.integer :uploader
      t.float   :latitude
      t.float   :longitude

      t.timestamps
    end
    add_index :photos, :site_id
    add_index :photos, [:site_id, :taken_on]
    add_index :photos, [:uploader, :created_at]
  end
end
