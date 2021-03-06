module FriendshipsHelper


  def friendswith?(user)
    !current_user.friendships.find_by(friend_id: user).nil? ||
    !current_user.inverse_friendships.find_by(friend_id: current_user, user_id: user).nil?
  end

  def inversefriend?(user)
    !current_user.inverse_friendships.find_by(friend_id: current_user, user_id: user).nil?
  end

end
