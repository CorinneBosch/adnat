def add_new_org
  Organisation.create(    
    name: 'Hogwarts',
    hourly_rate: 12.50
  )
end

def post_create_organisation_params
  # post :create,
  {
    organisation: {
      name: 'Treehouse',
      hourly_rate: 18.00
    }
  }
end

def add_new_shift
  Shift.create(    
    employee: 'Gandalf',
    shift_start: Time.new(2021, 11, 27, 9, 30, 00),
    shift_end: Time.new(2021, 11, 27, 18, 11, 00),
    break_length: 30,
    organisation_id: Organisation.last.id, 
  )
end

def post_create_shift_params
  {
    shift: {   
      employee: 'Gandalf',
      shift_start_date: '2021-11-27',
      shift_start_time: '10:00',
      shift_end: Time.new(2021, 11, 27, 18, 11, 00),
      break_length: 30,
      organisation_id: Organisation.last.id, 
    }, organisation_id: Organisation.last.id
  }
end