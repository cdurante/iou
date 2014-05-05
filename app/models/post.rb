def user_name=(name)
  user = User.find_by_name(name)
  if user
    self.user_id = user.id
  else
    errors[:user_name] << "Invalid name entered"
  end
end

def user_name
  User.find(user_id).name if user_id
end

