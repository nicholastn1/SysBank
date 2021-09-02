require 'rails_helper'

RSpec.describe Account, type: :model do

  it "will be created" do
    account = build(:account)
    expect(account).to be_valid
  end

end
