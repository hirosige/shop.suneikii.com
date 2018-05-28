def blank_err_msg(attribute)
  "#{attribute} cant be blank"
end

def too_long_err_msg(attribute, size)
  "#{attribute} is too long (maximum is #{size} characters)"
end

def taken_err_msg(attribute, suffix = nil)
  "#{attribute} has already been taken"
end

def taken_err_msg_with(attribute, another)
  "#{attribute} with #{another} set has already been taken"
end

def is_not_a_number_err_msg(attribute)
  "#{attribute} is not a number"
end

def is_greater_than_or_equal_to(attribute, number)
  "#{attribute} must be greater than or equal to #{number}"
end

def is_less_than_or_equal_to(attribute, number)
  "#{attribute} must be less than or equal to #{number}"
end

def must_exist(attribute)
  "#{attribute} must exist"
end

def invalid_mail(attribute)
  "#{attribute} is invalid mail format (ex: taro.yamada@deestaff.com)"
end

def invalid_date(attribute)
  "#{attribute} is not a date"
end

def invalid_datetime(attribute)
  "#{attribute} is not a datetime"
end

def past_date(attribute)
  "#{attribute} must be past date"
end

def future_date(attribute)
  "#{attribute} must be future date"
end

def comp_date(start_date, end_date)
  "#{end_date} must be after #{start_date}"
end

def image_black_list(attribute)
  "#{attribute} You are not allowed to upload \"pdf\" files, allowed types: jpg, jpeg, gif, png"
end

def attributes(attribte)
  I18n.t("activerecord.attributes.#{attribte}")
end
