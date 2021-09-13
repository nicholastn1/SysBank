require 'rails_helper'

RSpec.describe Transaction, type: :model do

  context "deposit" do
    it "will be created" do
      user = FactoryBot.create(:user)
      transaction = create(:transaction, amount: 500, transaction_type: 'deposit')
      expect(transaction).to be_valid
    end

    it "will not be created with amount less than 0" do
      user = FactoryBot.create(:user)
      transaction = build(:transaction, amount: -500, transaction_type: 'deposit', user: user)
      expect(transaction).not_to be_valid
    end
  end

  context "withdraw" do
    it "will be created an withdraw" do
      user = FactoryBot.create(:user)
      account = FactoryBot.build(:account)
      # transaction_deposit = FactoryBot.create(:transaction, user_id: user.id, amount: 200, transaction_type: 'deposit')
      transaction = FactoryBot.build(:transaction, user_id: user.id, amount: 200, transaction_type: 'withdraw')
      byebug
      expect(transaction).to be_valid
    end
  end

end
