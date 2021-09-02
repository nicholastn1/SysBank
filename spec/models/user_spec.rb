require 'rails_helper'

RSpec.describe User, type: :model do

  it "will be created" do
    email = FFaker::Internet.email
    password = 123456
    password_confirmation = 123456
    user = User.create!( email: email, password: password, password_confirmation: password_confirmation )
    expect(user).to be_valid
  end

  it "will don't be created if you enter with a invalid email" do
    user = User.create( email: 'user', password: 123456, password_confirmation: 123456 )
    user.valid?
    expect(user).not_to be_valid
  end

  it "will don't be created if password has lowest than 6 characters" do
    user = User.create!( email: 'user@user.com', password: 12345, password_confirmation: 12345 ).to_not be_valid
  end

end
