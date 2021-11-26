# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

organisations = [
  {
    name: 'Workforce',
    hourly_rate: 12.50
  },
  {
    name: 'Makers',
    hourly_rate: 15.00
  },
  {
    name: 'Tanda',
    hourly_rate: 18.00
  }
]

organisations.each { |org| Organisation.create(org) }
