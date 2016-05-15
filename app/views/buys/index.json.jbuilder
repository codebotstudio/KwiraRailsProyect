json.array!(@buys) do |buy|
  json.extract! buy, :id, :user_id, :items, :notes
  json.url buy_url(buy, format: :json)
end
