FactoryGirl.define do 
	factory :user do
		sequence(:name)  { |n| "Person #{n}" }
		sequence(:email) { |n| "person_#{n}@example.com" }
		password "foobar"
		password_confirmation "foobar"
		factory :admin do
			admin true
		end
	end

	factory :site do
		sequence(:name) { |n| "Site #{n}" }
		tag "Some Tag"
		description "This is a description of a site."
		latitude 37.8188
		longitude 122.4784
	end
end