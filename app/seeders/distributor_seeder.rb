# IngredientSeeder
class DistributorSeeder < ApplicationSeeder
  include Printable

  def initialize(creating_pts)
    super({
      name: 'Distributor',
      pts:  creating_pts
    })
  end

  def make
    to_string

    @pts.times do
      model = @model.new(
        name: 'test',
        tel: 'test',
        address: 'test'
      )

      model.save if @model.validate
    end

    to_string(false)
  end
end
