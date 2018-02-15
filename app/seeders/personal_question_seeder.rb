# GoodSeeder
class PersonalQuestionSeeder < ApplicationSeeder
  include Printable

  def initialize(creating_pts)
    super({
      :name  => "PersonalQuestion",
      :pts   => creating_pts
    })
  end

  def make
    to_string

    @pts.times do
      model = @model.new(
        title: 'test',
        description: 'teasfasdf',
        user_id: 1,
        answer: 'test'
      )

      model.save if @model.validate
    end

    to_string(false)
  end
end
