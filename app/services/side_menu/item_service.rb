class ItemService
  attr_accessor :name
  attr_accessor :link
  attr_accessor :active
  attr_accessor :controller

  def initialize(params)
    @name = params[:name]
    @controller = params[:controller]
    @link = params[:link]
  end

  def active?
    if @controller.split('/')[2] == @name.downcase
      return "active"
    end

    ""
  end
end