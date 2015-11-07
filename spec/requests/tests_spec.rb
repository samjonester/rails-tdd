require 'rails_helper'

RSpec.describe "Tests", type: :request do
  describe "GET /tests" do
    it "should return tests" do
			tests = (1 + rand(10)).times.collect{ create(:test) }
			
      get tests_path, format: :json

			json = JSON.parse(response.body)
			tests.each_with_index do |test, index|
				expect(json[index]['description']).to eq(test.description)
				expect(json[index]['passing']).to eq(test.passing)
				expect(json[index]['creator']).to eq(test.creator)
			end
    end
  end

  describe 'GET /test/:id' do
		it 'should return a test' do
		  test = create(:test)

      get test_path test, format: :json

	  	json = JSON.parse(response.body)
	  	expect(json['description']).to eq(test.description)
	  	expect(json['passing']).to eq(test.passing)
	  	expect(json['creator']).to eq(test.creator)
	  end
		
		context 'invalid id' do
			before { get test_path id: 'foo42', format: :joson }
			it "should return not found when the id doesn't exist" do
				expect(JSON.parse(response.body)['error']).to_not be_empty
			end
		end
	end

	describe 'GET /tests/new' do
		it 'should return a new test' do
			get new_test_path format: :json

			json = JSON.parse(response.body)
			expect(json['description']).to_not be_present
			expect(json['passing']).to_not be_present
			expect(json['creator']).to_not be_present
		end
	end

	describe 'POST /tests' do
		it 'should create a test' do
			test_attrs = attributes_for(:test)

			post tests_path test: test_attrs, format: :json

			json = JSON.parse(response.body)
	  	expect(json['description']).to eq(test_attrs[:description])
	  	expect(json['passing']).to eq(test_attrs[:passing])
	  	expect(json['creator']).to eq(test_attrs[:creator])
	  	expect(json['id']).to be_present
		end
				
		context 'invalid attribute description' do
		  let(:test_attrs) { attributes_for(:test, description: '') }
      before { post tests_path test: test_attrs, format: :json }
			it 'should have an error for description' do 
			  expect(JSON.parse(response.body)['errors']['description']).to_not be_empty
			end
		end

		context 'invalid attribute passing' do
		  let(:test_attrs) { attributes_for(:test, passing: false) }
      before { post tests_path test: test_attrs, format: :json }
			it 'should have an error for passing' do 
			  expect(JSON.parse(response.body)['errors']['passing']).to_not be_empty
			end
		end

		context 'invalid attribute creator' do
		  let(:test_attrs) { attributes_for(:test, creator: '') }
      before { post tests_path test: test_attrs, format: :json }
			it 'should have an error for creator' do 
			  expect(JSON.parse(response.body)['errors']['creator']).to_not be_empty
			end
		end
	end
end
