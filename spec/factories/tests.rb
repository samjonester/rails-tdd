require 'faker'

FactoryGirl.define do
  factory :test do
		description Faker::Lorem.paragraph
    passing true
    creator Faker::Name.name
  end

end
