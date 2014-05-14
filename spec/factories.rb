FactoryGirl.define do
 factory :user do
   sequence(:name)  { |n| "Person #{n}" }
   sequence(:email) { |n| "person_#{n}@example.com"}
   password "foobar"
   password_confirmation "foobar"
   admin "TRUE"
 end

 #factory :user do
 #  name	"User 2"
 #  email "user2@domain.com"
 #  password "passwd"
 #  password_confirmation "passwd"
 #end

 factory :transaction do
    name "Lorem ipsum"
    amount "5"
    debtor_id "2"
    description "FactoryGirl description of transaction"
    user
  end
end