FactoryBot.define do
  factory :account do
    number { FFaker::Random.rand(1000...9999) }
    limit { FFaker::Random.rand(1000...5000) }
    agency_id {  }
    user {  }
  end
end