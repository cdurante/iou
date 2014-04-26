require 'spec_helper'

  describe "UserPages" do

  subject { page }  

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    #let!(:m1) { FactoryGirl.create(:micropost, user: user, content: "Foo") }
    #let!(:m2) { FactoryGirl.create(:micropost, user: user, content: "Bar") }

    before { visit user_path(user) }

    it { should have_content(user.name) }
    #it { should have_title(user.name) }

    describe "friend/unfriend buttons" do
      let(:other_user) { FactoryGirl.create(:user) }
      before { sign_in user }

      describe "friending a user" do
        before { visit user_path(other_user) }

        it "should increment the user's friends count" do
          expect do
            click_button "Add friend"
          end.to change(user.friends, :count).by(1)
        end

        it "should increment the other user's friends count" do
          expect do
            click_button "Add friend"
          end.to change(other_user.friends, :count).by(1)
        end

        describe "toggling the button" do
          before { click_button "Add friend" }
          it { should have_xpath("//input[@value='Unfriend']") }
        end
      end

      describe "unfriending a user" do
        before do
          user.friend!(other_user)
          visit user_path(other_user)
        end

        it "should decrement the friends user count" do
          expect do
            click_button "Unfriend"
          end.to change(user.friends, :count).by(-1)
        end

        it "should decrement the other user's friends count" do
          expect do
            click_button "Unfriend"
          end.to change(other_user.friends, :count).by(-1)
        end

        describe "toggling the button" do
          before { click_button "Unfriend" }
          it { should have_xpath("//input[@value='Add friend']") }
        end
      end
    end
  end
end