namespace :dev do

  task :fake => :environment do

    categories = Category.all

    1.upto(50).each do

      t = Topic.create!( :title => Faker::Lorem.sentence, :content => Faker::Lorem.paragraph )

      0.upto( rand(20) ).each do
        t.comments.create!( :content => Faker::Lorem.paragraph )
      end

      Categoryship.create!( :topic => t, :category => categories.sample )
    end

  end

end


