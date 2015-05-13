json.array!(@admin_customers) do |admin_customer|
  json.extract! admin_customer, :id, :name, :mdn, :emsi, :imei
  json.url admin_customer_url(admin_customer, format: :json)
end
