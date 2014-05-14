require 'spec_helper'

describe "Transactions" do
  @user1=User.new(name: "User1Name", email: "user1@example.com", password: "foobar" , password_confirmation: "foobar")
  @Transaction1=Transaction.new(name: "Transaction1", amount: "5", debtor_id: "2", description: "This is a description for transactions")
  describe "valid transactions" do
  end
end
