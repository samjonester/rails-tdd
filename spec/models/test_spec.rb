require 'rails_helper'

RSpec.describe Test, type: :model do
  it 'should have a valid factory' do
		expect(build(:test)).to be_valid
	end

	context 'validation' do
    it 'should require a description' do
			expect(build(:test, description: '')).to_not be_valid
		end

		it 'should be passing' do
			expect(build(:test, passing: false)).to_not be_valid
		end

		it 'should reqire a creator' do
			expect(build(:test, creator: '')).to_not be_valid
		end
	end
end
