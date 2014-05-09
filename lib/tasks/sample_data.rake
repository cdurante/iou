namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                 email: "myfakeemail@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)

    User.create!(name: "Example User",
                 email: "Adminexample@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")

     50.times do |n|
      name  = Faker::Name.name
      email = "Nexample-#{n+1}@railstutorial.org"
      password  = "password"
      user1 = User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)

      name  = Faker::Name.name
      email = "Pexample-#{n+1}@railstutorial.org"
      password  = "password"
      user2 = User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)


      r = Random.new
      tname = Faker::Lorem.word
      amount = r.rand(10...42)
      debtor = user2.id
      Transaction.create!(name: tname,
		   user_id: user1.id,
                   amount: amount,
                   debtor_id: debtor)


    end



  end
end
