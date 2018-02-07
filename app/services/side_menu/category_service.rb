class CategoryService
  attr_accessor :controller
  attr_accessor :name

  def initialize(params)
    @controller = params[:controller]
    @name = params[:name]
    @items = Array.new
  end

  def add(item)
    @items.push(item)
  end

  def show
    output = ""
    output += "<div class='item'>"
    output += "  <a class='#{active?} title'>"
    output += "    <i class='dropdown icon'></i>"
    output += "    #{@name}"
    output += "  </a>"
    output += "  <div class='#{active?} content'>"

    @items.each do |item|
      output += "  <a class='#{item.active?} item' href='#{item.link}'>"
      output += "#{item.name}"
      output += "  </a>"
    end

    output += "  </div>"
    output += "</div>"
    output
  end

  def active?
    if @controller.split('/')[1] == @name.downcase
      return "active"
    end

    ""
  end
end