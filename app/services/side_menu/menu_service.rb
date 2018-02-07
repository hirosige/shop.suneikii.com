class MenuService

  def initialize
    @categories = Array.new
  end

  def add(category)
    @categories.push(category)
  end

  def show
    output = ""

    @categories.each do |category|
      output += category.show
    end

    output
  end
end