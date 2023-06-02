# frozen_string_literal: true

json.extract! worker, :id, :name, :group_id, :created_at, :updated_at
json.url worker_url(worker, format: :json)
