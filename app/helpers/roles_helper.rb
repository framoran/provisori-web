module RolesHelper
  def admin()
    if current_user_role == 'admin'
      return true
    else false
    end
  end

  def at_least_registered()
    if current_user_role == 'admin' || current_user_role == 'registered'
      return true
    else false
    end
  end
end

def can_edit?(comments)
  if !logged_in?
    return false
  end

  case(current_user_role)
  when 'admin' then  true
  when 'registered' then current_user.id == comments.user.id
  else false
  end
end

def user_can_edit(user)
  case(current_user_role)
  when 'admin' then  true
  when 'registered' then current_user.id == user.id
  else false
  end
end
