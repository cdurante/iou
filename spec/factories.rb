FactoryGirl.define do
 factory :user do
   name	"Jake Hilborn"
   email "name@domain.com"
   password "passwd"
   password_confirmation "passwd"
   admin "TRUE"
 end
end