json.extract! appointment, :id, :pet_id, :date, :start_time, :end_time, :description, :notes, :created_at, :updated_at

json.pet do
  json.extract! appointment.pet, :id, :name, :breed, :age, :notes
end

json.owner do
  json.extract! appointment.pet.owner, :id, :name, :email
end

json.user do
  json.extract! appointment.pet.user, :id, :username, :first_name, :last_name, :email, :phone
end