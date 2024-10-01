json.extract! pet, :id, :name, :breed, :age, :created_at, :updated_at

json.owner do
  json.extract! pet.owner, :id, :name, :email, :phone, :address
end

json.appointments pet.appointments do |appointment|
  json.extract! appointment, :id, :date, :start_time, :end_time, :description, :notes
end

if pet.image.attached?
  json.image_url url_for(pet.image)
else
  json.image_url nil
end
