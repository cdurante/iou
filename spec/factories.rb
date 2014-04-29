FactoryGirl.define do
 factory :user do
   name	"Jake Hilborn"
   email "name@domain.com"
   password "passwd"
   password_confirmation "passwd"
   admin "TRUE"
 end
 factory :user2 do
   name	"Foo bar"
   email "for@bar.com"
   password "passwd"
   password_confirmation "passwd"
 end
end