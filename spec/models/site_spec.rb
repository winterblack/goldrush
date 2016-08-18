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

require 'spec_helper'

describe Site do
	before { @site = Site.new(name: "Example Site", tag: "Example Tag", 
														description: "This is a description of a site",
														latitude: 25, longitude: 132, submitted_by: 1, edited_by: 2) }

	subject { @site }

	it { should respond_to(:name) }
	it { should respond_to(:tag) }
	it { should respond_to(:description) }
	it { should respond_to(:latitude) }
	it { should respond_to(:longitude) }
	it { should respond_to(:submitted_by) }
	it { should respond_to(:edited_by) }

	it { should be_valid }

# Specs for name
	describe "when name is not present" do
		before { @site.name = " " }
		it { should_not be_valid }
	end

	describe "when name is too long" do
		before { @site.name = "a" * 61 }
		it { should_not be_valid }
	end

	describe "when name is already taken" do
		before do
			site_with_same_name = @site.dup
			site_with_same_name.name = @site.name.upcase
			site_with_same_name.save
		end
		it { should_not be_valid }
	end

# Specs for tag
	describe "when tag is not present" do
		before { @site.tag = " " }
		it { should_not be_valid }
	end

	describe "when tag is too long" do
		before { @site.tag = "a" * 26 }
		it { should_not be_valid }
	end

# Specs for description

# Specs for latitude

# Specs for longitude 

# Specs for submitted_by
	
# Specs for edited_by

end
