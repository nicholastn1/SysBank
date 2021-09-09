FactoryBot.define do
  factory :account do
    number { FFaker::Random.rand(1000...9999) }
    limit { FFaker::Random.rand(1000...5000) }
    agency_id { FactoryBot.create(:agency).id }
    user_id { FactoryBot.create(:user).id }
    balance { FFaker::Random.rand(10000...50000) }
  end
end