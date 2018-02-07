module AdminHelper

  def render_menu
    # Initialize Menu
    @menu = MenuService.new

    # Home
    home = CategoryService.new({
      :name => "Home",
      :controller => params[:controller]
    })

    home.add(ItemService.new({
      :name => "Settings",
      :controller => params[:controller],
      :link => ''
    }))

    # Members
    members = CategoryService.new({
      :name => "Members",
      :controller => params[:controller]
    })

    members.add(ItemService.new({
      :name => "Users",
      :controller => params[:controller],
      :link => admin_users_path
    }))

    # Products
    products = CategoryService.new({
      :name => "Products",
      :controller => params[:controller]
    })

    products.add(ItemService.new({
      :name => "Goods",
      :controller => params[:controller],
      :link => admin_products_goods_path
    }))

    products.add(ItemService.new({
      :name => "GoodsCategories",
      :controller => params[:controller],
      :link => admin_products_goods_categories_path
    }))

    products.add(ItemService.new({
      :name => "Colors",
      :controller => params[:controller],
      :link => admin_products_colors_path
    }))

    products.add(ItemService.new({
      :name => "Ingredients",
      :controller => params[:controller],
      :link => admin_products_ingredients_path
    }))

    products.add(ItemService.new({
      :name => "Ingredients",
      :controller => params[:controller],
      :link => admin_products_ingredients_path
    }))

    products.add(ItemService.new({
      :name => "Sizes",
      :controller => params[:controller],
      :link => admin_products_sizes_path
    }))

    # Dealings
    dealings = CategoryService.new({
      :name => "Dealings",
      :controller => params[:controller]
    })

    dealings.add(ItemService.new({
      :name => "Orders",
      :controller => params[:controller],
      :link => admin_dealings_orders_path
    }))

    # Set Categories
    @menu.add(home)
    @menu.add(products)
    @menu.add(dealings)
    @menu.add(members)

    @menu.show.html_safe
  end
end

