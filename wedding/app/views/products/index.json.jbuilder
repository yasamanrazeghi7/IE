json.array!(@products) do |product|
  json.extract! product, :id, :description, :photo_album
  json.url product_url(product, format: :json)
end
