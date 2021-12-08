module ApplicationHelper

  def default_avatar(user)
    if !user.avatar.present?
      return "https://68.media.tumblr.com/7d65a925636d6e3df94e2ebe30667c29/tumblr_nq1zg0MEn51qg6rkio1_500.jpg"
    end
  end

end
