class UserDecorator < Draper::Decorator
  delegate_all

  def your_id_sign
    "<span class='label label-warning'>It's you!!</span>".html_safe if h.current_user.id == model.id
  end

  def who_are_you
    h.current_user.role.capitalize
  end

  def first_name
    model.profile.first_name unless model.profile.nil?
  end

  def last_name
    model.profile.last_name unless model.profile.nil?
  end

  def blacklisted?
    'checked' if model.blacklist_flg
  end
end
