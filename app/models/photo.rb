# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  site_id    :integer
#  taken_on   :date
#  owner      :string(255)
#  provider   :string(255)
#  uploader   :integer
#  latitude   :float
#  longitude  :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image      :string(255)
#  verified   :boolean          default(FALSE)
#

class Photo < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :owner, :provider, :uploader, :image, :site_id, :taken_on, :verified
  belongs_to :site
  mount_uploader :image, ImageUploader

  validates :site_id, presence: true
  validates :image, presence: true
  default_scope order: 'photos.created_at DESC'
end
