module CurrentCart
  extend ActiveSupport::Concern


  private

  def set_cart
    @cart = current_user.cart || Cart.create(user_id: current_user.id)
  end
end
