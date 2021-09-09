require 'rails_helper'

RSpec.describe User, type: :model do

  it "will be created" do
    user = create(:user)
    expect(user).to be_valid
  end

  it "will don't be created if you enter with a invalid email" do
    user = create(:user, email: FFaker::LoremBR.word)
    user.valid?
    expect(user).not_to be_valid
  end

  it "will don't be created if password has lowest than 6 characters" do
    user = create(:user, password: 12345)
    user.valid?
    expect(user).not_to be_valid
  end

end
