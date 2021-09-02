FactoryBot.define do
  factory :agency do
    number { FFaker::AddressBR.building_number }
    address { FFaker::AddressBR.street }
  end
end