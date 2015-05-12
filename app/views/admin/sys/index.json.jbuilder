json.array!(@admin_subscribers) do |admin_subscriber|
  json.extract! admin_subscriber, :id, :name, :mdn, :emsi, :imei
  json.url admin_subscriber_url(admin_subscriber, format: :json)
end
