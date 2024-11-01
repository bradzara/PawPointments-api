json.extract! user, :id, :username, :first_name, :last_name, :email, :phone, :created_at, :updated_at

if user.profile_picture.attached?
  json.profile_picture_url url_for(user.profile_picture)
else
  json.profile_picture_url nil
end