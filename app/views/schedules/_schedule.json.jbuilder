json.extract! schedule, :id, :week_days, :hour, :location_id, :created_at, :updated_at
json.url schedule_url(schedule, format: :json)
