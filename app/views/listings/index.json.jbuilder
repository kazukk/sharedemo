json.array!(@listings) do |listing|
  json.extract! listing, :id, :name, :description, :price, :availability
  json.url listing_url(listing, format: :json)
end
