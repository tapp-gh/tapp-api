require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :email }
  it { should validate_presence_of :name }
  it { should validate_presence_of :date_of_birth }
  it { should validate_uniqueness_of :email }
  it { should validate_presence_of :password }

  it "should be active when created" do
    user = create(:user)
    expect(user.is_active).to eq(true)
  end

  describe "#active" do
    it "should return active users in alphabetical order" do
      user1 = create(:user, first_name: "named", last_name: "user")
      user2 = create(:user, first_name: "admin", last_name: "one")
      expect(User.active).to eq([user2, user1])
    end

    it "should not return inactive users" do
      active_user = create(:user)
      inactive_user = create(:user)
      inactive_user.update(is_active: false)
      expect(User.active).to eq([active_user])
    end
  end

  describe "#delete" do
    it "should delete user" do
      user = create(:user)
      user.delete
      expect(user.is_active).to eq(false)
    end
  end
end
