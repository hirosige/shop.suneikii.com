Dir.glob("app/seeders/concerns/*.rb") do |f|
  require_dependency Rails.root.join(f)
end

Dir.glob("app/seeders/seed_manager.rb") do |f|
  require_dependency Rails.root.join(f)
end

Dir.glob("app/seeders/*_seeder.rb") do |f|
  require_dependency Rails.root.join(f)
end