FactoryBot.define do
  factory :transaction do
    transaction_type { FFaker::Random.rand(0...3) }
    user_id { FactoryBot.create(:user).id }
    account_id { FactoryBot.create(:account).id }
    # account_destiny_id { FactoryBot.create(:account_destiny_id).id }
    amount { FFaker::Random.rand(10...500) }
    date { FFaker::Time.date }
  end
end
