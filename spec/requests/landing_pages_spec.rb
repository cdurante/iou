require 'spec_helper'

describe "LandingPage" do

 subject { page }

  describe "Going to landing page" do
    before { visit root_path }
      it { should have_title('IOU') }
      it { should have_content('Jake Hilborn') }
      it { should have_content('Alyssa Morrow') }
      it { should have_content('Caleb Durante') }
      it { should have_selector('h2', text: "Get Paid.") }
  end

  describe "signup" do

    before { visit root_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        it "should create a user" do
          expect { click_button submit }.to change(User, :count).by(1)
        end
      end
    end
  end

  describe "signin" do
   before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_title('Sign in') }
      it { should have_error_message('Invalid') }
    end

    describe "signin page" do
      before { visit signin_path }
        describe "with invalid information" do
          let(:user) { FactoryGirl.create(:user) }
            before { sign_in user }
              describe "successful login" do
                it {should have_successful_login(user) }
                it {should_not have_link('Sign in', href: signin_path)} 
              end
            
            describe "followed by signout" do
              before { click_link "Sign out" }
              it { should have_signout('Sign in') }
            end
      end # end with invalid information
    end # end signin page
  end #end sign in
end
