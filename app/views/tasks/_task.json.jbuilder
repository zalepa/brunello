json.extract! task, :id, :user_id, :description, :scheduled_on, :block_id, :created_at, :updated_at
json.url task_url(task, format: :json)
