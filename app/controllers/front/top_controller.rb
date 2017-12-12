class Front::TopController < FrontTopController

  # TODO : Change limits number to manifests file
  def home
    #@new_arrivals = random_good(4)
    #@best_sales = random_good(8)
  end

  def money_transfer

  end

  def create_transaction

  end
  private

  def random_good(limit)
    #Good.where('id >= ?', rand(Good.first.id..Good.last.id)).first.limit(limit)
  end
end
