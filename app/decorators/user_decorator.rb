class UserDecorator < Draper::Decorator
  delegate_all

  def your_id_sign
    "<span class='label label-warning'>It's you!!</span>".html_safe if h.current_user.id == model.id
  end

  def who_are_you
    model.role.capitalize
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

  def self.search_conditions
    conditions = []
    conditions.push({ column: 'profile_first_name', type: 'input',  name: 'First Name' })
    conditions.push({ column: 'profile_last_name',  type: 'input',  name: 'Last Name' })
    conditions.push({ column: 'email',              type: 'input',  name: 'Email' })
    conditions.push({ column: 'role',               type: 'select', name: 'Role' })
  end
end
