json.extract! owner, :id, :name, :email, :phone, :address
json.created_at ownder.created_at.strftime('%Y-%m-%d %H:%M:%S')
json.updated_at ownder.updated_at.strftime('%Y-%m-%d %H:%M:%S')

json.pets owner.pets do |pet|
  json.extract! pet, :id, :name, :breed, :age, :notes
end