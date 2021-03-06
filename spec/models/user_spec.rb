require 'spec_helper'

describe User do
  before do
	 @user=User.new(name: "Example User", email: "user@example.com",password: "foobar" , password_confirmation: "foobar")
  end  
  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:friends) }
  it { should respond_to(:transactions) }

  describe "when name is not present" do
    before { @user.name = nil }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = nil }
    it { should_not be_valid }
  end

  describe "when password_confirmation is not present" do
    before { @user.password_confirmation = nil }
    it { should_not be_valid }
  end
end
