require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :email }
  it { should validate_presence_of :name }
  it { should validate_presence_of :date_of_birth }
  it { should validate_uniqueness_of :email }

  describe '.active' do
    let(:user){create(:user, is_active: true)}
    it "should be active when created" do
      expect(User.active).to include(user)
    end
    
    it "should return active users in alphabetical order" do
      another_user = create(:user, email: "team@gmail.com", name: "Team", is_active: true)
      expect(User.active.order('name')).to eq([user, another_user])
    end

    it "should return inactive users" do
      inactive_user = create(:user, email: "notactive@gmail.com", is_active: false)
      expect(User.active).not_to include(inactive_user)
    end
  end

  describe ".delete inactive user" do
    let!(:test){create(:user, email: "test@gmail.com", name: "Test", is_active: false)}
    it "deletes user when inactive" do
      expect {
        User.find_by(name: test.name).destroy
      }.to change {User.count}.from(1).to(0)
    end
  end
end
