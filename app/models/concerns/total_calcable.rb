module TotalCalcable
  extend ActiveSupport::Concern

  def set_default_time
    self.published_start_time = Time.zone.now
  end

  def calc_sub_amount
    self.sub_amount = self.good.price * self.pts
  end

  def change_pts(pts)
    if pts <= 0
      raise "can't input 0 and less for quantity"
    else
      self.pts = pts
      self.calc_sub_amount
      save
    end
  end

end
