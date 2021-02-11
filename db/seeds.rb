#require 'faker'
#User.destroy_all
#City.destroy_all
#Gossip.destroy_all
#Tag.destroy_all
#TableJoinGossipTag.destroy_all
#Comment.destroy_all

10.times do 
  City.create!(
    name:Faker::Address.city,
    zip_code:Faker::Address.zip_code
  )
end

#10.times do
#  first_name = Faker::Name.first_name
#  age = rand(18..90)
#  city = City.all.sample
#  text = "J'aime les #{Faker::Food.fruits}"
#  email = Faker::Internet.free_email(name: first_name)
#  User.create!(
#    first_name:first_name,
#    last_name:Faker::Name.last_name,
#    description:text,
#    email: email,
#    age: age,
#    city: city
#   )
#end

#20.times do 
#  Gossip.create!(
#    title:Faker::Hipster.word,
#    content:Faker::ChuckNorris.fact,
#    user: User.all.sample
#  )
#end

#10.times do 
#  Tag.create!(
#  title: Faker::Verb.base
#  )
#end

#30.times do 
#  TableJoinGossipTag.create(
#    gossip: Gossip.all.sample,
#    tag: Tag.all.sample
#  )
#end

#20.times do
#  Comment.create!(
#    content: Faker::Movies::HarryPotter.spell,
#    gossip: Gossip.all.sample,
#    user: User.all.sample
 # )

#end

#city = City.all.sample
#User.create!(first_name: "anonymous", last_name: "anonymous", description: "anonymous", email: "anonymous", age: 1, city: city )