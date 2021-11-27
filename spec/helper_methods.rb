def add_new_org
  Organisation.create(    
    name: 'Hogwarts',
    hourly_rate: 12.50
  )
end

def add_new_shift
  Shift.create(    
    employee: 'Gandalf',
    shift_start: Time.new(2021, 11, 27, 9, 30, 00),
    shift_end: Time.new(2021, 11, 27, 18, 11, 00).strftime('%H:%M'),
    break_length: 30,
    organisation_id: Organisation.last.id, 
  )
end