json.array!(@sales) do |sale|
  json.extract! sale, :id, :user_id, :total_price, :items, :pending
  json.url sale_url(sale, format: :json)
end
