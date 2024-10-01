json.extract! owner, :id, :name, :email, :phone, :address
json.created_at owner.created_at.strftime('%Y-%m-%d %H:%M:%S')
json.updated_at owner.updated_at.strftime('%Y-%m-%d %H:%M:%S')

json.pets owner.pets do |pet|
  json.extract! pet, :id, :name, :breed, :age, :notes

  json.appointments pet.appointments do |appointment|
    json.extract! appointment, :date, :start_time, :end_time, :description, :notes
  end
end