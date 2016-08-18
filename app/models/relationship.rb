# == Schema Information
#
# Table name: relationships
#
#  id         :integer          not null, primary key
#  parent_id  :integer
#  child_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Relationship < ActiveRecord::Base
  attr_accessible :child_id, :parent_id

  belongs_to :parent, class_name: "Site"
  belongs_to :child,  class_name: "Site"

  validates :parent_id, presence: true
  validates :child_id,  presence: true, uniqueness: true
end
