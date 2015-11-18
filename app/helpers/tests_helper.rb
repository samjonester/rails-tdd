module TestsHelper
	def most_valuable_tester
		puts Test.all.map { |test| "#{test.creator}:#{test.id}"}.join(", ")
		Test.group(:creator).order('count(tests.id) desc').limit(1).first.creator
	end
end
