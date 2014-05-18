json.array!(@schedulers) do |scheduler|
  json.extract! scheduler, :id
  json.url scheduler_url(scheduler, format: :json)
end
