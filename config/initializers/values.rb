Dir.glob("app/values/application_value.rb") do |f|
  require_dependency Rails.root.join(f)
end

Dir.glob("app/values/*_value.rb") do |f|
  require_dependency Rails.root.join(f)
end
