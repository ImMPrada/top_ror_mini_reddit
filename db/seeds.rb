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

def build_a_quote
  [
    Faker::Quotes::Shakespeare.hamlet_quote,
    Faker::Quotes::Shakespeare.as_you_like_it_quote,
    Faker::Quotes::Shakespeare.king_richard_iii_quote,
    Faker::Quotes::Shakespeare.romeo_and_juliet_quote
  ].sample
end

def build_a_comment
  [
    Faker::Quote.famous_last_words,
    Faker::Quote.jack_handey,
    Faker::Quote.matz,
    Faker::Quote.most_interesting_man_in_the_world,
    Faker::Quote.robin,
    Faker::Quote.singular_siegler,
    Faker::Quote.yoda
  ].sample
end

def create_posts
  puts 'creating posts...'

  5.times do
    profile = Profile.all.sample

    puts "creating a post by #{profile.username}"

    post = Post.create(
      content: build_a_quote,
      profile:
    )

    puts "post #{post.id} created!"
  end

  puts 'posts created!'
end

def create_comments
  puts 'creating comments...'

  30.times do
    profile = Profile.all.sample
    post = Post.all.sample

    puts "creating a comment by #{profile.username}"
    puts "on post #{post.id} from: #{post.profile.username}"

    comment = Comment.create(
      content: build_a_comment,
      profile:,
      post:
    )

    puts "comment #{comment.id} created!"
  end

  puts 'comments created!'
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
    puts "profile #{profile.id} created!"
  end

  puts 'users created!'
end

puts 'WANT TO MAKE 5 RANDOM POSTS FROM RANDOM USERS?(yY/nN)'
more_posts = gets.chomp

if more_posts.downcase == 'y' || Post.all.empty?
  create_posts
  create_comments
end
