def optimize_class_mame(f)
  f.split('/').each do |part|
    if part.include?('.rb') && part != "application_seeder.rb"
      return classify(part.split('.')[0])
    end
  end

  false
end

def classify(name)
  name.split('_').map(&:capitalize).join('')
end

task "seeder:exec" => :environment do
  CREATING_PTS = 100
  seeders = Array.new

  Dir.glob("app/seeders/*_seeder.rb") do |f|

    if optimize_class_mame(f)
      class_name = optimize_class_mame(f)
      seeders.push(class_name.constantize.new(CREATING_PTS))
    end
  end

  seeders.each do |seeder|
    seeder.make
  end

end

