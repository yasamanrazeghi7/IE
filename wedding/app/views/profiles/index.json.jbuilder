json.array!(@profiles) do |profile|
  json.extract! profile, :id, :brideName, :groomName, :userName, :photo, :ceremonyDate, :aboutUs
  json.url profile_url(profile, format: :json)
end
