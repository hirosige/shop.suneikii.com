# ColorSeeder
class SiteSeeder < ApplicationSeeder
  include Printable

  def initialize(creating_pts)
    super({
      name: 'Site',
      pts: creating_pts
    })
  end

  def make
    to_string

    @pts.times do
      model = @model.new(
        name:              'test',
        email:             'test@gmail.com',
        tel1:              'test',
        tel2:              'test',
        privacy_policy:    'test',
        condition_of_use: 'test'
      )

      model.save if @model.validate
    end

    to_string(false)
  end
end
