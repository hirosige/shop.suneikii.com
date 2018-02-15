# ColorSeeder
class CollectionSeeder < ApplicationSeeder
  include Printable

  def initialize(creating_pts)
    super({
      name: 'Collection',
      pts: creating_pts
    })
  end

  def make
    to_string

    @pts.times do
      model = @model.new(
        start_at: DateTime.now,
        end_at:   DateTime.now,
        discount_rate: 30
      )

      model.save if @model.validate
    end

    to_string(false)
  end
end
