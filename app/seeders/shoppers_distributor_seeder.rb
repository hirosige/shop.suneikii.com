# IngredientSeeder
class ShoppersDistributorSeeder < ApplicationSeeder
  include Printable

  def initialize(creating_pts)
    super({
      name: 'ShoppersDistributor',
      pts:  creating_pts
    })
  end

  def make
    to_string

    @pts.times do
      model = @model.new(
        shopper_id: Shopper.all.sample.id,
        distributor_id: Distributor.all.sample.id
      )

      model.save if @model.validate
    end

    to_string(false)
  end
end
