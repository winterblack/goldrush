# == Schema Information
#
# Table name: sites
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  tag          :string(255)
#  description  :text
#  latitude     :float
#  longitude    :float
#  submitted_by :integer
#  edited_by    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Site < ActiveRecord::Base
  attr_accessible :description, :latitude, :longitude, :name, :tag, :submitted_by, :edited_by
  has_many :photos, dependent: :destroy

  validates :name, presence: true, length: { maximum: 60 }, uniqueness: { case_sensitive: false }
  validates :tag,  presence: true, length: { maximum: 25 }
  #validates :latitude,     presence: true
  #validates :longitude,    presence: true
  #validates :submitted_by, presence: true
  #validates :edited_by,    presence: true

  def to_param
  	"#{id}_#{name.gsub(/\W/, '_')}"
  end
end
