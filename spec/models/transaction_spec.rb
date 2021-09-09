require 'rails_helper'

RSpec.describe Transaction, type: :model do

  it "will be created an deposit" do
    user = FactoryBot.create(:user)
    transaction = create(:transaction, amount: 500, transaction_type: 'deposit')
    expect(transaction).to be_valid
  end

  it "will be created an withdraw" do
    user = FactoryBot.create(:user)
    account = FactoryBot.create(:account, user_id: user.id, balance: 4000)
    move = FactoryBot.create(:transaction, user_id: user.id, account_id: account.id, amount: 500, transaction_type: 'deposit')
    transaction = FactoryBot.build(:transaction, account_id: account.id, amount: 200, transaction_type: 'withdraw')
    byebug
    expect(move).to be_valid
  end

end
