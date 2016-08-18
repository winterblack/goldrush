require 'spec_helper'

describe "SitePages" do
  
  subject { page }

# Specs for index page
  describe "index" do
  	let(:site) { FactoryGirl.create(:site) }
  	#it { should have_selector('title', text: 'All sites') }
  	#it { should have_selector('h1', 	 text: 'All sites') }
  	describe "pagination" do
  		before(:all) { 50.times { FactoryGirl.create(:site) } }
  		after(:all)  { Site.delete_all }
      #it { should have_selector('div.pagination') }
  		#it "should list each site" do
  		#	Site.paginate(page:1).each do |site|
  		#		page.should have_selector('li', text: site.name)
  		#	end
  		#end
  	end
  end

# Specs for site page
  describe "site page" do
    let(:site) {FactoryGirl.create(:site)}
    before { visit site_path(site) }
    it { should have_selector('h1',    text: site.name) }
    it { should have_selector('title', text: site.name) }
  end

# Specs for new site page
  describe "new site page" do
    before { visit newsite_path }
    it { should have_selector('h1', text: 'New site') }
    it { should have_selector('title', text: full_title('New site')) }
  end

# Specs for new site
  describe "new site" do
    before { visit newsite_path }
    let(:submit) { "Submit new site" }
    describe "with invalid information" do
      it "should not create a site" do
        expect { click_button submit }.not_to change(Site, :count)
      end
      describe "after submission" do
        before { click_button submit }
        it { should have_selector('title', text: 'New site') }
        #it { should have_content('error') }
      end
    end
    describe "with valid information" do
      before do
        fill_in "Name", with: "Example Site"
        # NEED MORE HERE!!!
      end
      it "should create a site" do
        #expect { click_button submit }.to change(Site, :count).by(1)
      end
      describe "after saving the site" do
        before { click_button submit }
        let(:site) { Site.find_by_name('Example Site') }
        #it { should have_selector('title', text: site.name) }
        # NEED MORE HERE!!!
      end
    end
  end

# Specs for edit
  describe "edit" do
    # NEED MORE HERE!!!
  end
end
