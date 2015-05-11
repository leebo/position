json.array!(@busers) do |buser|
  json.extract! buser, :id, :name
  json.url buser_url(buser, format: :json)
end
