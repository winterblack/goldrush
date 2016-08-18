class AddVerifiedToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :verified, :boolean, default: false
  end
end
