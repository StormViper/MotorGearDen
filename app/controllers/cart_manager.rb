module CartManager
	class << self
def clear_cart!(current_user)
  @cart = current_user.cart
  @slots = @cart.slot.first
  @slots.slot_one = nil
  @slots.slot_two = nil
  @slots.slot_three = nil
  @slots.slot_four = nil
  @slots.slot_five = nil

  @slots.slot_six = nil
  @slots.slot_seven = nil
  @slots.slot_eight = nil
  @slots.slot_nine = nil
  @slots.slot_ten = nil
  @slots.save
  @cart.cart_count = 0
  @cart.save
end
	end
end