require 'spec_helper'

  describe "UserPages" do

  subject { page }  

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    #@user=User.new(name: "User1Name", email: "user1@example.com", password: "foobar" , password_confirmation: "foobar")
    @user2=User.new(name: "User2Name", email: "user2@example.com", password: "foobar" , password_confirmation: "foobar")
    #let(:user2) { FactoryGirl.create(:user2, :class => 'User') }
    #let!(:m1) { FactoryGirl.create(:micropost, user: @user, content: "Foo") }
    #let!(:m2) { FactoryGirl.create(:micropost, user: @user2, content: "Bar") }

    before { visit user_path(user) }

    it { should have_content(user.name) }
    #it { should have_title(user.name) }

    describe "friend/unfriend buttons" do
      #let(:other_user) { FactoryGirl.create(:other_user) }
      
      before { sign_in user }

      #describe "friending a user" do
      #  before { visit user_path(user2) }

      #  it "should add the user to the page" do
      #    expect do
      #      click_button "Add friend"
      #    end.to have_content(user.name)
      #  end

      #  it "should increment the user's friends count" do
      #    expect do
      #      click_button "Add friend"
      #    end.to change(user.friends, :count).by(1)
      #  end

      #  it "should increment the other user's friends count" do
      #    expect do
      #      click_button "Add friend"
      #    end.to change(other_user.friendships, :count).by(1)
      #  end
      #end
    end
  end
end