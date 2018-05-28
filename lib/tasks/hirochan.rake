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

namespace :hirochan do
  namespace :seeder do
    task "exec" => :environment do
      CREATING_PTS = 100
      PRIORITIES = %w[
        ColorSeeder
        DistributorSeeder
        IngredientSeeder
        PaymentMethodSeeder
        ShopperSeeder
        SiteSeeder
        SizeSeeder
        UserSeeder
        GoodsCategorySeeder
        CollectionSeeder
      ]

      SECONDARIES = %w[
        OrderSeeder
        GoodSeeder
        CartSeeder
      ]

      children_seeders = Array.new
      secondary_seeders = Array.new
      parent_seeders = Array.new

      Dir.glob("app/seeders/*_seeder.rb") do |f|

        if optimize_class_mame(f)
          class_name = optimize_class_mame(f)

          if PRIORITIES.include?(class_name)
            children_seeders.push(class_name.constantize.new(CREATING_PTS))
          elsif SECONDARIES.include?(class_name)
            secondary_seeders.push(class_name.constantize.new(CREATING_PTS))
          else
            parent_seeders.push(class_name.constantize.new(CREATING_PTS))
          end
        end
      end

      children_seeders.each do |seeder|
        seeder.make
      end

      secondary_seeders.each do |seeder|
        seeder.make
      end

      parent_seeders.each do |seeder|
        seeder.make
      end

    end

  end
end
