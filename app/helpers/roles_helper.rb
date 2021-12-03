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
