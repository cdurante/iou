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

    describe "addfriend/unfriend buttons" do
      before do
        user1.addfriend!(user2)
        user2.addfriend!(user1)
        visit user_path(user1)
      end

    describe "follow/unfollow buttons" do

      before { sign_in user1 }

      describe "friending a user" do
        before { visit user_path(user2) }

        it "should increment the followed user count" do
          expect do
            click_button "Add Friend"
          end.to change(user2.friendships, :count).by(1)
        end

        it "should increment the other user's followers count" do
          expect do
            click_button "Follow"
          end.to change(other_user.followers, :count).by(1)
        end

        describe "toggling the button" do
          before { click_button "Follow" }
          it { should have_xpath("//input[@value='Unfollow']") }
        end
      end

      describe "unfollowing a user" do
        before do
          user.follow!(other_user)
          visit user_path(other_user)
        end

        it "should decrement the followed user count" do
          expect do
            click_button "Unfollow"
          end.to change(user.followed_users, :count).by(-1)
        end

        it "should decrement the other user's followers count" do
          expect do
            click_button "Unfollow"
          end.to change(other_user.followers, :count).by(-1)
        end

        describe "toggling the button" do
          before { click_button "Unfollow" }
          it { should have_xpath("//input[@value='Follow']") }
        end
      end
    end
      
      before { sign_in user }

      describe "friending a user" do
        #before { visit user_path(user2) }

        #it "should add the user to the page" do
        #  expect do
        #    click_button "Add friend"
        #  end.to have_content(user.name)
        #end

        #it "should increment the user's friends count" do
        #  expect do
        #    click_button "Add friend"
        #  end.to change(user.friends, :count).by(1)
        #end

        #it "should increment the other user's friends count" do
        #  expect do
        #    click_button "Add friend"
        #  end.to change(other_user.friendships, :count).by(1)
        #end
      end
    end
  end
end