# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Band.destroy_all
Venue.destroy_all
Gig.destroy_all

30.times do
  Band.create(name: Faker::Commerce.product_name)
end

10.times do
  array = [Faker::Company.name, Faker::Commerce.color, Faker::Commerce.product_name]
  venue_first_name = array.sample
  array.reject! { |i| i == venue_first_name}
  venue_second_name = array.sample
  venue_name = (venue_first_name + venue_second_name).titleize

  Venue.create(
    name: venue_name,
    street_address: Faker::Address.street_address,
    zipcode: Faker::Address.zip
  )
end

30.times do
  year = "2014"
  month = rand(10..12).to_s

  case month
  when "10"
    day = rand(20..31).to_s
  when "11"
    day = rand(1..30).to_s
  when "12"
    day = rand(1..31).to_s
  end

  date = year + "-" + month + "-" + day
  band = Band.all.sample
  venue = Venue.all.sample

  Gig.create(
    showdate: Date.parse(date),
    band_id: band.id,
    venue_id: venue.id,
    price: rand(0..50),
    url: "#"
  )
end

