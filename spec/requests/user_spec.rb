require 'rails_helper'

RSpec.describe User, type: :model do

  describe "GET /users" do
    it "returns success status" do
      get root_path
      expect(reponse).to have_http_status(200)
    end
    it "the user email is present" do
    end
  end

  describe "POST /users" do
    context "when it has valid parameters" do
      it "creates the user with correct attributes" do
      end
    end
    context "when it has no valid parameters" do
      it "does not create user" do
      end
    end
  end

end