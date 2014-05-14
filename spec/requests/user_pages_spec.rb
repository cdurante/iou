require 'spec_helper'

  describe "UserPages" do

  subject { page }  

  describe "profile page" do
    let(:user1) { FactoryGirl.create(:user) }
    let(:user2) { FactoryGirl.create(:user) }

    before do
      sign_in user1
      visit user_path(user1)
    end
    
    it { should have_title("IOU | " + user1.name) }
    it { should have_content(user1.name) }
  end
end