require 'faker'

def create_wikis(n)
  wikis = []
  n.times do 
    wikis << Wiki.create(
      title: Faker::Lorem.words(rand(1..10)).join(" "),
      body: Faker::Lorem.paragraph(rand(1..4))
      )
  end
  wikis
end

def create_articles(wiki, n)
  articles = []
  n.times do 
    articles << wiki.articles.create(title: Faker::Lorem.words(rand(1..10)).join(" "),
                                     body: Faker::Lorem.paragraphs(rand(1..4)))
  end
  articles
end

def create_comments(article, n)
  comments = []
  n.times do
    comments << article.comments.create(body: Faker::Lorem.paragraph(rand(2..8)))
  end
  comments
end


wikis = create_wikis(15)
wikis.each do |wiki|
  articles = create_articles(wiki, 15)
  articles.each do |article|
    create_comments(article, 15)
  end
end

u = User.new(
  name: 'Faker::Lorem',
  email: 'example@example.comments',
  password: 'helloworld',
  password_confirmation: 'helloworld')
u.skip_confirmation!
u.save
u.update_attribute(:role, 'user')

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Article.count} articles created"
puts "#{Comment.count} comments created"


