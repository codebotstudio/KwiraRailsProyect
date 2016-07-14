json.array!(@returns) do |return|
  json.extract! return, :id, :user_id, :reason, :sale_id, :money_returned
  json.url return_url(return, format: :json)
end
