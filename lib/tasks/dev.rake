namespace :dev do

  task :fake => :environment do

    1.upto(10).each do
      User.create!( :email => Faker::Internet.email, :password => "12345678" )
    end

    categories = Category.all
    users = User.all

    1.upto(50).each do

      t = Topic.create!( :title => Faker::Lorem.sentence, :content => Faker::Lorem.paragraph, :user => users.sample )

      0.upto( rand(20) ).each do
        t.comments.create!( :content => Faker::Lorem.paragraph, :user => users.sample )
      end

      Categoryship.create!( :topic => t, :category => categories.sample )
    end

  end

end


