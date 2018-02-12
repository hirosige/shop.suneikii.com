require 'faker'

class ApplicationSeeder
  attr_accessor :model
  attr_accessor :pts
  attr_accessor :name

  def initialize(params)
    @model = params[:model]
    @pts   = params[:pts]
    @name  = params[:name]

    clean_model
    clean_db
  end

  def clean_model
    @model = @name.constantize
  end

  def clean_db
    @model.destroy_all
  end
end