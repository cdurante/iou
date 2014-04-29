FactoryGirl.define do
 factory :user do
   name	"Jake Hilborn"
   email "name@domain.com"
   password "passwd"
   password_confirmation "passwd"
 end
 factory :other_user do
   name	"Foo bar"
   email "for@bar.com"
   password "passwd"
   password_confirmation "passwd"
 end
end