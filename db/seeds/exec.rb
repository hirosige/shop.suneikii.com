require('./db/seeds/entities/concerns/printable.rb')

require('./db/seeds/seed_manager.rb')

class Exec
  CREATING_PTS = 1000

  def exec
    SeedManager.exec(CountrySeeds.new)
    SeedManager.exec(ProvinceSeeds.new)
    SeedManager.exec(DistrictSeeds.new)
    SeedManager.exec(SubDistrictSeeds.new)
    SeedManager.exec(SubDistrictV2Seeds.new)
    SeedManager.exec(RoomTypeSeeds.new)
    SeedManager.exec(ProviderSeeds.new)
    SeedManager.exec(LandCategorySeeds.new)

    # if Rails.env.development?
      SeedManager.exec(ApartmentSeeds.new(CREATING_PTS))
    # end

    # land = LandSeeds.new(1000)
    # land.exec
  end
end

exec = Exec.new
exec.exec