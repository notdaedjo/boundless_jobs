json.extract! job, :id, :position, :description, :level, :skills, :created_at, :updated_at
json.url job_url(job, format: :json)
