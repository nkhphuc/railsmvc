class OrderingService
  def self.move_up(item)
    adjacent_item = item.class.where('`order` < ?', item.order).order(order: :desc).first

    if adjacent_item
      swap_orders(item, adjacent_item)
    end
  end

  def self.move_down(item)
    adjacent_item = item.class.where('`order` > ?', item.order).order(:order).first

    if adjacent_item
      swap_orders(item, adjacent_item)
    end
  end

  private

  def self.swap_orders(item1, item2)
    temp_order = item1.order
    item1.update(order: item2.order)
    item2.update(order: temp_order)
  end
end
