# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def build_email(user_name)
  "#{user_name.downcase.split(' ').join}@mail.com"
end

def build_username(nickname)
  nickname.downcase.split(' ').join
end

puts 'WANT TO ADD 10 MORE USERS?(yY/nN)'
more_users = gets.chomp

if more_users.downcase == 'y' || User.all.empty?
  puts 'creating users...'

  10.times do
    name = Faker::Name.name
    email = build_email(name)
    username = build_username(name)

    next if User.find_by(email:) || name.size < 3 || name.size > 20 

    user = User.create(email:)

    profile = Profile.create(
      username:,
      user:
    )

    puts "user #{user.id} created!"
    puts "profile #{profile.id} profile created!"
  end

  puts 'users created!'
end
