def add_new_org
  Organisation.create(    
    name: 'Hogwarts',
    hourly_rate: 12.50
  )
end