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

require 'spec_helper'

describe Photo do
	let(:site) { FactoryGirl.create(:site) }
	before { @photo = site.photos.build(image: "rails.png") }

	subject { @photo }
	
	it { should respond_to :site_id}
	
	it { should be_valid }

	describe "when site_id is not present" do
		before { @photo.site_id = nil }
		it { should_not be_valid }
	end

	describe "accessible attributes" do
		it "should not allow access to site_id" do
			expect do
				Photo.new(site_id: site.id)
			end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
		end
	end
end

# Specs for owner

# Specs for provider
	#describe "when provider is not present" do
	#	before { @photo.provider = " " }
	#	it { should_not be_valid }
	#end

# Specs for uploader
	#describe "when uploader is not present" do
	#	before { @photo.uploader = " " }
	#	it { should_not be_valid }
	#end

# Specs for latitude

# Specs for longitude

# Specs for image

# Specs for verified

