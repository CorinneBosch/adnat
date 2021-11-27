# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'time'

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

shifts = [
  {
    employee: 'Rubeus Hagrid',
    shift_start: Time.new(2021, 11, 26, 11, 15),
    shift_end: Time.new(2021, 11, 26, 22, 20).strftime('%H:%M'),
    break_length: 45,
    organisation_id: 1, 
  },
  {
    employee: 'Mrs. McGonagall',
    shift_start: Time.new(2021, 11, 27, 9, 30),
    shift_end: Time.new(2021, 11, 27, 18, 11).strftime('%H:%M'),
    break_length: 30,
    organisation_id: 1, 
  },
  {
    employee: 'Harry Potter',
    shift_start: Time.new(2021, 11, 27, 12, 05),
    shift_end: Time.new(2021, 11, 27, 21, 45).strftime('%H:%M'),
    break_length: 45,
    organisation_id: 2, 
  },
  {
    employee: 'Albus Dumbledore',
    shift_start: Time.new(2021, 11, 27, 9, 30),
    shift_end: Time.new(2021, 11, 27, 18, 11).strftime('%H:%M'),
    break_length: 30,
    organisation_id: 2, 
  },
  {
    employee: 'Hermione Granger',
    shift_start: Time.new(2021, 11, 26, 11, 15),
    shift_end: Time.new(2021, 11, 26, 22, 20).strftime('%H:%M'),
    break_length: 45,
    organisation_id: 3, 
  }
]

shifts.each { |shift| Shift.create(shift) }

