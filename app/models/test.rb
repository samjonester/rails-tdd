class Test < ActiveRecord::Base
	validates :description, presence: true
	validates :passing, inclusion: { in: [true] }
	validates :creator, presence: true
end
