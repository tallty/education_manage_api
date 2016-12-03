json.array!(@admin_signs) do |admin_sign|
  json.extract! admin_sign, :id
  json.url admin_sign_url(admin_sign, format: :json)
end
