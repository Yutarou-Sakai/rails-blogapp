# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

jon = User.create!(email: 'jon@test.com', password: 'password')
emily = User.create!(email: 'emily@test.com', password: 'password2')

5.times do
    jon.articles.create!(
        title: Faker::Lorem.sentence(word_count: 5),
        content: Faker::Lorem.sentence(word_count: 50)
    )
end

5.times do
    emily.articles.create!(
        title: Faker::Lorem.sentence(word_count: 5),
        content: Faker::Lorem.sentence(word_count: 50)
    )
end
