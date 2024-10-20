json.extract! appointment, :id, :pet_id, :date, :formatted_start_time, :formatted_end_time, :description, :notes, :created_at, :updated_at

# json.start_time appointment.formatted_start_time
# json.end_time appointment.formatted_end_time

json.pet do
  json.extract! appointment.pet, :id, :name, :breed, :age, :notes
end

json.owner do
  json.extract! appointment.pet.owner, :id, :name, :email
end