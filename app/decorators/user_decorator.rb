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

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def address1
    model.profile.address1 unless model.profile.nil?
  end

  def address2
    model.profile.address2 unless model.profile.nil?
  end

  def tel
    model.profile.tel unless model.profile.nil?
  end

  def blacklisted?
    'checked' if model.blacklist_flg
  end

  def self.search_conditions
    conditions = []

    role_selection = [
        { column: 'customer', name: 'Customer'},
        { column: 'staff',    name: 'Staff'},
        { column: 'provider', name: 'Provider'},
        { column: 'admin',    name: 'Admin'}
    ]

    conditions.push({ column: 'profile_first_name', type: 'input',  name: 'First Name', select: '' })
    conditions.push({ column: 'profile_last_name',  type: 'input',  name: 'Last Name',  select: '' })
    conditions.push({ column: 'email',              type: 'input',  name: 'Email',      select: '' })
    conditions.push({ column: 'role',               type: 'select', name: 'Role',       select: role_selection })
  end
end
