# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'rest-client'
Champion.destroy_all
User.destroy_all
# Championlist.destroy_all

rm = RestClient.get 'http://ddragon.leagueoflegends.com/cdn/10.4.1/data/en_US/champion.json', {accept: :json}

rm_array = JSON.parse(rm)['data']


ex = rm_array.each do |k,character| 

    

    Champion.create(
        name: character["name"], 
        title: character["title"],
        blurb: character["blurb"],
        image: character["image"]["full"],
        tags: character["tags"]
    )
end

angelo = User.create(username: 'Angelo' , password: '123')
victoria = User.create(username: 'victoria' , password: '123')

puts ("done!") 