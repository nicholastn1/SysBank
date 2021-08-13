json.extract! transaction, :id, :date, :amount, :transaction_type, :account_id, :user_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
