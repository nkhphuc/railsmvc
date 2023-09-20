class OrderingService
  attr_reader :item

  def initialize(item)
    @item = item
  end

  def move_up
    set_order if item.order == nil
    adjacent_item = @item.class.where('`order` < ?', @item.order).order(order: :desc).first

    if adjacent_item
        swap_orders(adjacent_item)
    end
  end

  def move_down
    set_order if item.order == nil
    adjacent_item = @item.class.where('`order` > ?', @item.order).order(:order).first

    if adjacent_item
        swap_orders(adjacent_item)
    end
  end

  private

  def set_order
    @item.update(order: @item.class.maximum(:order) + 1)
  end

  def swap_orders(item)
    temp_order = @item.order
    @item.update(order: item.order)
    item.update(order: temp_order)
  end
end
