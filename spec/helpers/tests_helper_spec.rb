require 'rails_helper'

RSpec.describe TestsHelper, type: :helper do
	it "should find the most active tester" do
		most_valuable_tester = Faker::Name.name

		4.times { create(:test, creator: Faker::Name.name) }
		4.times { create(:test, creator: most_valuable_tester) }

		expect(helper.most_valuable_tester).to eq(most_valuable_tester)
	end
end
