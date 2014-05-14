FactoryGirl.define do
 factory :user do
   name	"Jake Hilborn"
   email "name@domain.com"
   password "passwd"
   password_confirmation "passwd"
   admin "TRUE"
 end

 factory :transaction do
    name "Lorem ipsum"
    amount "5"
    debtor_id "2"
    description "FactoryGirl description of transaction"
    user
  end
end