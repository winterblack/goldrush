# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Tag do
	before { @tag = Tag.new(name: "This") }

	subject { @tag }

	it { should respond_to(:name) }

	it { should be_valid }

# Specs for name
	describe "when name is not present" do
		before { @tag.name = " " }
		it { should_not be_valid }
	end

	describe "when name is too long" do
		before { @tag.name = "a" * 26 }
		it { should_not be_valid }
	end
end
