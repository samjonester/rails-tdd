json.array!(@tests) do |test|
  json.extract! test, :id, :description, :passing, :creator
  json.url test_url(test, format: :json)
end
